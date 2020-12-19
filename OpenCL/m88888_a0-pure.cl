/**
 * Author......: See docs/credits.txt
 * License.....: MIT
 */

//#define NEW_SIMD_CODE

#ifdef KERNEL_STATIC
#include "inc_vendor.h"
#include "inc_types.h"
#include "inc_platform.cl"
#include "inc_common.cl"
#include "inc_rp.h"
#include "inc_rp.cl"
#include "inc_scalar.cl"
#endif

KERNEL_FQ void m88888_mxx (KERN_ATTR_RULES ())
{
  /**
   * modifier
   */

  const u64 gid = get_global_id (0);

  if (gid >= gid_max) return;

  /**
   * base
   */

  COPY_PW (pws[gid]);

  /**
   * loop
   */

  for (u32 il_pos = 0; il_pos < il_cnt; il_pos++)
  {
    pw_t tmp = PASTE_PW;

    tmp.pw_len = apply_rules (rules_buf[il_pos].cmds, tmp.i, tmp.pw_len);

    u64 num = 14695981039346656037UL;

    u8 *p = (u8 *)tmp.i;

    for (u32 i = 0; i < tmp.pw_len; i++)
    {
      num ^= (p[i]);
      num *= 1099511628211;
    }

    const u32 r0 = l32_from_64_S (num);
    const u32 r1 = h32_from_64_S (num);
    const u32 r2 = 0;
    const u32 r3 = 0;

    COMPARE_M_SCALAR_2 (r0, r1, r2, r3);
  }
}

KERNEL_FQ void m88888_sxx (KERN_ATTR_RULES ())
{
  /**
   * modifier
   */

  const u64 gid = get_global_id (0);

  if (gid >= gid_max) return;

  /**
   * digest
   */

  const u32 search[4] =
  {
    digests_buf[DIGESTS_OFFSET].digest_buf[DGST_R0],
    digests_buf[DIGESTS_OFFSET].digest_buf[DGST_R1],
    0,
    0
  };

  /**
   * base
   */

  COPY_PW (pws[gid]);

  /**
   * loop
   */

  for (u32 il_pos = 0; il_pos < il_cnt; il_pos++)
  {
    pw_t tmp = PASTE_PW;

    tmp.pw_len = apply_rules (rules_buf[il_pos].cmds, tmp.i, tmp.pw_len);

    u64 num = 14695981039346656037UL;

    u8 *p = (u8 *)tmp.i;

    for (u32 i = 0; i < tmp.pw_len; i++)
    {
      num ^= (p[i]);
      num *= 1099511628211;
    }

    const u32 r0 = l32_from_64_S (num);
    const u32 r1 = h32_from_64_S (num);
    const u32 r2 = 0;
    const u32 r3 = 0;

    COMPARE_S_SCALAR (r0, r1, r2, r3);
  }
}
