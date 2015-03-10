#include "avr/avr.h"
#include "avr/print.h"
#include "avr/cpucycles.h"
#include "avr/randombytes.h"
#include "norx/norx.h"

unsigned long long speedtest_norx(unsigned char *h, size_t hlen, unsigned char *p, size_t plen)
{
  unsigned char k[128];
  unsigned char n[64];
  randombytes(k, 128);
  randombytes(n, 64);
  
  uint32_t *t	= NULL;
  size_t tlen = 0;
  
  uint32_t c[(plen/4) + 10];
  size_t clen;
  
  unsigned long long t0, t1, t2, overhead;
  
  t0 = cpucycles();
  t1 = cpucycles();
 
  norx_aead_encrypt((unsigned char*)c, &clen,
		    h, hlen,
		    p, plen,
		    (unsigned char*)t, tlen,
		    n, k);

  t2 = cpucycles();
  overhead = t1 - t0;
  return t2 - t1 - overhead;
}

void speedtest_norx_different_sizes()
{
  int n;
  unsigned long long length;
  
  print("CPU cycles of NORX encryption: \n");
  for (n = 2; n < 11; n++)
  {
    length = (1UL << n);
    unsigned char h[length];
    unsigned char p[length];
    randombytes(h, length);
    randombytes(p, length);
    unsigned long long norx_cycles = speedtest_norx(h, length, p, length);
    print("Cycles for encrypting message of size ");
    printllu(2 * length);
    print(": ");
    printllu(norx_cycles);
    print(", cycles/byte: ");
    printllu(norx_cycles/(2 * length));
    print("\n");
  }
  print("\n");
}

void speedtest_norx_parts()
{
    uint32_t k[4]	= {0x00000000, 0x00000000, 0x00000000, 0x00000000};
    uint32_t n[2] 	= {0x00000000, 0x00000000};
    uint32_t h[2]	= {0x00000000, 0x00000000};
    uint32_t p[4]	= {0x00000000, 0x00000000, 0x00000000, 0x00000000};
    uint32_t *t		= NULL;

    size_t hlen = sizeof(h);
    size_t plen = sizeof(p);
    size_t tlen = 0;

    uint32_t c[(plen/4) + 10];
    size_t clen;
    
    unsigned long long t_start, t0, t1, t2, t3, t4, t5, t6, t7;

    t_start = cpucycles();
    t0 = cpucycles();
    norx_state_t state;
    t1 = cpucycles();
    norx_init(state, (unsigned char*)k, (unsigned char*)n);
    t2 = cpucycles();
    norx_process_header(state, (unsigned char*)h, hlen);
    t3 = cpucycles();
    norx_encrypt_msg(state, (unsigned char*)c, (unsigned char*)p, plen);
    t4 = cpucycles();
    norx_process_trailer(state, (unsigned char*)t, tlen);
    t5 = cpucycles();
    norx_output_tag(state, (unsigned char*)c + plen); /* append tag to ciphertext */
    t6 = cpucycles();
    clen = plen + BYTES(NORX_A);
    burn(state, 0, sizeof(norx_state_t));
    t7 = cpucycles();
    
    unsigned long long overhead = t0 - t_start;
    
    print("NORX parts and cycles (8-byte message):\n-----------------------------\n");
    
    print("Initialization:		");
    printllu(t2 - t1 - overhead);
    print("\n");
    
    print("Header processing:	");
    printllu(t3 - t2 - overhead);
    print("\n");
    
    print("Payload processing:	");
    printllu(t4 - t3 - overhead);
    print("\n");
    
    print("Trailer processing:	");
    printllu(t5 - t4 - overhead);
    print("\n");
    
    print("Outputting tag:		");
    printllu(t6 - t5 - overhead);
    print("\n");
    
    print("-----------------------------\n");
    print("Total:			");
    printllu(t7 - t0 - 7 * overhead);
    print("\n\n");
}

int main()
{  
  speedtest_norx_different_sizes();
  speedtest_norx_parts();
  avr_end(); 
  return 0;
}