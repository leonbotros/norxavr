#include "avr/avr.h"
#include "avr/print.h"
#include "norx/norx.h"

int main()
{
  /*
   * Values from page 56, full AEAD computation of NORX32-4-1
   */
  
  uint32_t k[4]	= {0x00112233, 0x44556677, 0x8899AABB, 0xCCDDEEFF};
  uint32_t n[2] = {0xFFFFFFFF, 0xFFFFFFFF};
  uint32_t h[2]	= {0x10000002, 0x30000004};
  uint32_t p[4]	= {0x80000007, 0x60000005, 0x40000003, 0x20000001};
  uint32_t *t	= NULL;
    
  size_t hlen = sizeof(h);
  size_t plen = sizeof(p);
  size_t tlen = 0;
  
  uint32_t c[(plen/4) + 10];
  size_t clen;
  
  print("Encryption parameters:\nK: ");
  bigint_print_hex((unsigned char*)k, sizeof(k));
  print("\nN: ");
  bigint_print_hex((unsigned char*)n, sizeof(n));
  print("\nH: ");
  bigint_print_hex((unsigned char*)h, hlen);
  print("\nP: ");
  bigint_print_hex((unsigned char*)p, plen);
  print("\n");

  norx_aead_encrypt((unsigned char*)c, &clen,
		    (unsigned char*)h, hlen,
		    (unsigned char*)p, plen,
		    (unsigned char*)t, tlen,
		    (unsigned char*)n, (unsigned char*)k);

  print("Encryption result:\nC: ");
  bigint_print_hex((unsigned char*) c, plen);
  print("\nA: ");
  bigint_print_hex(((unsigned char*) c) + plen, clen - plen);
  print("\n");
  
  avr_end();
  return 0;
}