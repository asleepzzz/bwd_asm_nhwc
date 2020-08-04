	.text
	;.amdgcn_target "amdgcn-amd-amdhsa--gfx908+sram-ecc"
	.weak	gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw ; -- Begin function gridwise_group_convolution_forward_implicit_gemm_v4r4_xdlops_nchw_kcyx_nkhw
	.p2align	8
	.type	gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw,@function


bfloat16_to_float:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001000: BF8C0000
	v_lshlrev_b32_e32 v0, 16, v0                               // 000000001004: 24000090
	s_setpc_b64 s[30:31]                                       // 000000001008: BE801D1E

float_to_bfloat16:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 00000000100C: BF8C0000
	s_mov_b32 s4, 0x7f800000                                   // 000000001010: BE8400FF 7F800000
	v_and_b32_e32 v1, s4, v0                                   // 000000001018: 26020004
	v_cmp_ne_u32_e32 vcc, s4, v1                               // 00000000101C: 7D9A0204
	s_and_saveexec_b64 s[4:5], vcc                             // 000000001020: BE84206A
	s_xor_b64 s[4:5], exec, s[4:5]                             // 000000001024: 8884047E
	s_cbranch_execnz BB1_3                                     // 000000001028: BF890006
	s_or_saveexec_b64 s[6:7], s[4:5]                           // 00000000102C: BE862104
	s_xor_b64 exec, exec, s[6:7]                               // 000000001030: 88FE067E
	s_cbranch_execnz BB1_4                                     // 000000001034: BF89000B

BB1_2:
	s_or_b64 exec, exec, s[6:7]                                // 000000001038: 87FE067E
	v_lshrrev_b32_e32 v0, 16, v1                               // 00000000103C: 20000290
	s_setpc_b64 s[30:31]                                       // 000000001040: BE801D1E

BB1_3:
	v_bfe_u32 v1, v0, 16, 1                                    // 000000001044: D1C80001 02052100
	s_movk_i32 s6, 0x7fff                                      // 00000000104C: B0067FFF
	v_add3_u32 v1, v0, v1, s6                                  // 000000001050: D1FF0001 001A0300
	s_or_saveexec_b64 s[6:7], s[4:5]                           // 000000001058: BE862104
	s_xor_b64 exec, exec, s[6:7]                               // 00000000105C: 88FE067E
	s_cbranch_execz BB1_2                                      // 000000001060: BF88FFF5

BB1_4:
	v_mov_b32_e32 v1, 0                                        // 000000001064: 7E020280
	v_or_b32_e32 v2, 0x10000, v0                               // 000000001068: 280400FF 00010000
	v_cmp_eq_u32_sdwa s[4:5], v0, v1 src0_sel:WORD_0 src1_sel:DWORD// 000000001070: 7D9402F9 06048400
	v_cndmask_b32_e64 v1, v2, v0, s[4:5]                       // 000000001078: D1000001 00120102
	s_or_b64 exec, exec, s[6:7]                                // 000000001080: 87FE067E
	v_lshrrev_b32_e32 v0, 16, v1                               // 000000001084: 20000290
	s_setpc_b64 s[30:31]                                       // 000000001088: BE801D1E

_ZN2ck22get_thread_local_1d_idEv:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 00000000108C: BF8C0000
	v_and_b32_e32 v0, 0x3ff, v0                                // 000000001090: 260000FF 000003FF
	s_setpc_b64 s[30:31]                                       // 000000001098: BE801D1E

_ZN2ck15get_block_1d_idEv:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 00000000109C: BF8C0000
	v_mov_b32_e32 v0, s4                                       // 0000000010A0: 7E000204
	s_setpc_b64 s[30:31]                                       // 0000000010A4: BE801D1E

_ZNK2ck12type_convertIfEclItEEfT_:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 0000000010A8: BF8C0000
	v_lshlrev_b32_e32 v0, 16, v2                               // 0000000010AC: 24000490
	s_setpc_b64 s[30:31]                                       // 0000000010B0: BE801D1E

_ZNK2ck12type_convertItEclIfEEtT_:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 0000000010B4: BF8C0000
	s_mov_b32 s4, 0x7f800000                                   // 0000000010B8: BE8400FF 7F800000
	v_and_b32_e32 v0, s4, v2                                   // 0000000010C0: 26000404
	v_cmp_ne_u32_e32 vcc, s4, v0                               // 0000000010C4: 7D9A0004
	s_and_saveexec_b64 s[4:5], vcc                             // 0000000010C8: BE84206A
	s_xor_b64 s[4:5], exec, s[4:5]                             // 0000000010CC: 8884047E
	s_cbranch_execnz BB5_3                                     // 0000000010D0: BF890006
	s_or_saveexec_b64 s[6:7], s[4:5]                           // 0000000010D4: BE862104
	s_xor_b64 exec, exec, s[6:7]                               // 0000000010D8: 88FE067E
	s_cbranch_execnz BB5_4                                     // 0000000010DC: BF89000B

BB5_2:
	s_or_b64 exec, exec, s[6:7]                                // 0000000010E0: 87FE067E
	v_lshrrev_b32_e32 v0, 16, v0                               // 0000000010E4: 20000090
	s_setpc_b64 s[30:31]                                       // 0000000010E8: BE801D1E

BB5_3:
	v_bfe_u32 v0, v2, 16, 1                                    // 0000000010EC: D1C80000 02052102
	s_movk_i32 s6, 0x7fff                                      // 0000000010F4: B0067FFF
	v_add3_u32 v0, v2, v0, s6                                  // 0000000010F8: D1FF0000 001A0102
	s_or_saveexec_b64 s[6:7], s[4:5]                           // 000000001100: BE862104
	s_xor_b64 exec, exec, s[6:7]                               // 000000001104: 88FE067E
	s_cbranch_execz BB5_2                                      // 000000001108: BF88FFF5

BB5_4:
	v_mov_b32_e32 v0, 0                                        // 00000000110C: 7E000280
	v_or_b32_e32 v1, 0x10000, v2                               // 000000001110: 280204FF 00010000
	v_cmp_eq_u32_sdwa s[4:5], v2, v0 src0_sel:WORD_0 src1_sel:DWORD// 000000001118: 7D9400F9 06048402
	v_cndmask_b32_e64 v0, v1, v2, s[4:5]                       // 000000001120: D1000000 00120501
	s_or_b64 exec, exec, s[6:7]                                // 000000001128: 87FE067E
	v_lshrrev_b32_e32 v0, 16, v0                               // 00000000112C: 20000090
	s_setpc_b64 s[30:31]                                       // 000000001130: BE801D1E

_ZN2ck15amd_buffer_loadIfLi1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001134: BF8C0000
	v_mov_b32_e32 v4, -1                                       // 000000001138: 7E0802C1
	v_mov_b32_e32 v5, 0x27000                                  // 00000000113C: 7E0A02FF 00027000
	v_add_lshl_u32 v3, v3, v2, 2                               // 000000001144: D1FE0003 020A0503
	s_mov_b64 s[6:7], exec                                     // 00000000114C: BE86017E

BB6_1:
	v_readfirstlane_b32 s8, v0                                 // 000000001150: 7E100500
	v_readfirstlane_b32 s9, v1                                 // 000000001154: 7E120501
	v_readfirstlane_b32 s10, v4                                // 000000001158: 7E140504
	v_readfirstlane_b32 s11, v5                                // 00000000115C: 7E160505
	v_cmp_eq_u64_e32 vcc, s[8:9], v[0:1]                       // 000000001160: 7DD40008
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[4:5]                  // 000000001164: D0EA0004 0002080A
	s_and_b64 s[4:5], vcc, s[4:5]                              // 00000000116C: 8684046A
	s_and_saveexec_b64 s[4:5], s[4:5]                          // 000000001170: BE842004
	s_nop 0                                                    // 000000001174: BF800000
	s_waitcnt vmcnt(0)                                         // 000000001178: BF8C0F70
	s_nop 0                                                    // 00000000117C: BF800000
	buffer_load_dword v2, v3, s[8:11], 0 offen                 // 000000001180: E0501000 80020203
	s_xor_b64 exec, exec, s[4:5]                               // 000000001188: 88FE047E
	s_cbranch_execnz BB6_1                                     // 00000000118C: BF89FFF0
	s_mov_b64 exec, s[6:7]                                     // 000000001190: BEFE0106
	s_waitcnt vmcnt(0)                                         // 000000001194: BF8C0F70
	v_mov_b32_e32 v0, v2                                       // 000000001198: 7E000302
	s_setpc_b64 s[30:31]                                       // 00000000119C: BE801D1E

_ZN2ck15amd_buffer_loadIfLi2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 0000000011A0: BF8C0000
	v_mov_b32_e32 v4, -1                                       // 0000000011A4: 7E0802C1
	v_mov_b32_e32 v5, 0x27000                                  // 0000000011A8: 7E0A02FF 00027000
	v_add_lshl_u32 v6, v3, v2, 2                               // 0000000011B0: D1FE0006 020A0503
	s_mov_b64 s[6:7], exec                                     // 0000000011B8: BE86017E

BB7_1:
	v_readfirstlane_b32 s8, v0                                 // 0000000011BC: 7E100500
	v_readfirstlane_b32 s9, v1                                 // 0000000011C0: 7E120501
	v_readfirstlane_b32 s10, v4                                // 0000000011C4: 7E140504
	v_readfirstlane_b32 s11, v5                                // 0000000011C8: 7E160505
	v_cmp_eq_u64_e32 vcc, s[8:9], v[0:1]                       // 0000000011CC: 7DD40008
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[4:5]                  // 0000000011D0: D0EA0004 0002080A
	s_and_b64 s[4:5], vcc, s[4:5]                              // 0000000011D8: 8684046A
	s_and_saveexec_b64 s[4:5], s[4:5]                          // 0000000011DC: BE842004
	s_nop 0                                                    // 0000000011E0: BF800000
	s_waitcnt vmcnt(0)                                         // 0000000011E4: BF8C0F70
	s_nop 0                                                    // 0000000011E8: BF800000
	buffer_load_dwordx2 v[2:3], v6, s[8:11], 0 offen           // 0000000011EC: E0541000 80020206
	s_xor_b64 exec, exec, s[4:5]                               // 0000000011F4: 88FE047E
	s_cbranch_execnz BB7_1                                     // 0000000011F8: BF89FFF0
	s_mov_b64 exec, s[6:7]                                     // 0000000011FC: BEFE0106
	s_waitcnt vmcnt(0)                                         // 000000001200: BF8C0F70
	v_mov_b32_e32 v0, v2                                       // 000000001204: 7E000302
	v_mov_b32_e32 v1, v3                                       // 000000001208: 7E020303
	s_setpc_b64 s[30:31]                                       // 00000000120C: BE801D1E

_ZN2ck15amd_buffer_loadIfLi4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001210: BF8C0000
	v_mov_b32_e32 v6, -1                                       // 000000001214: 7E0C02C1
	v_mov_b32_e32 v7, 0x27000                                  // 000000001218: 7E0E02FF 00027000
	v_add_lshl_u32 v8, v3, v2, 2                               // 000000001220: D1FE0008 020A0503
	s_mov_b64 s[6:7], exec                                     // 000000001228: BE86017E

BB8_1:
	v_readfirstlane_b32 s8, v0                                 // 00000000122C: 7E100500
	v_readfirstlane_b32 s9, v1                                 // 000000001230: 7E120501
	v_readfirstlane_b32 s10, v6                                // 000000001234: 7E140506
	v_readfirstlane_b32 s11, v7                                // 000000001238: 7E160507
	v_cmp_eq_u64_e32 vcc, s[8:9], v[0:1]                       // 00000000123C: 7DD40008
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]                  // 000000001240: D0EA0004 00020C0A
	s_and_b64 s[4:5], vcc, s[4:5]                              // 000000001248: 8684046A
	s_and_saveexec_b64 s[4:5], s[4:5]                          // 00000000124C: BE842004
	s_nop 0                                                    // 000000001250: BF800000
	s_waitcnt vmcnt(0)                                         // 000000001254: BF8C0F70
	s_nop 0                                                    // 000000001258: BF800000
	buffer_load_dwordx4 v[2:5], v8, s[8:11], 0 offen           // 00000000125C: E05C1000 80020208
	s_xor_b64 exec, exec, s[4:5]                               // 000000001264: 88FE047E
	s_cbranch_execnz BB8_1                                     // 000000001268: BF89FFF0
	s_mov_b64 exec, s[6:7]                                     // 00000000126C: BEFE0106
	s_waitcnt vmcnt(0)                                         // 000000001270: BF8C0F70
	v_mov_b32_e32 v0, v2                                       // 000000001274: 7E000302
	v_mov_b32_e32 v1, v3                                       // 000000001278: 7E020303
	v_mov_b32_e32 v2, v4                                       // 00000000127C: 7E040304
	v_mov_b32_e32 v3, v5                                       // 000000001280: 7E060305
	s_setpc_b64 s[30:31]                                       // 000000001284: BE801D1E

_ZN2ck15amd_buffer_loadIDF16_Li1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001288: BF8C0000
	v_add_u32_e32 v2, v3, v2                                   // 00000000128C: 68040503
	v_ashrrev_i32_e32 v3, 31, v2                               // 000000001290: 2206049F
	v_lshlrev_b64 v[2:3], 1, v[2:3]                            // 000000001294: D28F0002 00020481
	v_add_co_u32_e32 v0, vcc, v0, v2                           // 00000000129C: 32000500
	v_addc_co_u32_e32 v1, vcc, v1, v3, vcc                     // 0000000012A0: 38020701
	s_nop 0                                                    // 0000000012A4: BF800000
	s_nop 0                                                    // 0000000012A8: BF800000
	flat_load_ushort v0, v[0:1]                                // 0000000012AC: DC480000 00000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000012B4: BF8C0070
	s_setpc_b64 s[30:31]                                       // 0000000012B8: BE801D1E

_ZN2ck15amd_buffer_loadIDF16_Li2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 0000000012BC: BF8C0000
	v_mov_b32_e32 v4, -1                                       // 0000000012C0: 7E0802C1
	v_mov_b32_e32 v5, 0x27000                                  // 0000000012C4: 7E0A02FF 00027000
	v_add_lshl_u32 v3, v3, v2, 1                               // 0000000012CC: D1FE0003 02060503
	s_mov_b64 s[6:7], exec                                     // 0000000012D4: BE86017E

BB10_1:
	v_readfirstlane_b32 s8, v0                                 // 0000000012D8: 7E100500
	v_readfirstlane_b32 s9, v1                                 // 0000000012DC: 7E120501
	v_readfirstlane_b32 s10, v4                                // 0000000012E0: 7E140504
	v_readfirstlane_b32 s11, v5                                // 0000000012E4: 7E160505
	v_cmp_eq_u64_e32 vcc, s[8:9], v[0:1]                       // 0000000012E8: 7DD40008
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[4:5]                  // 0000000012EC: D0EA0004 0002080A
	s_and_b64 s[4:5], vcc, s[4:5]                              // 0000000012F4: 8684046A
	s_and_saveexec_b64 s[4:5], s[4:5]                          // 0000000012F8: BE842004
	s_nop 0                                                    // 0000000012FC: BF800000
	s_waitcnt vmcnt(0)                                         // 000000001300: BF8C0F70
	s_nop 0                                                    // 000000001304: BF800000
	buffer_load_dword v2, v3, s[8:11], 0 offen                 // 000000001308: E0501000 80020203
	s_xor_b64 exec, exec, s[4:5]                               // 000000001310: 88FE047E
	s_cbranch_execnz BB10_1                                    // 000000001314: BF89FFF0
	s_mov_b64 exec, s[6:7]                                     // 000000001318: BEFE0106
	s_waitcnt vmcnt(0)                                         // 00000000131C: BF8C0F70
	v_mov_b32_e32 v0, v2                                       // 000000001320: 7E000302
	s_setpc_b64 s[30:31]                                       // 000000001324: BE801D1E

_ZN2ck15amd_buffer_loadIDF16_Li4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001328: BF8C0000
	v_mov_b32_e32 v4, -1                                       // 00000000132C: 7E0802C1
	v_mov_b32_e32 v5, 0x27000                                  // 000000001330: 7E0A02FF 00027000
	v_add_lshl_u32 v6, v3, v2, 1                               // 000000001338: D1FE0006 02060503
	s_mov_b64 s[6:7], exec                                     // 000000001340: BE86017E

BB11_1:
	v_readfirstlane_b32 s8, v0                                 // 000000001344: 7E100500
	v_readfirstlane_b32 s9, v1                                 // 000000001348: 7E120501
	v_readfirstlane_b32 s10, v4                                // 00000000134C: 7E140504
	v_readfirstlane_b32 s11, v5                                // 000000001350: 7E160505
	v_cmp_eq_u64_e32 vcc, s[8:9], v[0:1]                       // 000000001354: 7DD40008
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[4:5]                  // 000000001358: D0EA0004 0002080A
	s_and_b64 s[4:5], vcc, s[4:5]                              // 000000001360: 8684046A
	s_and_saveexec_b64 s[4:5], s[4:5]                          // 000000001364: BE842004
	s_nop 0                                                    // 000000001368: BF800000
	s_waitcnt vmcnt(0)                                         // 00000000136C: BF8C0F70
	s_nop 0                                                    // 000000001370: BF800000
	buffer_load_dwordx2 v[2:3], v6, s[8:11], 0 offen           // 000000001374: E0541000 80020206
	s_xor_b64 exec, exec, s[4:5]                               // 00000000137C: 88FE047E
	s_cbranch_execnz BB11_1                                    // 000000001380: BF89FFF0
	s_mov_b64 exec, s[6:7]                                     // 000000001384: BEFE0106
	s_waitcnt vmcnt(0)                                         // 000000001388: BF8C0F70
	v_mov_b32_e32 v0, v2                                       // 00000000138C: 7E000302
	v_mov_b32_e32 v1, v3                                       // 000000001390: 7E020303
	s_setpc_b64 s[30:31]                                       // 000000001394: BE801D1E

_ZN2ck15amd_buffer_loadIDF16_Li8EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001398: BF8C0000
	v_mov_b32_e32 v6, -1                                       // 00000000139C: 7E0C02C1
	v_mov_b32_e32 v7, 0x27000                                  // 0000000013A0: 7E0E02FF 00027000
	v_add_lshl_u32 v8, v3, v2, 1                               // 0000000013A8: D1FE0008 02060503
	s_mov_b64 s[6:7], exec                                     // 0000000013B0: BE86017E

BB12_1:
	v_readfirstlane_b32 s8, v0                                 // 0000000013B4: 7E100500
	v_readfirstlane_b32 s9, v1                                 // 0000000013B8: 7E120501
	v_readfirstlane_b32 s10, v6                                // 0000000013BC: 7E140506
	v_readfirstlane_b32 s11, v7                                // 0000000013C0: 7E160507
	v_cmp_eq_u64_e32 vcc, s[8:9], v[0:1]                       // 0000000013C4: 7DD40008
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]                  // 0000000013C8: D0EA0004 00020C0A
	s_and_b64 s[4:5], vcc, s[4:5]                              // 0000000013D0: 8684046A
	s_and_saveexec_b64 s[4:5], s[4:5]                          // 0000000013D4: BE842004
	s_nop 0                                                    // 0000000013D8: BF800000
	s_waitcnt vmcnt(0)                                         // 0000000013DC: BF8C0F70
	s_nop 0                                                    // 0000000013E0: BF800000
	buffer_load_dwordx4 v[2:5], v8, s[8:11], 0 offen           // 0000000013E4: E05C1000 80020208
	s_xor_b64 exec, exec, s[4:5]                               // 0000000013EC: 88FE047E
	s_cbranch_execnz BB12_1                                    // 0000000013F0: BF89FFF0
	s_mov_b64 exec, s[6:7]                                     // 0000000013F4: BEFE0106
	s_waitcnt vmcnt(0)                                         // 0000000013F8: BF8C0F70
	v_mov_b32_e32 v0, v2                                       // 0000000013FC: 7E000302
	v_mov_b32_e32 v1, v3                                       // 000000001400: 7E020303
	v_mov_b32_e32 v2, v4                                       // 000000001404: 7E040304
	v_mov_b32_e32 v3, v5                                       // 000000001408: 7E060305
	s_setpc_b64 s[30:31]                                       // 00000000140C: BE801D1E

_ZN2ck15amd_buffer_loadItLi1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001410: BF8C0000
	v_add_u32_e32 v2, v3, v2                                   // 000000001414: 68040503
	v_ashrrev_i32_e32 v3, 31, v2                               // 000000001418: 2206049F
	v_lshlrev_b64 v[2:3], 1, v[2:3]                            // 00000000141C: D28F0002 00020481
	v_add_co_u32_e32 v0, vcc, v0, v2                           // 000000001424: 32000500
	v_addc_co_u32_e32 v1, vcc, v1, v3, vcc                     // 000000001428: 38020701
	s_nop 0                                                    // 00000000142C: BF800000
	s_nop 0                                                    // 000000001430: BF800000
	flat_load_ushort v0, v[0:1]                                // 000000001434: DC480000 00000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000143C: BF8C0070
	s_setpc_b64 s[30:31]                                       // 000000001440: BE801D1E

_ZN2ck15amd_buffer_loadItLi2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001444: BF8C0000
	v_mov_b32_e32 v4, -1                                       // 000000001448: 7E0802C1
	v_mov_b32_e32 v5, 0x27000                                  // 00000000144C: 7E0A02FF 00027000
	v_add_lshl_u32 v3, v3, v2, 1                               // 000000001454: D1FE0003 02060503
	s_mov_b64 s[6:7], exec                                     // 00000000145C: BE86017E

BB14_1:
	v_readfirstlane_b32 s8, v0                                 // 000000001460: 7E100500
	v_readfirstlane_b32 s9, v1                                 // 000000001464: 7E120501
	v_readfirstlane_b32 s10, v4                                // 000000001468: 7E140504
	v_readfirstlane_b32 s11, v5                                // 00000000146C: 7E160505
	v_cmp_eq_u64_e32 vcc, s[8:9], v[0:1]                       // 000000001470: 7DD40008
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[4:5]                  // 000000001474: D0EA0004 0002080A
	s_and_b64 s[4:5], vcc, s[4:5]                              // 00000000147C: 8684046A
	s_and_saveexec_b64 s[4:5], s[4:5]                          // 000000001480: BE842004
	s_nop 0                                                    // 000000001484: BF800000
	s_waitcnt vmcnt(0)                                         // 000000001488: BF8C0F70
	s_nop 0                                                    // 00000000148C: BF800000
	buffer_load_dword v2, v3, s[8:11], 0 offen                 // 000000001490: E0501000 80020203
	s_xor_b64 exec, exec, s[4:5]                               // 000000001498: 88FE047E
	s_cbranch_execnz BB14_1                                    // 00000000149C: BF89FFF0
	s_mov_b64 exec, s[6:7]                                     // 0000000014A0: BEFE0106
	s_waitcnt vmcnt(0)                                         // 0000000014A4: BF8C0F70
	v_mov_b32_e32 v0, v2                                       // 0000000014A8: 7E000302
	s_setpc_b64 s[30:31]                                       // 0000000014AC: BE801D1E

_ZN2ck15amd_buffer_loadItLi4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 0000000014B0: BF8C0000
	v_mov_b32_e32 v4, -1                                       // 0000000014B4: 7E0802C1
	v_mov_b32_e32 v5, 0x27000                                  // 0000000014B8: 7E0A02FF 00027000
	v_add_lshl_u32 v6, v3, v2, 1                               // 0000000014C0: D1FE0006 02060503
	s_mov_b64 s[6:7], exec                                     // 0000000014C8: BE86017E

BB15_1:
	v_readfirstlane_b32 s8, v0                                 // 0000000014CC: 7E100500
	v_readfirstlane_b32 s9, v1                                 // 0000000014D0: 7E120501
	v_readfirstlane_b32 s10, v4                                // 0000000014D4: 7E140504
	v_readfirstlane_b32 s11, v5                                // 0000000014D8: 7E160505
	v_cmp_eq_u64_e32 vcc, s[8:9], v[0:1]                       // 0000000014DC: 7DD40008
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[4:5]                  // 0000000014E0: D0EA0004 0002080A
	s_and_b64 s[4:5], vcc, s[4:5]                              // 0000000014E8: 8684046A
	s_and_saveexec_b64 s[4:5], s[4:5]                          // 0000000014EC: BE842004
	s_nop 0                                                    // 0000000014F0: BF800000
	s_waitcnt vmcnt(0)                                         // 0000000014F4: BF8C0F70
	s_nop 0                                                    // 0000000014F8: BF800000
	buffer_load_dwordx2 v[2:3], v6, s[8:11], 0 offen           // 0000000014FC: E0541000 80020206
	s_xor_b64 exec, exec, s[4:5]                               // 000000001504: 88FE047E
	s_cbranch_execnz BB15_1                                    // 000000001508: BF89FFF0
	s_mov_b64 exec, s[6:7]                                     // 00000000150C: BEFE0106
	s_waitcnt vmcnt(0)                                         // 000000001510: BF8C0F70
	v_mov_b32_e32 v0, v2                                       // 000000001514: 7E000302
	v_mov_b32_e32 v1, v3                                       // 000000001518: 7E020303
	s_setpc_b64 s[30:31]                                       // 00000000151C: BE801D1E

_ZN2ck15amd_buffer_loadItLi8EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001520: BF8C0000
	v_mov_b32_e32 v6, -1                                       // 000000001524: 7E0C02C1
	v_mov_b32_e32 v7, 0x27000                                  // 000000001528: 7E0E02FF 00027000
	v_add_lshl_u32 v8, v3, v2, 1                               // 000000001530: D1FE0008 02060503
	s_mov_b64 s[6:7], exec                                     // 000000001538: BE86017E

BB16_1:
	v_readfirstlane_b32 s8, v0                                 // 00000000153C: 7E100500
	v_readfirstlane_b32 s9, v1                                 // 000000001540: 7E120501
	v_readfirstlane_b32 s10, v6                                // 000000001544: 7E140506
	v_readfirstlane_b32 s11, v7                                // 000000001548: 7E160507
	v_cmp_eq_u64_e32 vcc, s[8:9], v[0:1]                       // 00000000154C: 7DD40008
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]                  // 000000001550: D0EA0004 00020C0A
	s_and_b64 s[4:5], vcc, s[4:5]                              // 000000001558: 8684046A
	s_and_saveexec_b64 s[4:5], s[4:5]                          // 00000000155C: BE842004
	s_nop 0                                                    // 000000001560: BF800000
	s_waitcnt vmcnt(0)                                         // 000000001564: BF8C0F70
	s_nop 0                                                    // 000000001568: BF800000
	buffer_load_dwordx4 v[2:5], v8, s[8:11], 0 offen           // 00000000156C: E05C1000 80020208
	s_xor_b64 exec, exec, s[4:5]                               // 000000001574: 88FE047E
	s_cbranch_execnz BB16_1                                    // 000000001578: BF89FFF0
	s_mov_b64 exec, s[6:7]                                     // 00000000157C: BEFE0106
	s_waitcnt vmcnt(0)                                         // 000000001580: BF8C0F70
	v_mov_b32_e32 v0, v2                                       // 000000001584: 7E000302
	v_mov_b32_e32 v1, v3                                       // 000000001588: 7E020303
	v_mov_b32_e32 v2, v4                                       // 00000000158C: 7E040304
	v_mov_b32_e32 v3, v5                                       // 000000001590: 7E060305
	s_setpc_b64 s[30:31]                                       // 000000001594: BE801D1E

_ZN2ck16amd_buffer_storeIfLi1EEEvPKT_PS1_ii:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001598: BF8C0000
	flat_load_dword v0, v[0:1]                                 // 00000000159C: DC500000 00000000
	v_mov_b32_e32 v6, -1                                       // 0000000015A4: 7E0C02C1
	v_mov_b32_e32 v7, 0x27000                                  // 0000000015A8: 7E0E02FF 00027000
	v_add_lshl_u32 v1, v5, v4, 2                               // 0000000015B0: D1FE0001 020A0905
	s_mov_b64 s[6:7], exec                                     // 0000000015B8: BE86017E

BB17_1:
	v_readfirstlane_b32 s8, v2                                 // 0000000015BC: 7E100502
	v_readfirstlane_b32 s9, v3                                 // 0000000015C0: 7E120503
	v_readfirstlane_b32 s10, v6                                // 0000000015C4: 7E140506
	v_readfirstlane_b32 s11, v7                                // 0000000015C8: 7E160507
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]                       // 0000000015CC: 7DD40408
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]                  // 0000000015D0: D0EA0004 00020C0A
	s_and_b64 s[4:5], vcc, s[4:5]                              // 0000000015D8: 8684046A
	s_and_saveexec_b64 s[4:5], s[4:5]                          // 0000000015DC: BE842004
	s_nop 0                                                    // 0000000015E0: BF800000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000015E4: BF8C0070
	s_nop 0                                                    // 0000000015E8: BF800000
	buffer_store_dword v0, v1, s[8:11], 0 offen                // 0000000015EC: E0701000 80020001
	s_xor_b64 exec, exec, s[4:5]                               // 0000000015F4: 88FE047E
	s_cbranch_execnz BB17_1                                    // 0000000015F8: BF89FFF0
	s_mov_b64 exec, s[6:7]                                     // 0000000015FC: BEFE0106
	s_waitcnt vmcnt(0)                                         // 000000001600: BF8C0F70
	s_setpc_b64 s[30:31]                                       // 000000001604: BE801D1E

_ZN2ck16amd_buffer_storeIfLi2EEEvPKT_PS1_ii:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001608: BF8C0000
	flat_load_dwordx2 v[0:1], v[0:1]                           // 00000000160C: DC540000 00000000
	v_mov_b32_e32 v6, -1                                       // 000000001614: 7E0C02C1
	v_mov_b32_e32 v7, 0x27000                                  // 000000001618: 7E0E02FF 00027000
	v_add_lshl_u32 v4, v5, v4, 2                               // 000000001620: D1FE0004 020A0905
	s_mov_b64 s[6:7], exec                                     // 000000001628: BE86017E

BB18_1:
	v_readfirstlane_b32 s8, v2                                 // 00000000162C: 7E100502
	v_readfirstlane_b32 s9, v3                                 // 000000001630: 7E120503
	v_readfirstlane_b32 s10, v6                                // 000000001634: 7E140506
	v_readfirstlane_b32 s11, v7                                // 000000001638: 7E160507
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]                       // 00000000163C: 7DD40408
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]                  // 000000001640: D0EA0004 00020C0A
	s_and_b64 s[4:5], vcc, s[4:5]                              // 000000001648: 8684046A
	s_and_saveexec_b64 s[4:5], s[4:5]                          // 00000000164C: BE842004
	s_nop 0                                                    // 000000001650: BF800000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001654: BF8C0070
	s_nop 0                                                    // 000000001658: BF800000
	buffer_store_dwordx2 v[0:1], v4, s[8:11], 0 offen          // 00000000165C: E0741000 80020004
	s_xor_b64 exec, exec, s[4:5]                               // 000000001664: 88FE047E
	s_cbranch_execnz BB18_1                                    // 000000001668: BF89FFF0
	s_mov_b64 exec, s[6:7]                                     // 00000000166C: BEFE0106
	s_waitcnt vmcnt(0)                                         // 000000001670: BF8C0F70
	s_setpc_b64 s[30:31]                                       // 000000001674: BE801D1E

_ZN2ck16amd_buffer_storeIfLi4EEEvPKT_PS1_ii:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001678: BF8C0000
	flat_load_dwordx4 v[8:11], v[0:1]                          // 00000000167C: DC5C0000 08000000
	v_mov_b32_e32 v6, -1                                       // 000000001684: 7E0C02C1
	v_mov_b32_e32 v7, 0x27000                                  // 000000001688: 7E0E02FF 00027000
	v_add_lshl_u32 v0, v5, v4, 2                               // 000000001690: D1FE0000 020A0905
	s_mov_b64 s[6:7], exec                                     // 000000001698: BE86017E

BB19_1:
	v_readfirstlane_b32 s8, v2                                 // 00000000169C: 7E100502
	v_readfirstlane_b32 s9, v3                                 // 0000000016A0: 7E120503
	v_readfirstlane_b32 s10, v6                                // 0000000016A4: 7E140506
	v_readfirstlane_b32 s11, v7                                // 0000000016A8: 7E160507
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]                       // 0000000016AC: 7DD40408
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]                  // 0000000016B0: D0EA0004 00020C0A
	s_and_b64 s[4:5], vcc, s[4:5]                              // 0000000016B8: 8684046A
	s_and_saveexec_b64 s[4:5], s[4:5]                          // 0000000016BC: BE842004
	s_nop 0                                                    // 0000000016C0: BF800000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000016C4: BF8C0070
	s_nop 0                                                    // 0000000016C8: BF800000
	buffer_store_dwordx4 v[8:11], v0, s[8:11], 0 offen         // 0000000016CC: E07C1000 80020800
	s_xor_b64 exec, exec, s[4:5]                               // 0000000016D4: 88FE047E
	s_cbranch_execnz BB19_1                                    // 0000000016D8: BF89FFF0
	s_mov_b64 exec, s[6:7]                                     // 0000000016DC: BEFE0106
	s_waitcnt vmcnt(0)                                         // 0000000016E0: BF8C0F70
	s_setpc_b64 s[30:31]                                       // 0000000016E4: BE801D1E

_ZN2ck16amd_buffer_storeIDF16_Li1EEEvPKT_PS1_ii:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 0000000016E8: BF8C0000
	flat_load_ushort v6, v[0:1]                                // 0000000016EC: DC480000 06000000
	v_add_u32_e32 v0, v5, v4                                   // 0000000016F4: 68000905
	v_ashrrev_i32_e32 v1, 31, v0                               // 0000000016F8: 2202009F
	v_lshlrev_b64 v[0:1], 1, v[0:1]                            // 0000000016FC: D28F0000 00020081
	v_add_co_u32_e32 v0, vcc, v2, v0                           // 000000001704: 32000102
	v_addc_co_u32_e32 v1, vcc, v3, v1, vcc                     // 000000001708: 38020303
	s_nop 0                                                    // 00000000170C: BF800000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001710: BF8C0070
	s_nop 0                                                    // 000000001714: BF800000
	flat_store_short v[0:1], v6                                // 000000001718: DC680000 00000600
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001720: BF8C0070
	s_setpc_b64 s[30:31]                                       // 000000001724: BE801D1E

_ZN2ck16amd_buffer_storeIDF16_Li2EEEvPKT_PS1_ii:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001728: BF8C0000
	flat_load_dword v0, v[0:1]                                 // 00000000172C: DC500000 00000000
	v_mov_b32_e32 v6, -1                                       // 000000001734: 7E0C02C1
	v_mov_b32_e32 v7, 0x27000                                  // 000000001738: 7E0E02FF 00027000
	v_add_lshl_u32 v1, v5, v4, 1                               // 000000001740: D1FE0001 02060905
	s_mov_b64 s[6:7], exec                                     // 000000001748: BE86017E

BB21_1:
	v_readfirstlane_b32 s8, v2                                 // 00000000174C: 7E100502
	v_readfirstlane_b32 s9, v3                                 // 000000001750: 7E120503
	v_readfirstlane_b32 s10, v6                                // 000000001754: 7E140506
	v_readfirstlane_b32 s11, v7                                // 000000001758: 7E160507
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]                       // 00000000175C: 7DD40408
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]                  // 000000001760: D0EA0004 00020C0A
	s_and_b64 s[4:5], vcc, s[4:5]                              // 000000001768: 8684046A
	s_and_saveexec_b64 s[4:5], s[4:5]                          // 00000000176C: BE842004
	s_nop 0                                                    // 000000001770: BF800000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001774: BF8C0070
	s_nop 0                                                    // 000000001778: BF800000
	buffer_store_dword v0, v1, s[8:11], 0 offen                // 00000000177C: E0701000 80020001
	s_xor_b64 exec, exec, s[4:5]                               // 000000001784: 88FE047E
	s_cbranch_execnz BB21_1                                    // 000000001788: BF89FFF0
	s_mov_b64 exec, s[6:7]                                     // 00000000178C: BEFE0106
	s_waitcnt vmcnt(0)                                         // 000000001790: BF8C0F70
	s_setpc_b64 s[30:31]                                       // 000000001794: BE801D1E

_ZN2ck16amd_buffer_storeIDF16_Li4EEEvPKT_PS1_ii:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001798: BF8C0000
	flat_load_dwordx2 v[0:1], v[0:1]                           // 00000000179C: DC540000 00000000
	v_mov_b32_e32 v6, -1                                       // 0000000017A4: 7E0C02C1
	v_mov_b32_e32 v7, 0x27000                                  // 0000000017A8: 7E0E02FF 00027000
	v_add_lshl_u32 v4, v5, v4, 1                               // 0000000017B0: D1FE0004 02060905
	s_mov_b64 s[6:7], exec                                     // 0000000017B8: BE86017E

BB22_1:
	v_readfirstlane_b32 s8, v2                                 // 0000000017BC: 7E100502
	v_readfirstlane_b32 s9, v3                                 // 0000000017C0: 7E120503
	v_readfirstlane_b32 s10, v6                                // 0000000017C4: 7E140506
	v_readfirstlane_b32 s11, v7                                // 0000000017C8: 7E160507
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]                       // 0000000017CC: 7DD40408
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]                  // 0000000017D0: D0EA0004 00020C0A
	s_and_b64 s[4:5], vcc, s[4:5]                              // 0000000017D8: 8684046A
	s_and_saveexec_b64 s[4:5], s[4:5]                          // 0000000017DC: BE842004
	s_nop 0                                                    // 0000000017E0: BF800000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000017E4: BF8C0070
	s_nop 0                                                    // 0000000017E8: BF800000
	buffer_store_dwordx2 v[0:1], v4, s[8:11], 0 offen          // 0000000017EC: E0741000 80020004
	s_xor_b64 exec, exec, s[4:5]                               // 0000000017F4: 88FE047E
	s_cbranch_execnz BB22_1                                    // 0000000017F8: BF89FFF0
	s_mov_b64 exec, s[6:7]                                     // 0000000017FC: BEFE0106
	s_waitcnt vmcnt(0)                                         // 000000001800: BF8C0F70
	s_setpc_b64 s[30:31]                                       // 000000001804: BE801D1E

_ZN2ck16amd_buffer_storeItLi1EEEvPKT_PS1_ii:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001808: BF8C0000
	flat_load_ushort v6, v[0:1]                                // 00000000180C: DC480000 06000000
	v_add_u32_e32 v0, v5, v4                                   // 000000001814: 68000905
	v_ashrrev_i32_e32 v1, 31, v0                               // 000000001818: 2202009F
	v_lshlrev_b64 v[0:1], 1, v[0:1]                            // 00000000181C: D28F0000 00020081
	v_add_co_u32_e32 v0, vcc, v2, v0                           // 000000001824: 32000102
	v_addc_co_u32_e32 v1, vcc, v3, v1, vcc                     // 000000001828: 38020303
	s_nop 0                                                    // 00000000182C: BF800000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001830: BF8C0070
	s_nop 0                                                    // 000000001834: BF800000
	flat_store_short v[0:1], v6                                // 000000001838: DC680000 00000600
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001840: BF8C0070
	s_setpc_b64 s[30:31]                                       // 000000001844: BE801D1E

_ZN2ck16amd_buffer_storeItLi2EEEvPKT_PS1_ii:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001848: BF8C0000
	flat_load_dword v0, v[0:1]                                 // 00000000184C: DC500000 00000000
	v_mov_b32_e32 v6, -1                                       // 000000001854: 7E0C02C1
	v_mov_b32_e32 v7, 0x27000                                  // 000000001858: 7E0E02FF 00027000
	v_add_lshl_u32 v1, v5, v4, 1                               // 000000001860: D1FE0001 02060905
	s_mov_b64 s[6:7], exec                                     // 000000001868: BE86017E

BB24_1:
	v_readfirstlane_b32 s8, v2                                 // 00000000186C: 7E100502
	v_readfirstlane_b32 s9, v3                                 // 000000001870: 7E120503
	v_readfirstlane_b32 s10, v6                                // 000000001874: 7E140506
	v_readfirstlane_b32 s11, v7                                // 000000001878: 7E160507
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]                       // 00000000187C: 7DD40408
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]                  // 000000001880: D0EA0004 00020C0A
	s_and_b64 s[4:5], vcc, s[4:5]                              // 000000001888: 8684046A
	s_and_saveexec_b64 s[4:5], s[4:5]                          // 00000000188C: BE842004
	s_nop 0                                                    // 000000001890: BF800000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001894: BF8C0070
	s_nop 0                                                    // 000000001898: BF800000
	buffer_store_dword v0, v1, s[8:11], 0 offen                // 00000000189C: E0701000 80020001
	s_xor_b64 exec, exec, s[4:5]                               // 0000000018A4: 88FE047E
	s_cbranch_execnz BB24_1                                    // 0000000018A8: BF89FFF0
	s_mov_b64 exec, s[6:7]                                     // 0000000018AC: BEFE0106
	s_waitcnt vmcnt(0)                                         // 0000000018B0: BF8C0F70
	s_setpc_b64 s[30:31]                                       // 0000000018B4: BE801D1E

_ZN2ck16amd_buffer_storeItLi4EEEvPKT_PS1_ii:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 0000000018B8: BF8C0000
	flat_load_dwordx2 v[0:1], v[0:1]                           // 0000000018BC: DC540000 00000000
	v_mov_b32_e32 v6, -1                                       // 0000000018C4: 7E0C02C1
	v_mov_b32_e32 v7, 0x27000                                  // 0000000018C8: 7E0E02FF 00027000
	v_add_lshl_u32 v4, v5, v4, 1                               // 0000000018D0: D1FE0004 02060905
	s_mov_b64 s[6:7], exec                                     // 0000000018D8: BE86017E

BB25_1:
	v_readfirstlane_b32 s8, v2                                 // 0000000018DC: 7E100502
	v_readfirstlane_b32 s9, v3                                 // 0000000018E0: 7E120503
	v_readfirstlane_b32 s10, v6                                // 0000000018E4: 7E140506
	v_readfirstlane_b32 s11, v7                                // 0000000018E8: 7E160507
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]                       // 0000000018EC: 7DD40408
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]                  // 0000000018F0: D0EA0004 00020C0A
	s_and_b64 s[4:5], vcc, s[4:5]                              // 0000000018F8: 8684046A
	s_and_saveexec_b64 s[4:5], s[4:5]                          // 0000000018FC: BE842004
	s_nop 0                                                    // 000000001900: BF800000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001904: BF8C0070
	s_nop 0                                                    // 000000001908: BF800000
	buffer_store_dwordx2 v[0:1], v4, s[8:11], 0 offen          // 00000000190C: E0741000 80020004
	s_xor_b64 exec, exec, s[4:5]                               // 000000001914: 88FE047E
	s_cbranch_execnz BB25_1                                    // 000000001918: BF89FFF0
	s_mov_b64 exec, s[6:7]                                     // 00000000191C: BEFE0106
	s_waitcnt vmcnt(0)                                         // 000000001920: BF8C0F70
	s_setpc_b64 s[30:31]                                       // 000000001924: BE801D1E

_ZN2ck21amd_buffer_atomic_addIfLi1EEEvPKT_PS1_ii:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001928: BF8C0000
	flat_load_dword v0, v[0:1]                                 // 00000000192C: DC500000 00000000
	v_mov_b32_e32 v6, -1                                       // 000000001934: 7E0C02C1
	v_mov_b32_e32 v7, 0x27000                                  // 000000001938: 7E0E02FF 00027000
	v_add_lshl_u32 v1, v5, v4, 2                               // 000000001940: D1FE0001 020A0905
	s_mov_b64 s[6:7], exec                                     // 000000001948: BE86017E

BB26_1:
	v_readfirstlane_b32 s8, v2                                 // 00000000194C: 7E100502
	v_readfirstlane_b32 s9, v3                                 // 000000001950: 7E120503
	v_readfirstlane_b32 s10, v6                                // 000000001954: 7E140506
	v_readfirstlane_b32 s11, v7                                // 000000001958: 7E160507
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]                       // 00000000195C: 7DD40408
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]                  // 000000001960: D0EA0004 00020C0A
	s_and_b64 s[4:5], vcc, s[4:5]                              // 000000001968: 8684046A
	s_and_saveexec_b64 s[4:5], s[4:5]                          // 00000000196C: BE842004
	s_nop 0                                                    // 000000001970: BF800000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001974: BF8C0070
	s_nop 0                                                    // 000000001978: BF800000
	buffer_atomic_add_f32 v0, v1, s[8:11], 0 offen             // 00000000197C: E1341000 80020001
	s_xor_b64 exec, exec, s[4:5]                               // 000000001984: 88FE047E
	s_cbranch_execnz BB26_1                                    // 000000001988: BF89FFF0
	s_mov_b64 exec, s[6:7]                                     // 00000000198C: BEFE0106
	s_waitcnt vmcnt(0)                                         // 000000001990: BF8C0F70
	s_setpc_b64 s[30:31]                                       // 000000001994: BE801D1E

_ZN2ck21amd_buffer_atomic_addIfLi2EEEvPKT_PS1_ii:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001998: BF8C0000
	flat_load_dword v8, v[0:1]                                 // 00000000199C: DC500000 08000000
	v_mov_b32_e32 v6, -1                                       // 0000000019A4: 7E0C02C1
	v_mov_b32_e32 v7, 0x27000                                  // 0000000019A8: 7E0E02FF 00027000
	v_add_lshl_u32 v4, v5, v4, 2                               // 0000000019B0: D1FE0004 020A0905
	s_mov_b64 s[6:7], exec                                     // 0000000019B8: BE86017E

BB27_1:
	v_readfirstlane_b32 s8, v2                                 // 0000000019BC: 7E100502
	v_readfirstlane_b32 s9, v3                                 // 0000000019C0: 7E120503
	v_readfirstlane_b32 s10, v6                                // 0000000019C4: 7E140506
	v_readfirstlane_b32 s11, v7                                // 0000000019C8: 7E160507
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]                       // 0000000019CC: 7DD40408
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]                  // 0000000019D0: D0EA0004 00020C0A
	s_and_b64 s[4:5], vcc, s[4:5]                              // 0000000019D8: 8684046A
	s_and_saveexec_b64 s[4:5], s[4:5]                          // 0000000019DC: BE842004
	s_nop 0                                                    // 0000000019E0: BF800000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000019E4: BF8C0070
	s_nop 0                                                    // 0000000019E8: BF800000
	buffer_atomic_add_f32 v8, v4, s[8:11], 0 offen             // 0000000019EC: E1341000 80020804
	s_xor_b64 exec, exec, s[4:5]                               // 0000000019F4: 88FE047E
	s_cbranch_execnz BB27_1                                    // 0000000019F8: BF89FFF0
	s_mov_b64 exec, s[6:7]                                     // 0000000019FC: BEFE0106
	s_mov_b64 s[6:7], exec                                     // 000000001A00: BE86017E
	s_nop 0                                                    // 000000001A04: BF800000
	s_nop 0                                                    // 000000001A08: BF800000
	flat_load_dword v0, v[0:1] offset:4                        // 000000001A0C: DC500004 00000000

BB27_3:
	v_readfirstlane_b32 s8, v2                                 // 000000001A14: 7E100502
	v_readfirstlane_b32 s9, v3                                 // 000000001A18: 7E120503
	v_readfirstlane_b32 s10, v6                                // 000000001A1C: 7E140506
	v_readfirstlane_b32 s11, v7                                // 000000001A20: 7E160507
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]                       // 000000001A24: 7DD40408
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]                  // 000000001A28: D0EA0004 00020C0A
	s_and_b64 s[4:5], vcc, s[4:5]                              // 000000001A30: 8684046A
	s_and_saveexec_b64 s[4:5], s[4:5]                          // 000000001A34: BE842004
	s_nop 0                                                    // 000000001A38: BF800000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001A3C: BF8C0070
	s_nop 0                                                    // 000000001A40: BF800000
	buffer_atomic_add_f32 v0, v4, s[8:11], 0 offen offset:4    // 000000001A44: E1341004 80020004
	s_xor_b64 exec, exec, s[4:5]                               // 000000001A4C: 88FE047E
	s_cbranch_execnz BB27_3                                    // 000000001A50: BF89FFF0
	s_mov_b64 exec, s[6:7]                                     // 000000001A54: BEFE0106
	s_waitcnt vmcnt(0)                                         // 000000001A58: BF8C0F70
	s_setpc_b64 s[30:31]                                       // 000000001A5C: BE801D1E

_ZN2ck21amd_buffer_atomic_addIfLi4EEEvPKT_PS1_ii:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001A60: BF8C0000
	flat_load_dword v8, v[0:1]                                 // 000000001A64: DC500000 08000000
	v_mov_b32_e32 v6, -1                                       // 000000001A6C: 7E0C02C1
	v_mov_b32_e32 v7, 0x27000                                  // 000000001A70: 7E0E02FF 00027000
	v_add_lshl_u32 v4, v5, v4, 2                               // 000000001A78: D1FE0004 020A0905
	s_mov_b64 s[6:7], exec                                     // 000000001A80: BE86017E

BB28_1:
	v_readfirstlane_b32 s8, v2                                 // 000000001A84: 7E100502
	v_readfirstlane_b32 s9, v3                                 // 000000001A88: 7E120503
	v_readfirstlane_b32 s10, v6                                // 000000001A8C: 7E140506
	v_readfirstlane_b32 s11, v7                                // 000000001A90: 7E160507
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]                       // 000000001A94: 7DD40408
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]                  // 000000001A98: D0EA0004 00020C0A
	s_and_b64 s[4:5], vcc, s[4:5]                              // 000000001AA0: 8684046A
	s_and_saveexec_b64 s[4:5], s[4:5]                          // 000000001AA4: BE842004
	s_nop 0                                                    // 000000001AA8: BF800000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001AAC: BF8C0070
	s_nop 0                                                    // 000000001AB0: BF800000
	buffer_atomic_add_f32 v8, v4, s[8:11], 0 offen             // 000000001AB4: E1341000 80020804
	s_xor_b64 exec, exec, s[4:5]                               // 000000001ABC: 88FE047E
	s_cbranch_execnz BB28_1                                    // 000000001AC0: BF89FFF0
	s_mov_b64 exec, s[6:7]                                     // 000000001AC4: BEFE0106
	s_mov_b64 s[6:7], exec                                     // 000000001AC8: BE86017E
	s_nop 0                                                    // 000000001ACC: BF800000
	s_nop 0                                                    // 000000001AD0: BF800000
	flat_load_dword v5, v[0:1] offset:4                        // 000000001AD4: DC500004 05000000

BB28_3:
	v_readfirstlane_b32 s8, v2                                 // 000000001ADC: 7E100502
	v_readfirstlane_b32 s9, v3                                 // 000000001AE0: 7E120503
	v_readfirstlane_b32 s10, v6                                // 000000001AE4: 7E140506
	v_readfirstlane_b32 s11, v7                                // 000000001AE8: 7E160507
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]                       // 000000001AEC: 7DD40408
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]                  // 000000001AF0: D0EA0004 00020C0A
	s_and_b64 s[4:5], vcc, s[4:5]                              // 000000001AF8: 8684046A
	s_and_saveexec_b64 s[4:5], s[4:5]                          // 000000001AFC: BE842004
	s_nop 0                                                    // 000000001B00: BF800000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001B04: BF8C0070
	s_nop 0                                                    // 000000001B08: BF800000
	buffer_atomic_add_f32 v5, v4, s[8:11], 0 offen offset:4    // 000000001B0C: E1341004 80020504
	s_xor_b64 exec, exec, s[4:5]                               // 000000001B14: 88FE047E
	s_cbranch_execnz BB28_3                                    // 000000001B18: BF89FFF0
	s_mov_b64 exec, s[6:7]                                     // 000000001B1C: BEFE0106
	s_mov_b64 s[6:7], exec                                     // 000000001B20: BE86017E
	s_nop 0                                                    // 000000001B24: BF800000
	s_nop 0                                                    // 000000001B28: BF800000
	flat_load_dword v5, v[0:1] offset:8                        // 000000001B2C: DC500008 05000000

BB28_5:
	v_readfirstlane_b32 s8, v2                                 // 000000001B34: 7E100502
	v_readfirstlane_b32 s9, v3                                 // 000000001B38: 7E120503
	v_readfirstlane_b32 s10, v6                                // 000000001B3C: 7E140506
	v_readfirstlane_b32 s11, v7                                // 000000001B40: 7E160507
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]                       // 000000001B44: 7DD40408
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]                  // 000000001B48: D0EA0004 00020C0A
	s_and_b64 s[4:5], vcc, s[4:5]                              // 000000001B50: 8684046A
	s_and_saveexec_b64 s[4:5], s[4:5]                          // 000000001B54: BE842004
	s_nop 0                                                    // 000000001B58: BF800000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001B5C: BF8C0070
	s_nop 0                                                    // 000000001B60: BF800000
	buffer_atomic_add_f32 v5, v4, s[8:11], 0 offen offset:8    // 000000001B64: E1341008 80020504
	s_xor_b64 exec, exec, s[4:5]                               // 000000001B6C: 88FE047E
	s_cbranch_execnz BB28_5                                    // 000000001B70: BF89FFF0
	s_mov_b64 exec, s[6:7]                                     // 000000001B74: BEFE0106
	s_mov_b64 s[6:7], exec                                     // 000000001B78: BE86017E
	s_nop 0                                                    // 000000001B7C: BF800000
	s_nop 0                                                    // 000000001B80: BF800000
	flat_load_dword v0, v[0:1] offset:12                       // 000000001B84: DC50000C 00000000

BB28_7:
	v_readfirstlane_b32 s8, v2                                 // 000000001B8C: 7E100502
	v_readfirstlane_b32 s9, v3                                 // 000000001B90: 7E120503
	v_readfirstlane_b32 s10, v6                                // 000000001B94: 7E140506
	v_readfirstlane_b32 s11, v7                                // 000000001B98: 7E160507
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]                       // 000000001B9C: 7DD40408
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]                  // 000000001BA0: D0EA0004 00020C0A
	s_and_b64 s[4:5], vcc, s[4:5]                              // 000000001BA8: 8684046A
	s_and_saveexec_b64 s[4:5], s[4:5]                          // 000000001BAC: BE842004
	s_nop 0                                                    // 000000001BB0: BF800000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001BB4: BF8C0070
	s_nop 0                                                    // 000000001BB8: BF800000
	buffer_atomic_add_f32 v0, v4, s[8:11], 0 offen offset:12   // 000000001BBC: E134100C 80020004
	s_xor_b64 exec, exec, s[4:5]                               // 000000001BC4: 88FE047E
	s_cbranch_execnz BB28_7                                    // 000000001BC8: BF89FFF0
	s_mov_b64 exec, s[6:7]                                     // 000000001BCC: BEFE0106
	s_waitcnt vmcnt(0)                                         // 000000001BD0: BF8C0F70
	s_setpc_b64 s[30:31]                                       // 000000001BD4: BE801D1E

_ZN2ck15atomic_add_implIDv2_fEEvPT_S2_:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001BD8: BF8C0000
	flat_load_dword v4, v[0:1] glc                             // 000000001BDC: DC510000 04000000
	s_mov_b64 s[4:5], 0                                        // 000000001BE4: BE840180
	s_mov_b64 s[6:7], 0                                        // 000000001BE8: BE860180

BB29_1:
	flat_load_dword v6, v[0:1] glc                             // 000000001BEC: DC510000 06000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001BF4: BF8C0070
	v_mov_b32_e32 v5, v4                                       // 000000001BF8: 7E0A0304
	v_cmp_eq_u32_e32 vcc, v5, v6                               // 000000001BFC: 7D940D05
	v_mov_b32_e32 v4, v6                                       // 000000001C00: 7E080306
	s_or_b64 s[6:7], vcc, s[6:7]                               // 000000001C04: 8786066A
	s_andn2_b64 exec, exec, s[6:7]                             // 000000001C08: 89FE067E
	s_cbranch_execnz BB29_1                                    // 000000001C0C: BF89FFF7
	s_or_b64 exec, exec, s[6:7]                                // 000000001C10: 87FE067E
	v_add_f32_e32 v4, v2, v5                                   // 000000001C14: 02080B02
	s_mov_b64 s[6:7], 0                                        // 000000001C18: BE860180
	s_nop 0                                                    // 000000001C1C: BF800000
	s_nop 0                                                    // 000000001C20: BF800000
	flat_atomic_cmpswap v4, v[0:1], v[4:5] glc                 // 000000001C24: DD050000 04000400
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001C2C: BF8C0070
	v_cmp_eq_u32_e32 vcc, v4, v5                               // 000000001C30: 7D940B04
	s_or_b64 s[4:5], vcc, s[4:5]                               // 000000001C34: 8784046A
	s_andn2_b64 exec, exec, s[4:5]                             // 000000001C38: 89FE047E
	s_cbranch_execnz BB29_1                                    // 000000001C3C: BF89FFEB
	s_or_b64 exec, exec, s[4:5]                                // 000000001C40: 87FE047E
	s_mov_b64 s[4:5], 0                                        // 000000001C44: BE840180
	s_mov_b64 s[6:7], 0                                        // 000000001C48: BE860180
	s_nop 0                                                    // 000000001C4C: BF800000
	s_nop 0                                                    // 000000001C50: BF800000
	flat_load_dword v2, v[0:1] offset:4 glc                    // 000000001C54: DC510004 02000000

BB29_4:
	flat_load_dword v4, v[0:1] offset:4 glc                    // 000000001C5C: DC510004 04000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001C64: BF8C0070
	v_mov_b32_e32 v5, v2                                       // 000000001C68: 7E0A0302
	v_cmp_eq_u32_e32 vcc, v5, v4                               // 000000001C6C: 7D940905
	v_mov_b32_e32 v2, v4                                       // 000000001C70: 7E040304
	s_or_b64 s[6:7], vcc, s[6:7]                               // 000000001C74: 8786066A
	s_andn2_b64 exec, exec, s[6:7]                             // 000000001C78: 89FE067E
	s_cbranch_execnz BB29_4                                    // 000000001C7C: BF89FFF7
	s_or_b64 exec, exec, s[6:7]                                // 000000001C80: 87FE067E
	v_add_f32_e32 v4, v3, v5                                   // 000000001C84: 02080B03
	s_mov_b64 s[6:7], 0                                        // 000000001C88: BE860180
	s_nop 0                                                    // 000000001C8C: BF800000
	s_nop 0                                                    // 000000001C90: BF800000
	flat_atomic_cmpswap v2, v[0:1], v[4:5] offset:4 glc        // 000000001C94: DD050004 02000400
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001C9C: BF8C0070
	v_cmp_eq_u32_e32 vcc, v2, v5                               // 000000001CA0: 7D940B02
	s_or_b64 s[4:5], vcc, s[4:5]                               // 000000001CA4: 8784046A
	s_andn2_b64 exec, exec, s[4:5]                             // 000000001CA8: 89FE047E
	s_cbranch_execnz BB29_4                                    // 000000001CAC: BF89FFEB
	s_or_b64 exec, exec, s[4:5]                                // 000000001CB0: 87FE047E
	s_setpc_b64 s[30:31]                                       // 000000001CB4: BE801D1E

_ZN2ck15atomic_add_implIDv4_fEEvPT_S2_:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001CB8: BF8C0000
	flat_load_dword v6, v[0:1] glc                             // 000000001CBC: DC510000 06000000
	s_mov_b64 s[4:5], 0                                        // 000000001CC4: BE840180
	s_mov_b64 s[6:7], 0                                        // 000000001CC8: BE860180

BB30_1:
	flat_load_dword v8, v[0:1] glc                             // 000000001CCC: DC510000 08000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001CD4: BF8C0070
	v_mov_b32_e32 v7, v6                                       // 000000001CD8: 7E0E0306
	v_cmp_eq_u32_e32 vcc, v7, v8                               // 000000001CDC: 7D941107
	v_mov_b32_e32 v6, v8                                       // 000000001CE0: 7E0C0308
	s_or_b64 s[6:7], vcc, s[6:7]                               // 000000001CE4: 8786066A
	s_andn2_b64 exec, exec, s[6:7]                             // 000000001CE8: 89FE067E
	s_cbranch_execnz BB30_1                                    // 000000001CEC: BF89FFF7
	s_or_b64 exec, exec, s[6:7]                                // 000000001CF0: 87FE067E
	v_add_f32_e32 v6, v2, v7                                   // 000000001CF4: 020C0F02
	s_mov_b64 s[6:7], 0                                        // 000000001CF8: BE860180
	s_nop 0                                                    // 000000001CFC: BF800000
	s_nop 0                                                    // 000000001D00: BF800000
	flat_atomic_cmpswap v6, v[0:1], v[6:7] glc                 // 000000001D04: DD050000 06000600
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001D0C: BF8C0070
	v_cmp_eq_u32_e32 vcc, v6, v7                               // 000000001D10: 7D940F06
	s_or_b64 s[4:5], vcc, s[4:5]                               // 000000001D14: 8784046A
	s_andn2_b64 exec, exec, s[4:5]                             // 000000001D18: 89FE047E
	s_cbranch_execnz BB30_1                                    // 000000001D1C: BF89FFEB
	s_or_b64 exec, exec, s[4:5]                                // 000000001D20: 87FE047E
	s_mov_b64 s[4:5], 0                                        // 000000001D24: BE840180
	s_mov_b64 s[6:7], 0                                        // 000000001D28: BE860180
	s_nop 0                                                    // 000000001D2C: BF800000
	s_nop 0                                                    // 000000001D30: BF800000
	flat_load_dword v2, v[0:1] offset:4 glc                    // 000000001D34: DC510004 02000000

BB30_4:
	flat_load_dword v6, v[0:1] offset:4 glc                    // 000000001D3C: DC510004 06000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001D44: BF8C0070
	v_mov_b32_e32 v7, v2                                       // 000000001D48: 7E0E0302
	v_cmp_eq_u32_e32 vcc, v7, v6                               // 000000001D4C: 7D940D07
	v_mov_b32_e32 v2, v6                                       // 000000001D50: 7E040306
	s_or_b64 s[6:7], vcc, s[6:7]                               // 000000001D54: 8786066A
	s_andn2_b64 exec, exec, s[6:7]                             // 000000001D58: 89FE067E
	s_cbranch_execnz BB30_4                                    // 000000001D5C: BF89FFF7
	s_or_b64 exec, exec, s[6:7]                                // 000000001D60: 87FE067E
	v_add_f32_e32 v6, v3, v7                                   // 000000001D64: 020C0F03
	s_mov_b64 s[6:7], 0                                        // 000000001D68: BE860180
	s_nop 0                                                    // 000000001D6C: BF800000
	s_nop 0                                                    // 000000001D70: BF800000
	flat_atomic_cmpswap v2, v[0:1], v[6:7] offset:4 glc        // 000000001D74: DD050004 02000600
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001D7C: BF8C0070
	v_cmp_eq_u32_e32 vcc, v2, v7                               // 000000001D80: 7D940F02
	s_or_b64 s[4:5], vcc, s[4:5]                               // 000000001D84: 8784046A
	s_andn2_b64 exec, exec, s[4:5]                             // 000000001D88: 89FE047E
	s_cbranch_execnz BB30_4                                    // 000000001D8C: BF89FFEB
	s_or_b64 exec, exec, s[4:5]                                // 000000001D90: 87FE047E
	s_mov_b64 s[4:5], 0                                        // 000000001D94: BE840180
	s_mov_b64 s[6:7], 0                                        // 000000001D98: BE860180
	s_nop 0                                                    // 000000001D9C: BF800000
	s_nop 0                                                    // 000000001DA0: BF800000
	flat_load_dword v2, v[0:1] offset:8 glc                    // 000000001DA4: DC510008 02000000

BB30_7:
	flat_load_dword v6, v[0:1] offset:8 glc                    // 000000001DAC: DC510008 06000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001DB4: BF8C0070
	v_mov_b32_e32 v3, v2                                       // 000000001DB8: 7E060302
	v_cmp_eq_u32_e32 vcc, v3, v6                               // 000000001DBC: 7D940D03
	v_mov_b32_e32 v2, v6                                       // 000000001DC0: 7E040306
	s_or_b64 s[6:7], vcc, s[6:7]                               // 000000001DC4: 8786066A
	s_andn2_b64 exec, exec, s[6:7]                             // 000000001DC8: 89FE067E
	s_cbranch_execnz BB30_7                                    // 000000001DCC: BF89FFF7
	s_or_b64 exec, exec, s[6:7]                                // 000000001DD0: 87FE067E
	v_add_f32_e32 v2, v4, v3                                   // 000000001DD4: 02040704
	s_mov_b64 s[6:7], 0                                        // 000000001DD8: BE860180
	s_nop 0                                                    // 000000001DDC: BF800000
	s_nop 0                                                    // 000000001DE0: BF800000
	flat_atomic_cmpswap v2, v[0:1], v[2:3] offset:8 glc        // 000000001DE4: DD050008 02000200
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001DEC: BF8C0070
	v_cmp_eq_u32_e32 vcc, v2, v3                               // 000000001DF0: 7D940702
	s_or_b64 s[4:5], vcc, s[4:5]                               // 000000001DF4: 8784046A
	s_andn2_b64 exec, exec, s[4:5]                             // 000000001DF8: 89FE047E
	s_cbranch_execnz BB30_7                                    // 000000001DFC: BF89FFEB
	s_or_b64 exec, exec, s[4:5]                                // 000000001E00: 87FE047E
	s_mov_b64 s[4:5], 0                                        // 000000001E04: BE840180
	s_mov_b64 s[6:7], 0                                        // 000000001E08: BE860180
	s_nop 0                                                    // 000000001E0C: BF800000
	s_nop 0                                                    // 000000001E10: BF800000
	flat_load_dword v2, v[0:1] offset:12 glc                   // 000000001E14: DC51000C 02000000

BB30_10:
	flat_load_dword v4, v[0:1] offset:12 glc                   // 000000001E1C: DC51000C 04000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001E24: BF8C0070
	v_mov_b32_e32 v3, v2                                       // 000000001E28: 7E060302
	v_cmp_eq_u32_e32 vcc, v3, v4                               // 000000001E2C: 7D940903
	v_mov_b32_e32 v2, v4                                       // 000000001E30: 7E040304
	s_or_b64 s[6:7], vcc, s[6:7]                               // 000000001E34: 8786066A
	s_andn2_b64 exec, exec, s[6:7]                             // 000000001E38: 89FE067E
	s_cbranch_execnz BB30_10                                   // 000000001E3C: BF89FFF7
	s_or_b64 exec, exec, s[6:7]                                // 000000001E40: 87FE067E
	v_add_f32_e32 v2, v5, v3                                   // 000000001E44: 02040705
	s_mov_b64 s[6:7], 0                                        // 000000001E48: BE860180
	s_nop 0                                                    // 000000001E4C: BF800000
	s_nop 0                                                    // 000000001E50: BF800000
	flat_atomic_cmpswap v2, v[0:1], v[2:3] offset:12 glc       // 000000001E54: DD05000C 02000200
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001E5C: BF8C0070
	v_cmp_eq_u32_e32 vcc, v2, v3                               // 000000001E60: 7D940702
	s_or_b64 s[4:5], vcc, s[4:5]                               // 000000001E64: 8784046A
	s_andn2_b64 exec, exec, s[4:5]                             // 000000001E68: 89FE047E
	s_cbranch_execnz BB30_10                                   // 000000001E6C: BF89FFEB
	s_or_b64 exec, exec, s[4:5]                                // 000000001E70: 87FE047E
	s_setpc_b64 s[30:31]                                       // 000000001E74: BE801D1E

_ZN2ck14block_sync_ldsEv:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001E78: BF8C0000
	s_waitcnt lgkmcnt(0)                                       // 000000001E7C: BF8CC07F
	s_barrier                                                  // 000000001E80: BF8A0000
	s_setpc_b64 s[30:31]                                       // 000000001E84: BE801D1E

_ZN2ck19block_sync_lds_vmemEv:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001E88: BF8C0000
	s_barrier                                                  // 000000001E8C: BF8A0000
	s_setpc_b64 s[30:31]                                       // 000000001E90: BE801D1E

_ZN2ck30amd_assembly_outer_product_1x2EDv2_DF16_S0_S0_RfS1_:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001E94: BF8C0000
	flat_load_dword v8, v[5:6]                                 // 000000001E98: DC500000 08000005
	flat_load_dword v7, v[3:4]                                 // 000000001EA0: DC500000 07000003
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001EA8: BF8C0070
	v_dot2_f32_f16 v7, v0, v1, v7                              // 000000001EAC: D3A34007 1C1E0300
	v_dot2_f32_f16 v8, v0, v2, v8                              // 000000001EB4: D3A34008 1C220500
	s_nop 0                                                    // 000000001EBC: BF800000
	s_nop 0                                                    // 000000001EC0: BF800000
	flat_store_dword v[3:4], v7                                // 000000001EC4: DC700000 00000703
	flat_store_dword v[5:6], v8                                // 000000001ECC: DC700000 00000805
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001ED4: BF8C0070
	s_setpc_b64 s[30:31]                                       // 000000001ED8: BE801D1E

_ZN2ck30amd_assembly_outer_product_1x2EDv4_DF16_S0_S0_RfS1_:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001EDC: BF8C0000
	flat_load_dword v11, v[8:9]                                // 000000001EE0: DC500000 0B000008
	flat_load_dword v10, v[6:7]                                // 000000001EE8: DC500000 0A000006
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001EF0: BF8C0070
	v_dot2_f32_f16 v10, v0, v2, v10                            // 000000001EF4: D3A3400A 1C2A0500
	v_dot2_f32_f16 v11, v0, v4, v11                            // 000000001EFC: D3A3400B 1C2E0900
	v_dot2_f32_f16 v10, v1, v3, v10                            // 000000001F04: D3A3400A 1C2A0701
	v_dot2_f32_f16 v11, v1, v5, v11                            // 000000001F0C: D3A3400B 1C2E0B01
	s_nop 0                                                    // 000000001F14: BF800000
	s_nop 0                                                    // 000000001F18: BF800000
	flat_store_dword v[6:7], v10                               // 000000001F1C: DC700000 00000A06
	flat_store_dword v[8:9], v11                               // 000000001F24: DC700000 00000B08
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001F2C: BF8C0070
	s_setpc_b64 s[30:31]                                       // 000000001F30: BE801D1E

_ZN2ck30amd_assembly_outer_product_1x4EDv2_DF16_S0_S0_S0_S0_RfS1_S1_S1_:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001F34: BF8C0000
	flat_load_dword v16, v[11:12]                              // 000000001F38: DC500000 1000000B
	flat_load_dword v15, v[9:10]                               // 000000001F40: DC500000 0F000009
	flat_load_dword v14, v[7:8]                                // 000000001F48: DC500000 0E000007
	flat_load_dword v13, v[5:6]                                // 000000001F50: DC500000 0D000005
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001F58: BF8C0070
	v_dot2_f32_f16 v13, v0, v1, v13                            // 000000001F5C: D3A3400D 1C360300
	v_dot2_f32_f16 v14, v0, v2, v14                            // 000000001F64: D3A3400E 1C3A0500
	v_dot2_f32_f16 v15, v0, v3, v15                            // 000000001F6C: D3A3400F 1C3E0700
	v_dot2_f32_f16 v16, v0, v4, v16                            // 000000001F74: D3A34010 1C420900
	s_nop 0                                                    // 000000001F7C: BF800000
	s_nop 0                                                    // 000000001F80: BF800000
	flat_store_dword v[5:6], v13                               // 000000001F84: DC700000 00000D05
	flat_store_dword v[7:8], v14                               // 000000001F8C: DC700000 00000E07
	flat_store_dword v[9:10], v15                              // 000000001F94: DC700000 00000F09
	flat_store_dword v[11:12], v16                             // 000000001F9C: DC700000 0000100B
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001FA4: BF8C0070
	s_setpc_b64 s[30:31]                                       // 000000001FA8: BE801D1E

_ZN2ck30amd_assembly_outer_product_1x4EDv4_DF16_S0_S0_S0_S0_RfS1_S1_S1_:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000001FAC: BF8C0000
	flat_load_dword v21, v[16:17]                              // 000000001FB0: DC500000 15000010
	flat_load_dword v20, v[14:15]                              // 000000001FB8: DC500000 1400000E
	flat_load_dword v19, v[12:13]                              // 000000001FC0: DC500000 1300000C
	flat_load_dword v18, v[10:11]                              // 000000001FC8: DC500000 1200000A
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000001FD0: BF8C0070
	v_dot2_f32_f16 v18, v0, v2, v18                            // 000000001FD4: D3A34012 1C4A0500
	v_dot2_f32_f16 v19, v0, v4, v19                            // 000000001FDC: D3A34013 1C4E0900
	v_dot2_f32_f16 v20, v0, v6, v20                            // 000000001FE4: D3A34014 1C520D00
	v_dot2_f32_f16 v21, v0, v8, v21                            // 000000001FEC: D3A34015 1C561100
	v_dot2_f32_f16 v18, v1, v3, v18                            // 000000001FF4: D3A34012 1C4A0701
	v_dot2_f32_f16 v19, v1, v5, v19                            // 000000001FFC: D3A34013 1C4E0B01
	v_dot2_f32_f16 v20, v1, v7, v20                            // 000000002004: D3A34014 1C520F01
	v_dot2_f32_f16 v21, v1, v9, v21                            // 00000000200C: D3A34015 1C561301
	s_nop 0                                                    // 000000002014: BF800000
	s_nop 0                                                    // 000000002018: BF800000
	flat_store_dword v[10:11], v18                             // 00000000201C: DC700000 0000120A
	flat_store_dword v[12:13], v19                             // 000000002024: DC700000 0000130C
	flat_store_dword v[14:15], v20                             // 00000000202C: DC700000 0000140E
	flat_store_dword v[16:17], v21                             // 000000002034: DC700000 00001510
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000203C: BF8C0070
	s_setpc_b64 s[30:31]                                       // 000000002040: BE801D1E

_ZN2ck19gcnasm_accvgpr_readILi4EEEvPf:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000002044: BF8C0000
	s_setpc_b64 s[30:31]                                       // 000000002048: BE801D1E
_ZN2ck19gcnasm_accvgpr_readILi8EEEvPf:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 00000000204C: BF8C0000
	s_setpc_b64 s[30:31]                                       // 000000002050: BE801D1E

_ZN2ck19gcnasm_accvgpr_readILi16EEEvPf:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000002054: BF8C0000
	s_setpc_b64 s[30:31]                                       // 000000002058: BE801D1E

_ZN2ck19gcnasm_accvgpr_readILi32EEEvPf:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 00000000205C: BF8C0000
	s_setpc_b64 s[30:31]                                       // 000000002060: BE801D1E

_ZN2ck19gcnasm_accvgpr_readILi64EEEvPf:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000002064: BF8C0000
	s_setpc_b64 s[30:31]                                       // 000000002068: BE801D1E

_ZN2ck19gcnasm_accvgpr_zeroILi4EEEvv:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 00000000206C: BF8C0000
	s_setpc_b64 s[30:31]                                       // 000000002070: BE801D1E

_ZN2ck19gcnasm_accvgpr_zeroILi8EEEvv:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000002074: BF8C0000
	s_setpc_b64 s[30:31]                                       // 000000002078: BE801D1E

_ZN2ck19gcnasm_accvgpr_zeroILi16EEEvv:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 00000000207C: BF8C0000
	s_setpc_b64 s[30:31]                                       // 000000002080: BE801D1E

_ZN2ck19gcnasm_accvgpr_zeroILi32EEEvv:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000002084: BF8C0000
	s_setpc_b64 s[30:31]                                       // 000000002088: BE801D1E

_ZN2ck19gcnasm_accvgpr_zeroILi64EEEvv:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 00000000208C: BF8C0000
	s_setpc_b64 s[30:31]                                       // 000000002090: BE801D1E

_ZN2ck10gcnasm_nopILi8EEEvv:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000002094: BF8C0000
	s_setpc_b64 s[30:31]                                       // 000000002098: BE801D1E

_ZN2ck10gcnasm_nopILi32EEEvv:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 00000000209C: BF8C0000
	s_setpc_b64 s[30:31]                                       // 0000000020A0: BE801D1E

_ZN2ck10gcnasm_nopILi64EEEvv:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 0000000020A4: BF8C0000
	s_setpc_b64 s[30:31]                                       // 0000000020A8: BE801D1E

_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi64ELi64EEEvRKfS2_PDv32_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 0000000020AC: BF8C0000
	flat_load_dword v38, v[0:1]                                // 0000000020B0: DC500000 26000000
	flat_load_dword v39, v[2:3]                                // 0000000020B8: DC500000 27000002
	flat_load_dwordx4 v[34:37], v[4:5] offset:112              // 0000000020C0: DC5C0070 22000004
	flat_load_dwordx4 v[30:33], v[4:5] offset:96               // 0000000020C8: DC5C0060 1E000004
	flat_load_dwordx4 v[26:29], v[4:5] offset:80               // 0000000020D0: DC5C0050 1A000004
	flat_load_dwordx4 v[22:25], v[4:5] offset:64               // 0000000020D8: DC5C0040 16000004
	flat_load_dwordx4 v[18:21], v[4:5] offset:48               // 0000000020E0: DC5C0030 12000004
	flat_load_dwordx4 v[14:17], v[4:5] offset:32               // 0000000020E8: DC5C0020 0E000004
	flat_load_dwordx4 v[10:13], v[4:5] offset:16               // 0000000020F0: DC5C0010 0A000004
	flat_load_dwordx4 v[6:9], v[4:5]                           // 0000000020F8: DC5C0000 06000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000002100: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 000000002104: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 00000000210C: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 000000002114: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 00000000211C: D3D90003 00000109
	v_accvgpr_write_b32 a4, v10                                // 000000002124: D3D90004 0000010A
	v_accvgpr_write_b32 a5, v11                                // 00000000212C: D3D90005 0000010B
	v_accvgpr_write_b32 a6, v12                                // 000000002134: D3D90006 0000010C
	v_accvgpr_write_b32 a7, v13                                // 00000000213C: D3D90007 0000010D
	v_accvgpr_write_b32 a8, v14                                // 000000002144: D3D90008 0000010E
	v_accvgpr_write_b32 a9, v15                                // 00000000214C: D3D90009 0000010F
	v_accvgpr_write_b32 a10, v16                               // 000000002154: D3D9000A 00000110
	v_accvgpr_write_b32 a11, v17                               // 00000000215C: D3D9000B 00000111
	v_accvgpr_write_b32 a12, v18                               // 000000002164: D3D9000C 00000112
	v_accvgpr_write_b32 a13, v19                               // 00000000216C: D3D9000D 00000113
	v_accvgpr_write_b32 a14, v20                               // 000000002174: D3D9000E 00000114
	v_accvgpr_write_b32 a15, v21                               // 00000000217C: D3D9000F 00000115
	v_accvgpr_write_b32 a16, v22                               // 000000002184: D3D90010 00000116
	v_accvgpr_write_b32 a17, v23                               // 00000000218C: D3D90011 00000117
	v_accvgpr_write_b32 a18, v24                               // 000000002194: D3D90012 00000118
	v_accvgpr_write_b32 a19, v25                               // 00000000219C: D3D90013 00000119
	v_accvgpr_write_b32 a20, v26                               // 0000000021A4: D3D90014 0000011A
	v_accvgpr_write_b32 a21, v27                               // 0000000021AC: D3D90015 0000011B
	v_accvgpr_write_b32 a22, v28                               // 0000000021B4: D3D90016 0000011C
	v_accvgpr_write_b32 a23, v29                               // 0000000021BC: D3D90017 0000011D
	v_accvgpr_write_b32 a24, v30                               // 0000000021C4: D3D90018 0000011E
	v_accvgpr_write_b32 a25, v31                               // 0000000021CC: D3D90019 0000011F
	v_accvgpr_write_b32 a26, v32                               // 0000000021D4: D3D9001A 00000120
	v_accvgpr_write_b32 a27, v33                               // 0000000021DC: D3D9001B 00000121
	v_accvgpr_write_b32 a28, v34                               // 0000000021E4: D3D9001C 00000122
	v_accvgpr_write_b32 a29, v35                               // 0000000021EC: D3D9001D 00000123
	v_accvgpr_write_b32 a30, v36                               // 0000000021F4: D3D9001E 00000124
	v_accvgpr_write_b32 a31, v37                               // 0000000021FC: D3D9001F 00000125
	s_nop 0                                                    // 000000002204: BF800000
	s_nop 0                                                    // 000000002208: BF800000
	flat_load_dwordx4 v[34:37], v[4:5] offset:240              // 00000000220C: DC5C00F0 22000004
	flat_load_dwordx4 v[30:33], v[4:5] offset:224              // 000000002214: DC5C00E0 1E000004
	flat_load_dwordx4 v[26:29], v[4:5] offset:208              // 00000000221C: DC5C00D0 1A000004
	flat_load_dwordx4 v[22:25], v[4:5] offset:192              // 000000002224: DC5C00C0 16000004
	flat_load_dwordx4 v[18:21], v[4:5] offset:176              // 00000000222C: DC5C00B0 12000004
	flat_load_dwordx4 v[14:17], v[4:5] offset:160              // 000000002234: DC5C00A0 0E000004
	flat_load_dwordx4 v[10:13], v[4:5] offset:144              // 00000000223C: DC5C0090 0A000004
	flat_load_dwordx4 v[6:9], v[4:5] offset:128                // 000000002244: DC5C0080 06000004
	v_mfma_f32_32x32x1f32 a[0:31], v38, v39, a[0:31] cbsz:1    // 00000000224C: D3C00100 04024F26
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000002254: BF8C0070
	v_accvgpr_write_b32 a63, v37                               // 000000002258: D3D9003F 00000125
	v_accvgpr_write_b32 a62, v36                               // 000000002260: D3D9003E 00000124
	v_accvgpr_write_b32 a61, v35                               // 000000002268: D3D9003D 00000123
	v_accvgpr_write_b32 a60, v34                               // 000000002270: D3D9003C 00000122
	v_accvgpr_write_b32 a59, v33                               // 000000002278: D3D9003B 00000121
	v_accvgpr_write_b32 a58, v32                               // 000000002280: D3D9003A 00000120
	v_accvgpr_write_b32 a57, v31                               // 000000002288: D3D90039 0000011F
	v_accvgpr_write_b32 a56, v30                               // 000000002290: D3D90038 0000011E
	v_accvgpr_write_b32 a55, v29                               // 000000002298: D3D90037 0000011D
	v_accvgpr_write_b32 a54, v28                               // 0000000022A0: D3D90036 0000011C
	v_accvgpr_write_b32 a53, v27                               // 0000000022A8: D3D90035 0000011B
	v_accvgpr_write_b32 a52, v26                               // 0000000022B0: D3D90034 0000011A
	v_accvgpr_write_b32 a51, v25                               // 0000000022B8: D3D90033 00000119
	v_accvgpr_write_b32 a50, v24                               // 0000000022C0: D3D90032 00000118
	v_accvgpr_write_b32 a49, v23                               // 0000000022C8: D3D90031 00000117
	v_accvgpr_write_b32 a48, v22                               // 0000000022D0: D3D90030 00000116
	v_accvgpr_write_b32 a47, v21                               // 0000000022D8: D3D9002F 00000115
	v_accvgpr_write_b32 a46, v20                               // 0000000022E0: D3D9002E 00000114
	v_accvgpr_write_b32 a45, v19                               // 0000000022E8: D3D9002D 00000113
	v_accvgpr_write_b32 a44, v18                               // 0000000022F0: D3D9002C 00000112
	v_accvgpr_write_b32 a43, v17                               // 0000000022F8: D3D9002B 00000111
	v_accvgpr_write_b32 a42, v16                               // 000000002300: D3D9002A 00000110
	v_accvgpr_write_b32 a41, v15                               // 000000002308: D3D90029 0000010F
	v_accvgpr_write_b32 a40, v14                               // 000000002310: D3D90028 0000010E
	v_accvgpr_write_b32 a39, v13                               // 000000002318: D3D90027 0000010D
	v_accvgpr_write_b32 a38, v12                               // 000000002320: D3D90026 0000010C
	v_accvgpr_write_b32 a37, v11                               // 000000002328: D3D90025 0000010B
	v_accvgpr_write_b32 a36, v10                               // 000000002330: D3D90024 0000010A
	v_accvgpr_write_b32 a35, v9                                // 000000002338: D3D90023 00000109
	v_accvgpr_write_b32 a34, v8                                // 000000002340: D3D90022 00000108
	v_accvgpr_write_b32 a33, v7                                // 000000002348: D3D90021 00000107
	v_accvgpr_write_b32 a32, v6                                // 000000002350: D3D90020 00000106
	v_accvgpr_read_b32 v9, a27                                 // 000000002358: D3D80009 0800011B
	v_accvgpr_read_b32 v8, a26                                 // 000000002360: D3D80008 0800011A
	v_accvgpr_read_b32 v7, a25                                 // 000000002368: D3D80007 08000119
	v_accvgpr_read_b32 v6, a24                                 // 000000002370: D3D80006 08000118
	v_accvgpr_read_b32 v13, a31                                // 000000002378: D3D8000D 0800011F
	v_accvgpr_read_b32 v12, a30                                // 000000002380: D3D8000C 0800011E
	v_accvgpr_read_b32 v11, a29                                // 000000002388: D3D8000B 0800011D
	v_accvgpr_read_b32 v10, a28                                // 000000002390: D3D8000A 0800011C
	v_accvgpr_read_b32 v17, a19                                // 000000002398: D3D80011 08000113
	v_accvgpr_read_b32 v16, a18                                // 0000000023A0: D3D80010 08000112
	v_accvgpr_read_b32 v15, a17                                // 0000000023A8: D3D8000F 08000111
	v_accvgpr_read_b32 v14, a16                                // 0000000023B0: D3D8000E 08000110
	v_accvgpr_read_b32 v21, a23                                // 0000000023B8: D3D80015 08000117
	v_accvgpr_read_b32 v20, a22                                // 0000000023C0: D3D80014 08000116
	v_accvgpr_read_b32 v19, a21                                // 0000000023C8: D3D80013 08000115
	v_accvgpr_read_b32 v18, a20                                // 0000000023D0: D3D80012 08000114
	v_accvgpr_read_b32 v25, a11                                // 0000000023D8: D3D80019 0800010B
	v_accvgpr_read_b32 v24, a10                                // 0000000023E0: D3D80018 0800010A
	v_accvgpr_read_b32 v23, a9                                 // 0000000023E8: D3D80017 08000109
	v_accvgpr_read_b32 v22, a8                                 // 0000000023F0: D3D80016 08000108
	v_accvgpr_read_b32 v29, a15                                // 0000000023F8: D3D8001D 0800010F
	v_accvgpr_read_b32 v28, a14                                // 000000002400: D3D8001C 0800010E
	v_accvgpr_read_b32 v27, a13                                // 000000002408: D3D8001B 0800010D
	v_accvgpr_read_b32 v26, a12                                // 000000002410: D3D8001A 0800010C
	v_accvgpr_read_b32 v33, a3                                 // 000000002418: D3D80021 08000103
	v_accvgpr_read_b32 v32, a2                                 // 000000002420: D3D80020 08000102
	v_accvgpr_read_b32 v31, a1                                 // 000000002428: D3D8001F 08000101
	v_accvgpr_read_b32 v30, a0                                 // 000000002430: D3D8001E 08000100
	v_accvgpr_read_b32 v37, a7                                 // 000000002438: D3D80025 08000107
	v_accvgpr_read_b32 v36, a6                                 // 000000002440: D3D80024 08000106
	v_accvgpr_read_b32 v35, a5                                 // 000000002448: D3D80023 08000105
	v_accvgpr_read_b32 v34, a4                                 // 000000002450: D3D80022 08000104
	s_nop 0                                                    // 000000002458: BF800000
	s_nop 0                                                    // 00000000245C: BF800000
	flat_store_dwordx4 v[4:5], v[6:9] offset:96                // 000000002460: DC7C0060 00000604
	flat_store_dwordx4 v[4:5], v[10:13] offset:112             // 000000002468: DC7C0070 00000A04
	flat_store_dwordx4 v[4:5], v[14:17] offset:64              // 000000002470: DC7C0040 00000E04
	flat_store_dwordx4 v[4:5], v[18:21] offset:80              // 000000002478: DC7C0050 00001204
	flat_store_dwordx4 v[4:5], v[22:25] offset:32              // 000000002480: DC7C0020 00001604
	flat_store_dwordx4 v[4:5], v[26:29] offset:48              // 000000002488: DC7C0030 00001A04
	flat_store_dwordx4 v[4:5], v[30:33]                        // 000000002490: DC7C0000 00001E04
	flat_store_dwordx4 v[4:5], v[34:37] offset:16              // 000000002498: DC7C0010 00002204
	flat_load_dword v6, v[0:1]                                 // 0000000024A0: DC500000 06000000
	s_nop 0                                                    // 0000000024A8: BF800000
	s_nop 0                                                    // 0000000024AC: BF800000
	flat_load_dword v7, v[2:3]                                 // 0000000024B0: DC500000 07000002
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000024B8: BF8C0070
	v_mfma_f32_32x32x1f32 a[0:31], v6, v7, a[32:63] cbsz:1 abid:1// 0000000024BC: D3C00900 04820F06
	s_nop 7                                                    // 0000000024C4: BF800007
	s_nop 7                                                    // 0000000024C8: BF800007
	s_nop 1                                                    // 0000000024CC: BF800001
	v_accvgpr_read_b32 v3, a27                                 // 0000000024D0: D3D80003 0800011B
	v_accvgpr_read_b32 v2, a26                                 // 0000000024D8: D3D80002 0800011A
	v_accvgpr_read_b32 v1, a25                                 // 0000000024E0: D3D80001 08000119
	v_accvgpr_read_b32 v0, a24                                 // 0000000024E8: D3D80000 08000118
	v_accvgpr_read_b32 v9, a31                                 // 0000000024F0: D3D80009 0800011F
	v_accvgpr_read_b32 v8, a30                                 // 0000000024F8: D3D80008 0800011E
	v_accvgpr_read_b32 v7, a29                                 // 000000002500: D3D80007 0800011D
	v_accvgpr_read_b32 v6, a28                                 // 000000002508: D3D80006 0800011C
	v_accvgpr_read_b32 v13, a19                                // 000000002510: D3D8000D 08000113
	v_accvgpr_read_b32 v12, a18                                // 000000002518: D3D8000C 08000112
	v_accvgpr_read_b32 v11, a17                                // 000000002520: D3D8000B 08000111
	v_accvgpr_read_b32 v10, a16                                // 000000002528: D3D8000A 08000110
	v_accvgpr_read_b32 v17, a23                                // 000000002530: D3D80011 08000117
	v_accvgpr_read_b32 v16, a22                                // 000000002538: D3D80010 08000116
	v_accvgpr_read_b32 v15, a21                                // 000000002540: D3D8000F 08000115
	v_accvgpr_read_b32 v14, a20                                // 000000002548: D3D8000E 08000114
	v_accvgpr_read_b32 v21, a11                                // 000000002550: D3D80015 0800010B
	v_accvgpr_read_b32 v20, a10                                // 000000002558: D3D80014 0800010A
	v_accvgpr_read_b32 v19, a9                                 // 000000002560: D3D80013 08000109
	v_accvgpr_read_b32 v18, a8                                 // 000000002568: D3D80012 08000108
	v_accvgpr_read_b32 v25, a15                                // 000000002570: D3D80019 0800010F
	v_accvgpr_read_b32 v24, a14                                // 000000002578: D3D80018 0800010E
	v_accvgpr_read_b32 v23, a13                                // 000000002580: D3D80017 0800010D
	v_accvgpr_read_b32 v22, a12                                // 000000002588: D3D80016 0800010C
	v_accvgpr_read_b32 v29, a3                                 // 000000002590: D3D8001D 08000103
	v_accvgpr_read_b32 v28, a2                                 // 000000002598: D3D8001C 08000102
	v_accvgpr_read_b32 v27, a1                                 // 0000000025A0: D3D8001B 08000101
	v_accvgpr_read_b32 v26, a0                                 // 0000000025A8: D3D8001A 08000100
	v_accvgpr_read_b32 v33, a7                                 // 0000000025B0: D3D80021 08000107
	v_accvgpr_read_b32 v32, a6                                 // 0000000025B8: D3D80020 08000106
	v_accvgpr_read_b32 v31, a5                                 // 0000000025C0: D3D8001F 08000105
	v_accvgpr_read_b32 v30, a4                                 // 0000000025C8: D3D8001E 08000104
	s_nop 0                                                    // 0000000025D0: BF800000
	s_nop 0                                                    // 0000000025D4: BF800000
	flat_store_dwordx4 v[4:5], v[0:3] offset:224               // 0000000025D8: DC7C00E0 00000004
	flat_store_dwordx4 v[4:5], v[6:9] offset:240               // 0000000025E0: DC7C00F0 00000604
	flat_store_dwordx4 v[4:5], v[10:13] offset:192             // 0000000025E8: DC7C00C0 00000A04
	flat_store_dwordx4 v[4:5], v[14:17] offset:208             // 0000000025F0: DC7C00D0 00000E04
	flat_store_dwordx4 v[4:5], v[18:21] offset:160             // 0000000025F8: DC7C00A0 00001204
	flat_store_dwordx4 v[4:5], v[22:25] offset:176             // 000000002600: DC7C00B0 00001604
	flat_store_dwordx4 v[4:5], v[26:29] offset:128             // 000000002608: DC7C0080 00001A04
	flat_store_dwordx4 v[4:5], v[30:33] offset:144             // 000000002610: DC7C0090 00001E04
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000002618: BF8C0070
	s_setpc_b64 s[30:31]                                       // 00000000261C: BE801D1E
_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi32ELi64EEEvRKfS2_PDv32_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000002620: BF8C0000
	flat_load_dwordx4 v[34:37], v[4:5] offset:112              // 000000002624: DC5C0070 22000004
	flat_load_dwordx4 v[30:33], v[4:5] offset:96               // 00000000262C: DC5C0060 1E000004
	flat_load_dwordx4 v[26:29], v[4:5] offset:80               // 000000002634: DC5C0050 1A000004
	flat_load_dwordx4 v[22:25], v[4:5] offset:64               // 00000000263C: DC5C0040 16000004
	flat_load_dwordx4 v[18:21], v[4:5] offset:48               // 000000002644: DC5C0030 12000004
	flat_load_dwordx4 v[14:17], v[4:5] offset:32               // 00000000264C: DC5C0020 0E000004
	flat_load_dwordx4 v[10:13], v[4:5] offset:16               // 000000002654: DC5C0010 0A000004
	flat_load_dwordx4 v[6:9], v[4:5]                           // 00000000265C: DC5C0000 06000004
	flat_load_dword v38, v[0:1]                                // 000000002664: DC500000 26000000
	s_nop 0                                                    // 00000000266C: BF800000
	s_nop 0                                                    // 000000002670: BF800000
	flat_load_dword v0, v[2:3]                                 // 000000002674: DC500000 00000002
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000267C: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 000000002680: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 000000002688: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 000000002690: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 000000002698: D3D90003 00000109
	v_accvgpr_write_b32 a4, v10                                // 0000000026A0: D3D90004 0000010A
	v_accvgpr_write_b32 a5, v11                                // 0000000026A8: D3D90005 0000010B
	v_accvgpr_write_b32 a6, v12                                // 0000000026B0: D3D90006 0000010C
	v_accvgpr_write_b32 a7, v13                                // 0000000026B8: D3D90007 0000010D
	v_accvgpr_write_b32 a8, v14                                // 0000000026C0: D3D90008 0000010E
	v_accvgpr_write_b32 a9, v15                                // 0000000026C8: D3D90009 0000010F
	v_accvgpr_write_b32 a10, v16                               // 0000000026D0: D3D9000A 00000110
	v_accvgpr_write_b32 a11, v17                               // 0000000026D8: D3D9000B 00000111
	v_accvgpr_write_b32 a12, v18                               // 0000000026E0: D3D9000C 00000112
	v_accvgpr_write_b32 a13, v19                               // 0000000026E8: D3D9000D 00000113
	v_accvgpr_write_b32 a14, v20                               // 0000000026F0: D3D9000E 00000114
	v_accvgpr_write_b32 a15, v21                               // 0000000026F8: D3D9000F 00000115
	v_accvgpr_write_b32 a16, v22                               // 000000002700: D3D90010 00000116
	v_accvgpr_write_b32 a17, v23                               // 000000002708: D3D90011 00000117
	v_accvgpr_write_b32 a18, v24                               // 000000002710: D3D90012 00000118
	v_accvgpr_write_b32 a19, v25                               // 000000002718: D3D90013 00000119
	v_accvgpr_write_b32 a20, v26                               // 000000002720: D3D90014 0000011A
	v_accvgpr_write_b32 a21, v27                               // 000000002728: D3D90015 0000011B
	v_accvgpr_write_b32 a22, v28                               // 000000002730: D3D90016 0000011C
	v_accvgpr_write_b32 a23, v29                               // 000000002738: D3D90017 0000011D
	v_accvgpr_write_b32 a24, v30                               // 000000002740: D3D90018 0000011E
	v_accvgpr_write_b32 a25, v31                               // 000000002748: D3D90019 0000011F
	v_accvgpr_write_b32 a26, v32                               // 000000002750: D3D9001A 00000120
	v_accvgpr_write_b32 a27, v33                               // 000000002758: D3D9001B 00000121
	v_accvgpr_write_b32 a28, v34                               // 000000002760: D3D9001C 00000122
	v_accvgpr_write_b32 a29, v35                               // 000000002768: D3D9001D 00000123
	v_accvgpr_write_b32 a30, v36                               // 000000002770: D3D9001E 00000124
	v_accvgpr_write_b32 a31, v37                               // 000000002778: D3D9001F 00000125
	s_nop 0                                                    // 000000002780: BF800000
	v_mfma_f32_32x32x1f32 a[0:31], v38, v0, a[0:31] cbsz:1     // 000000002784: D3C00100 04020126
	s_nop 7                                                    // 00000000278C: BF800007
	s_nop 7                                                    // 000000002790: BF800007
	s_nop 1                                                    // 000000002794: BF800001
	v_accvgpr_read_b32 v3, a27                                 // 000000002798: D3D80003 0800011B
	v_accvgpr_read_b32 v2, a26                                 // 0000000027A0: D3D80002 0800011A
	v_accvgpr_read_b32 v1, a25                                 // 0000000027A8: D3D80001 08000119
	v_accvgpr_read_b32 v0, a24                                 // 0000000027B0: D3D80000 08000118
	v_accvgpr_read_b32 v9, a31                                 // 0000000027B8: D3D80009 0800011F
	v_accvgpr_read_b32 v8, a30                                 // 0000000027C0: D3D80008 0800011E
	v_accvgpr_read_b32 v7, a29                                 // 0000000027C8: D3D80007 0800011D
	v_accvgpr_read_b32 v6, a28                                 // 0000000027D0: D3D80006 0800011C
	v_accvgpr_read_b32 v13, a19                                // 0000000027D8: D3D8000D 08000113
	v_accvgpr_read_b32 v12, a18                                // 0000000027E0: D3D8000C 08000112
	v_accvgpr_read_b32 v11, a17                                // 0000000027E8: D3D8000B 08000111
	v_accvgpr_read_b32 v10, a16                                // 0000000027F0: D3D8000A 08000110
	v_accvgpr_read_b32 v17, a23                                // 0000000027F8: D3D80011 08000117
	v_accvgpr_read_b32 v16, a22                                // 000000002800: D3D80010 08000116
	v_accvgpr_read_b32 v15, a21                                // 000000002808: D3D8000F 08000115
	v_accvgpr_read_b32 v14, a20                                // 000000002810: D3D8000E 08000114
	v_accvgpr_read_b32 v21, a11                                // 000000002818: D3D80015 0800010B
	v_accvgpr_read_b32 v20, a10                                // 000000002820: D3D80014 0800010A
	v_accvgpr_read_b32 v19, a9                                 // 000000002828: D3D80013 08000109
	v_accvgpr_read_b32 v18, a8                                 // 000000002830: D3D80012 08000108
	v_accvgpr_read_b32 v25, a15                                // 000000002838: D3D80019 0800010F
	v_accvgpr_read_b32 v24, a14                                // 000000002840: D3D80018 0800010E
	v_accvgpr_read_b32 v23, a13                                // 000000002848: D3D80017 0800010D
	v_accvgpr_read_b32 v22, a12                                // 000000002850: D3D80016 0800010C
	v_accvgpr_read_b32 v29, a3                                 // 000000002858: D3D8001D 08000103
	v_accvgpr_read_b32 v28, a2                                 // 000000002860: D3D8001C 08000102
	v_accvgpr_read_b32 v27, a1                                 // 000000002868: D3D8001B 08000101
	v_accvgpr_read_b32 v26, a0                                 // 000000002870: D3D8001A 08000100
	v_accvgpr_read_b32 v33, a7                                 // 000000002878: D3D80021 08000107
	v_accvgpr_read_b32 v32, a6                                 // 000000002880: D3D80020 08000106
	v_accvgpr_read_b32 v31, a5                                 // 000000002888: D3D8001F 08000105
	v_accvgpr_read_b32 v30, a4                                 // 000000002890: D3D8001E 08000104
	s_nop 0                                                    // 000000002898: BF800000
	s_nop 0                                                    // 00000000289C: BF800000
	flat_store_dwordx4 v[4:5], v[0:3] offset:96                // 0000000028A0: DC7C0060 00000004
	flat_store_dwordx4 v[4:5], v[6:9] offset:112               // 0000000028A8: DC7C0070 00000604
	flat_store_dwordx4 v[4:5], v[10:13] offset:64              // 0000000028B0: DC7C0040 00000A04
	flat_store_dwordx4 v[4:5], v[14:17] offset:80              // 0000000028B8: DC7C0050 00000E04
	flat_store_dwordx4 v[4:5], v[18:21] offset:32              // 0000000028C0: DC7C0020 00001204
	flat_store_dwordx4 v[4:5], v[22:25] offset:48              // 0000000028C8: DC7C0030 00001604
	flat_store_dwordx4 v[4:5], v[26:29]                        // 0000000028D0: DC7C0000 00001A04
	flat_store_dwordx4 v[4:5], v[30:33] offset:16              // 0000000028D8: DC7C0010 00001E04
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000028E0: BF8C0070
	s_setpc_b64 s[30:31]                                       // 0000000028E4: BE801D1E

_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi64ELi32EEEvRKfS2_PDv32_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 0000000028E8: BF8C0000
	flat_load_dwordx4 v[34:37], v[4:5] offset:112              // 0000000028EC: DC5C0070 22000004
	flat_load_dwordx4 v[30:33], v[4:5] offset:96               // 0000000028F4: DC5C0060 1E000004
	flat_load_dwordx4 v[26:29], v[4:5] offset:80               // 0000000028FC: DC5C0050 1A000004
	flat_load_dwordx4 v[22:25], v[4:5] offset:64               // 000000002904: DC5C0040 16000004
	flat_load_dwordx4 v[18:21], v[4:5] offset:48               // 00000000290C: DC5C0030 12000004
	flat_load_dwordx4 v[14:17], v[4:5] offset:32               // 000000002914: DC5C0020 0E000004
	flat_load_dwordx4 v[10:13], v[4:5] offset:16               // 00000000291C: DC5C0010 0A000004
	flat_load_dwordx4 v[6:9], v[4:5]                           // 000000002924: DC5C0000 06000004
	flat_load_dword v38, v[0:1]                                // 00000000292C: DC500000 26000000
	s_nop 0                                                    // 000000002934: BF800000
	s_nop 0                                                    // 000000002938: BF800000
	flat_load_dword v0, v[2:3]                                 // 00000000293C: DC500000 00000002
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000002944: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 000000002948: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 000000002950: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 000000002958: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 000000002960: D3D90003 00000109
	v_accvgpr_write_b32 a4, v10                                // 000000002968: D3D90004 0000010A
	v_accvgpr_write_b32 a5, v11                                // 000000002970: D3D90005 0000010B
	v_accvgpr_write_b32 a6, v12                                // 000000002978: D3D90006 0000010C
	v_accvgpr_write_b32 a7, v13                                // 000000002980: D3D90007 0000010D
	v_accvgpr_write_b32 a8, v14                                // 000000002988: D3D90008 0000010E
	v_accvgpr_write_b32 a9, v15                                // 000000002990: D3D90009 0000010F
	v_accvgpr_write_b32 a10, v16                               // 000000002998: D3D9000A 00000110
	v_accvgpr_write_b32 a11, v17                               // 0000000029A0: D3D9000B 00000111
	v_accvgpr_write_b32 a12, v18                               // 0000000029A8: D3D9000C 00000112
	v_accvgpr_write_b32 a13, v19                               // 0000000029B0: D3D9000D 00000113
	v_accvgpr_write_b32 a14, v20                               // 0000000029B8: D3D9000E 00000114
	v_accvgpr_write_b32 a15, v21                               // 0000000029C0: D3D9000F 00000115
	v_accvgpr_write_b32 a16, v22                               // 0000000029C8: D3D90010 00000116
	v_accvgpr_write_b32 a17, v23                               // 0000000029D0: D3D90011 00000117
	v_accvgpr_write_b32 a18, v24                               // 0000000029D8: D3D90012 00000118
	v_accvgpr_write_b32 a19, v25                               // 0000000029E0: D3D90013 00000119
	v_accvgpr_write_b32 a20, v26                               // 0000000029E8: D3D90014 0000011A
	v_accvgpr_write_b32 a21, v27                               // 0000000029F0: D3D90015 0000011B
	v_accvgpr_write_b32 a22, v28                               // 0000000029F8: D3D90016 0000011C
	v_accvgpr_write_b32 a23, v29                               // 000000002A00: D3D90017 0000011D
	v_accvgpr_write_b32 a24, v30                               // 000000002A08: D3D90018 0000011E
	v_accvgpr_write_b32 a25, v31                               // 000000002A10: D3D90019 0000011F
	v_accvgpr_write_b32 a26, v32                               // 000000002A18: D3D9001A 00000120
	v_accvgpr_write_b32 a27, v33                               // 000000002A20: D3D9001B 00000121
	v_accvgpr_write_b32 a28, v34                               // 000000002A28: D3D9001C 00000122
	v_accvgpr_write_b32 a29, v35                               // 000000002A30: D3D9001D 00000123
	v_accvgpr_write_b32 a30, v36                               // 000000002A38: D3D9001E 00000124
	v_accvgpr_write_b32 a31, v37                               // 000000002A40: D3D9001F 00000125
	s_nop 0                                                    // 000000002A48: BF800000
	v_mfma_f32_32x32x1f32 a[0:31], v38, v0, a[0:31] blgp:1     // 000000002A4C: D3C00000 24020126
	s_nop 7                                                    // 000000002A54: BF800007
	s_nop 7                                                    // 000000002A58: BF800007
	s_nop 1                                                    // 000000002A5C: BF800001
	v_accvgpr_read_b32 v3, a27                                 // 000000002A60: D3D80003 0800011B
	v_accvgpr_read_b32 v2, a26                                 // 000000002A68: D3D80002 0800011A
	v_accvgpr_read_b32 v1, a25                                 // 000000002A70: D3D80001 08000119
	v_accvgpr_read_b32 v0, a24                                 // 000000002A78: D3D80000 08000118
	v_accvgpr_read_b32 v9, a31                                 // 000000002A80: D3D80009 0800011F
	v_accvgpr_read_b32 v8, a30                                 // 000000002A88: D3D80008 0800011E
	v_accvgpr_read_b32 v7, a29                                 // 000000002A90: D3D80007 0800011D
	v_accvgpr_read_b32 v6, a28                                 // 000000002A98: D3D80006 0800011C
	v_accvgpr_read_b32 v13, a19                                // 000000002AA0: D3D8000D 08000113
	v_accvgpr_read_b32 v12, a18                                // 000000002AA8: D3D8000C 08000112
	v_accvgpr_read_b32 v11, a17                                // 000000002AB0: D3D8000B 08000111
	v_accvgpr_read_b32 v10, a16                                // 000000002AB8: D3D8000A 08000110
	v_accvgpr_read_b32 v17, a23                                // 000000002AC0: D3D80011 08000117
	v_accvgpr_read_b32 v16, a22                                // 000000002AC8: D3D80010 08000116
	v_accvgpr_read_b32 v15, a21                                // 000000002AD0: D3D8000F 08000115
	v_accvgpr_read_b32 v14, a20                                // 000000002AD8: D3D8000E 08000114
	v_accvgpr_read_b32 v21, a11                                // 000000002AE0: D3D80015 0800010B
	v_accvgpr_read_b32 v20, a10                                // 000000002AE8: D3D80014 0800010A
	v_accvgpr_read_b32 v19, a9                                 // 000000002AF0: D3D80013 08000109
	v_accvgpr_read_b32 v18, a8                                 // 000000002AF8: D3D80012 08000108
	v_accvgpr_read_b32 v25, a15                                // 000000002B00: D3D80019 0800010F
	v_accvgpr_read_b32 v24, a14                                // 000000002B08: D3D80018 0800010E
	v_accvgpr_read_b32 v23, a13                                // 000000002B10: D3D80017 0800010D
	v_accvgpr_read_b32 v22, a12                                // 000000002B18: D3D80016 0800010C
	v_accvgpr_read_b32 v29, a3                                 // 000000002B20: D3D8001D 08000103
	v_accvgpr_read_b32 v28, a2                                 // 000000002B28: D3D8001C 08000102
	v_accvgpr_read_b32 v27, a1                                 // 000000002B30: D3D8001B 08000101
	v_accvgpr_read_b32 v26, a0                                 // 000000002B38: D3D8001A 08000100
	v_accvgpr_read_b32 v33, a7                                 // 000000002B40: D3D80021 08000107
	v_accvgpr_read_b32 v32, a6                                 // 000000002B48: D3D80020 08000106
	v_accvgpr_read_b32 v31, a5                                 // 000000002B50: D3D8001F 08000105
	v_accvgpr_read_b32 v30, a4                                 // 000000002B58: D3D8001E 08000104
	s_nop 0                                                    // 000000002B60: BF800000
	s_nop 0                                                    // 000000002B64: BF800000
	flat_store_dwordx4 v[4:5], v[0:3] offset:96                // 000000002B68: DC7C0060 00000004
	flat_store_dwordx4 v[4:5], v[6:9] offset:112               // 000000002B70: DC7C0070 00000604
	flat_store_dwordx4 v[4:5], v[10:13] offset:64              // 000000002B78: DC7C0040 00000A04
	flat_store_dwordx4 v[4:5], v[14:17] offset:80              // 000000002B80: DC7C0050 00000E04
	flat_store_dwordx4 v[4:5], v[18:21] offset:32              // 000000002B88: DC7C0020 00001204
	flat_store_dwordx4 v[4:5], v[22:25] offset:48              // 000000002B90: DC7C0030 00001604
	flat_store_dwordx4 v[4:5], v[26:29]                        // 000000002B98: DC7C0000 00001A04
	flat_store_dwordx4 v[4:5], v[30:33] offset:16              // 000000002BA0: DC7C0010 00001E04
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000002BA8: BF8C0070
	s_setpc_b64 s[30:31]                                       // 000000002BAC: BE801D1E

_ZN2ck26gcnasm_mfma_f32_32x32x2f32ERKfS1_PDv16_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000002BB0: BF8C0000
	flat_load_dwordx4 v[18:21], v[4:5] offset:48               // 000000002BB4: DC5C0030 12000004
	flat_load_dwordx4 v[14:17], v[4:5] offset:32               // 000000002BBC: DC5C0020 0E000004
	flat_load_dwordx4 v[10:13], v[4:5] offset:16               // 000000002BC4: DC5C0010 0A000004
	flat_load_dwordx4 v[6:9], v[4:5]                           // 000000002BCC: DC5C0000 06000004
	flat_load_dword v22, v[0:1]                                // 000000002BD4: DC500000 16000000
	s_nop 0                                                    // 000000002BDC: BF800000
	s_nop 0                                                    // 000000002BE0: BF800000
	flat_load_dword v0, v[2:3]                                 // 000000002BE4: DC500000 00000002
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000002BEC: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 000000002BF0: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 000000002BF8: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 000000002C00: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 000000002C08: D3D90003 00000109
	v_accvgpr_write_b32 a4, v10                                // 000000002C10: D3D90004 0000010A
	v_accvgpr_write_b32 a5, v11                                // 000000002C18: D3D90005 0000010B
	v_accvgpr_write_b32 a6, v12                                // 000000002C20: D3D90006 0000010C
	v_accvgpr_write_b32 a7, v13                                // 000000002C28: D3D90007 0000010D
	v_accvgpr_write_b32 a8, v14                                // 000000002C30: D3D90008 0000010E
	v_accvgpr_write_b32 a9, v15                                // 000000002C38: D3D90009 0000010F
	v_accvgpr_write_b32 a10, v16                               // 000000002C40: D3D9000A 00000110
	v_accvgpr_write_b32 a11, v17                               // 000000002C48: D3D9000B 00000111
	v_accvgpr_write_b32 a12, v18                               // 000000002C50: D3D9000C 00000112
	v_accvgpr_write_b32 a13, v19                               // 000000002C58: D3D9000D 00000113
	v_accvgpr_write_b32 a14, v20                               // 000000002C60: D3D9000E 00000114
	v_accvgpr_write_b32 a15, v21                               // 000000002C68: D3D9000F 00000115
	s_nop 0                                                    // 000000002C70: BF800000
	v_mfma_f32_32x32x2f32 a[0:15], v22, v0, a[0:15]            // 000000002C74: D3C40000 04020116
	s_nop 7                                                    // 000000002C7C: BF800007
	s_nop 7                                                    // 000000002C80: BF800007
	s_nop 1                                                    // 000000002C84: BF800001
	v_accvgpr_read_b32 v3, a11                                 // 000000002C88: D3D80003 0800010B
	v_accvgpr_read_b32 v2, a10                                 // 000000002C90: D3D80002 0800010A
	v_accvgpr_read_b32 v1, a9                                  // 000000002C98: D3D80001 08000109
	v_accvgpr_read_b32 v0, a8                                  // 000000002CA0: D3D80000 08000108
	v_accvgpr_read_b32 v9, a15                                 // 000000002CA8: D3D80009 0800010F
	v_accvgpr_read_b32 v8, a14                                 // 000000002CB0: D3D80008 0800010E
	v_accvgpr_read_b32 v7, a13                                 // 000000002CB8: D3D80007 0800010D
	v_accvgpr_read_b32 v6, a12                                 // 000000002CC0: D3D80006 0800010C
	v_accvgpr_read_b32 v13, a3                                 // 000000002CC8: D3D8000D 08000103
	v_accvgpr_read_b32 v12, a2                                 // 000000002CD0: D3D8000C 08000102
	v_accvgpr_read_b32 v11, a1                                 // 000000002CD8: D3D8000B 08000101
	v_accvgpr_read_b32 v10, a0                                 // 000000002CE0: D3D8000A 08000100
	v_accvgpr_read_b32 v17, a7                                 // 000000002CE8: D3D80011 08000107
	v_accvgpr_read_b32 v16, a6                                 // 000000002CF0: D3D80010 08000106
	v_accvgpr_read_b32 v15, a5                                 // 000000002CF8: D3D8000F 08000105
	v_accvgpr_read_b32 v14, a4                                 // 000000002D00: D3D8000E 08000104
	s_nop 0                                                    // 000000002D08: BF800000
	s_nop 0                                                    // 000000002D0C: BF800000
	flat_store_dwordx4 v[4:5], v[0:3] offset:32                // 000000002D10: DC7C0020 00000004
	flat_store_dwordx4 v[4:5], v[6:9] offset:48                // 000000002D18: DC7C0030 00000604
	flat_store_dwordx4 v[4:5], v[10:13]                        // 000000002D20: DC7C0000 00000A04
	flat_store_dwordx4 v[4:5], v[14:17] offset:16              // 000000002D28: DC7C0010 00000E04
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000002D30: BF8C0070
	s_setpc_b64 s[30:31]                                       // 000000002D34: BE801D1E
_ZN2ck26gcnasm_mfma_f32_16x16x4f32ERKfS1_PDv4_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000002D38: BF8C0000
	flat_load_dword v10, v[0:1]                                // 000000002D3C: DC500000 0A000000
	flat_load_dword v11, v[2:3]                                // 000000002D44: DC500000 0B000002
	flat_load_dwordx4 v[6:9], v[4:5]                           // 000000002D4C: DC5C0000 06000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000002D54: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 000000002D58: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 000000002D60: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 000000002D68: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 000000002D70: D3D90003 00000109
	s_nop 0                                                    // 000000002D78: BF800000
	v_mfma_f32_16x16x4f32 a[0:3], v10, v11, a[0:3]             // 000000002D7C: D3C50000 0402170A
	s_nop 7                                                    // 000000002D84: BF800007
	s_nop 1                                                    // 000000002D88: BF800001
	v_accvgpr_read_b32 v0, a0                                  // 000000002D8C: D3D80000 08000100
	v_accvgpr_read_b32 v1, a1                                  // 000000002D94: D3D80001 08000101
	v_accvgpr_read_b32 v2, a2                                  // 000000002D9C: D3D80002 08000102
	v_accvgpr_read_b32 v3, a3                                  // 000000002DA4: D3D80003 08000103
	s_nop 1                                                    // 000000002DAC: BF800001
	flat_store_dwordx4 v[4:5], v[0:3]                          // 000000002DB0: DC7C0000 00000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000002DB8: BF8C0070
	s_setpc_b64 s[30:31]                                       // 000000002DBC: BE801D1E
_ZN2ck26gcnasm_mfma_f32_16x16x1f32ILi16ELi64EEEvRKfS2_PDv16_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000002DC0: BF8C0000
	flat_load_dwordx4 v[18:21], v[4:5] offset:48               // 000000002DC4: DC5C0030 12000004
	flat_load_dwordx4 v[14:17], v[4:5] offset:32               // 000000002DCC: DC5C0020 0E000004
	flat_load_dwordx4 v[10:13], v[4:5] offset:16               // 000000002DD4: DC5C0010 0A000004
	flat_load_dwordx4 v[6:9], v[4:5]                           // 000000002DDC: DC5C0000 06000004
	flat_load_dword v22, v[0:1]                                // 000000002DE4: DC500000 16000000
	s_nop 0                                                    // 000000002DEC: BF800000
	s_nop 0                                                    // 000000002DF0: BF800000
	flat_load_dword v0, v[2:3]                                 // 000000002DF4: DC500000 00000002
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000002DFC: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 000000002E00: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 000000002E08: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 000000002E10: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 000000002E18: D3D90003 00000109
	v_accvgpr_write_b32 a4, v10                                // 000000002E20: D3D90004 0000010A
	v_accvgpr_write_b32 a5, v11                                // 000000002E28: D3D90005 0000010B
	v_accvgpr_write_b32 a6, v12                                // 000000002E30: D3D90006 0000010C
	v_accvgpr_write_b32 a7, v13                                // 000000002E38: D3D90007 0000010D
	v_accvgpr_write_b32 a8, v14                                // 000000002E40: D3D90008 0000010E
	v_accvgpr_write_b32 a9, v15                                // 000000002E48: D3D90009 0000010F
	v_accvgpr_write_b32 a10, v16                               // 000000002E50: D3D9000A 00000110
	v_accvgpr_write_b32 a11, v17                               // 000000002E58: D3D9000B 00000111
	v_accvgpr_write_b32 a12, v18                               // 000000002E60: D3D9000C 00000112
	v_accvgpr_write_b32 a13, v19                               // 000000002E68: D3D9000D 00000113
	v_accvgpr_write_b32 a14, v20                               // 000000002E70: D3D9000E 00000114
	v_accvgpr_write_b32 a15, v21                               // 000000002E78: D3D9000F 00000115
	s_nop 0                                                    // 000000002E80: BF800000
	v_mfma_f32_16x16x1f32 a[0:15], v22, v0, a[0:15] cbsz:2     // 000000002E84: D3C10200 04020116
	s_nop 7                                                    // 000000002E8C: BF800007
	s_nop 1                                                    // 000000002E90: BF800001
	v_accvgpr_read_b32 v3, a11                                 // 000000002E94: D3D80003 0800010B
	v_accvgpr_read_b32 v2, a10                                 // 000000002E9C: D3D80002 0800010A
	v_accvgpr_read_b32 v1, a9                                  // 000000002EA4: D3D80001 08000109
	v_accvgpr_read_b32 v0, a8                                  // 000000002EAC: D3D80000 08000108
	v_accvgpr_read_b32 v9, a15                                 // 000000002EB4: D3D80009 0800010F
	v_accvgpr_read_b32 v8, a14                                 // 000000002EBC: D3D80008 0800010E
	v_accvgpr_read_b32 v7, a13                                 // 000000002EC4: D3D80007 0800010D
	v_accvgpr_read_b32 v6, a12                                 // 000000002ECC: D3D80006 0800010C
	v_accvgpr_read_b32 v13, a3                                 // 000000002ED4: D3D8000D 08000103
	v_accvgpr_read_b32 v12, a2                                 // 000000002EDC: D3D8000C 08000102
	v_accvgpr_read_b32 v11, a1                                 // 000000002EE4: D3D8000B 08000101
	v_accvgpr_read_b32 v10, a0                                 // 000000002EEC: D3D8000A 08000100
	v_accvgpr_read_b32 v17, a7                                 // 000000002EF4: D3D80011 08000107
	v_accvgpr_read_b32 v16, a6                                 // 000000002EFC: D3D80010 08000106
	v_accvgpr_read_b32 v15, a5                                 // 000000002F04: D3D8000F 08000105
	v_accvgpr_read_b32 v14, a4                                 // 000000002F0C: D3D8000E 08000104
	s_nop 0                                                    // 000000002F14: BF800000
	s_nop 0                                                    // 000000002F18: BF800000
	flat_store_dwordx4 v[4:5], v[0:3] offset:32                // 000000002F1C: DC7C0020 00000004
	flat_store_dwordx4 v[4:5], v[6:9] offset:48                // 000000002F24: DC7C0030 00000604
	flat_store_dwordx4 v[4:5], v[10:13]                        // 000000002F2C: DC7C0000 00000A04
	flat_store_dwordx4 v[4:5], v[14:17] offset:16              // 000000002F34: DC7C0010 00000E04
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000002F3C: BF8C0070
	s_setpc_b64 s[30:31]                                       // 000000002F40: BE801D1E

_ZN2ck26gcnasm_mfma_f32_16x16x1f32ILi64ELi16EEEvRKfS2_PDv16_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000002F44: BF8C0000
	flat_load_dwordx4 v[18:21], v[4:5] offset:48               // 000000002F48: DC5C0030 12000004
	flat_load_dwordx4 v[14:17], v[4:5] offset:32               // 000000002F50: DC5C0020 0E000004
	flat_load_dwordx4 v[10:13], v[4:5] offset:16               // 000000002F58: DC5C0010 0A000004
	flat_load_dwordx4 v[6:9], v[4:5]                           // 000000002F60: DC5C0000 06000004
	flat_load_dword v22, v[0:1]                                // 000000002F68: DC500000 16000000
	s_nop 0                                                    // 000000002F70: BF800000
	s_nop 0                                                    // 000000002F74: BF800000
	flat_load_dword v0, v[2:3]                                 // 000000002F78: DC500000 00000002
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000002F80: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 000000002F84: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 000000002F8C: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 000000002F94: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 000000002F9C: D3D90003 00000109
	v_accvgpr_write_b32 a4, v10                                // 000000002FA4: D3D90004 0000010A
	v_accvgpr_write_b32 a5, v11                                // 000000002FAC: D3D90005 0000010B
	v_accvgpr_write_b32 a6, v12                                // 000000002FB4: D3D90006 0000010C
	v_accvgpr_write_b32 a7, v13                                // 000000002FBC: D3D90007 0000010D
	v_accvgpr_write_b32 a8, v14                                // 000000002FC4: D3D90008 0000010E
	v_accvgpr_write_b32 a9, v15                                // 000000002FCC: D3D90009 0000010F
	v_accvgpr_write_b32 a10, v16                               // 000000002FD4: D3D9000A 00000110
	v_accvgpr_write_b32 a11, v17                               // 000000002FDC: D3D9000B 00000111
	v_accvgpr_write_b32 a12, v18                               // 000000002FE4: D3D9000C 00000112
	v_accvgpr_write_b32 a13, v19                               // 000000002FEC: D3D9000D 00000113
	v_accvgpr_write_b32 a14, v20                               // 000000002FF4: D3D9000E 00000114
	v_accvgpr_write_b32 a15, v21                               // 000000002FFC: D3D9000F 00000115
	s_nop 0                                                    // 000000003004: BF800000
	v_mfma_f32_16x16x1f32 a[0:15], v22, v0, a[0:15] blgp:4     // 000000003008: D3C10000 84020116
	s_nop 7                                                    // 000000003010: BF800007
	s_nop 1                                                    // 000000003014: BF800001
	v_accvgpr_read_b32 v3, a11                                 // 000000003018: D3D80003 0800010B
	v_accvgpr_read_b32 v2, a10                                 // 000000003020: D3D80002 0800010A
	v_accvgpr_read_b32 v1, a9                                  // 000000003028: D3D80001 08000109
	v_accvgpr_read_b32 v0, a8                                  // 000000003030: D3D80000 08000108
	v_accvgpr_read_b32 v9, a15                                 // 000000003038: D3D80009 0800010F
	v_accvgpr_read_b32 v8, a14                                 // 000000003040: D3D80008 0800010E
	v_accvgpr_read_b32 v7, a13                                 // 000000003048: D3D80007 0800010D
	v_accvgpr_read_b32 v6, a12                                 // 000000003050: D3D80006 0800010C
	v_accvgpr_read_b32 v13, a3                                 // 000000003058: D3D8000D 08000103
	v_accvgpr_read_b32 v12, a2                                 // 000000003060: D3D8000C 08000102
	v_accvgpr_read_b32 v11, a1                                 // 000000003068: D3D8000B 08000101
	v_accvgpr_read_b32 v10, a0                                 // 000000003070: D3D8000A 08000100
	v_accvgpr_read_b32 v17, a7                                 // 000000003078: D3D80011 08000107
	v_accvgpr_read_b32 v16, a6                                 // 000000003080: D3D80010 08000106
	v_accvgpr_read_b32 v15, a5                                 // 000000003088: D3D8000F 08000105
	v_accvgpr_read_b32 v14, a4                                 // 000000003090: D3D8000E 08000104
	s_nop 0                                                    // 000000003098: BF800000
	s_nop 0                                                    // 00000000309C: BF800000
	flat_store_dwordx4 v[4:5], v[0:3] offset:32                // 0000000030A0: DC7C0020 00000004
	flat_store_dwordx4 v[4:5], v[6:9] offset:48                // 0000000030A8: DC7C0030 00000604
	flat_store_dwordx4 v[4:5], v[10:13]                        // 0000000030B0: DC7C0000 00000A04
	flat_store_dwordx4 v[4:5], v[14:17] offset:16              // 0000000030B8: DC7C0010 00000E04
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000030C0: BF8C0070
	s_setpc_b64 s[30:31]                                       // 0000000030C4: BE801D1E
_ZN2ck24gcnasm_mfma_f32_4x4x1f32ILi4ELi64EEEvRKfS2_PDv4_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 0000000030C8: BF8C0000
	flat_load_dword v10, v[0:1]                                // 0000000030CC: DC500000 0A000000
	flat_load_dword v11, v[2:3]                                // 0000000030D4: DC500000 0B000002
	flat_load_dwordx4 v[6:9], v[4:5]                           // 0000000030DC: DC5C0000 06000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000030E4: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 0000000030E8: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 0000000030F0: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 0000000030F8: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 000000003100: D3D90003 00000109
	s_nop 0                                                    // 000000003108: BF800000
	v_mfma_f32_4x4x1f32 a[0:3], v10, v11, a[0:3] cbsz:4        // 00000000310C: D3C20400 0402170A
	s_nop 3                                                    // 000000003114: BF800003
	v_accvgpr_read_b32 v0, a0                                  // 000000003118: D3D80000 08000100
	v_accvgpr_read_b32 v1, a1                                  // 000000003120: D3D80001 08000101
	v_accvgpr_read_b32 v2, a2                                  // 000000003128: D3D80002 08000102
	v_accvgpr_read_b32 v3, a3                                  // 000000003130: D3D80003 08000103
	s_nop 1                                                    // 000000003138: BF800001
	flat_store_dwordx4 v[4:5], v[0:3]                          // 00000000313C: DC7C0000 00000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003144: BF8C0070
	s_setpc_b64 s[30:31]                                       // 000000003148: BE801D1E

_ZN2ck24gcnasm_mfma_f32_4x4x1f32ILi8ELi64EEEvRKfS2_PDv4_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 00000000314C: BF8C0000
	flat_load_dword v14, v[0:1]                                // 000000003150: DC500000 0E000000
	flat_load_dword v15, v[2:3]                                // 000000003158: DC500000 0F000002
	flat_load_dwordx4 v[6:9], v[4:5]                           // 000000003160: DC5C0000 06000004
	flat_load_dwordx4 v[10:13], v[4:5] offset:16               // 000000003168: DC5C0010 0A000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003170: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 000000003174: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 00000000317C: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 000000003184: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 00000000318C: D3D90003 00000109
	s_nop 0                                                    // 000000003194: BF800000
	v_mfma_f32_4x4x1f32 a[0:3], v14, v15, a[0:3] cbsz:4        // 000000003198: D3C20400 04021F0E
	s_nop 3                                                    // 0000000031A0: BF800003
	v_accvgpr_read_b32 v9, a3                                  // 0000000031A4: D3D80009 08000103
	v_accvgpr_read_b32 v8, a2                                  // 0000000031AC: D3D80008 08000102
	v_accvgpr_read_b32 v7, a1                                  // 0000000031B4: D3D80007 08000101
	v_accvgpr_read_b32 v6, a0                                  // 0000000031BC: D3D80006 08000100
	v_accvgpr_write_b32 a0, v10                                // 0000000031C4: D3D90000 0000010A
	v_accvgpr_write_b32 a1, v11                                // 0000000031CC: D3D90001 0000010B
	v_accvgpr_write_b32 a2, v12                                // 0000000031D4: D3D90002 0000010C
	v_accvgpr_write_b32 a3, v13                                // 0000000031DC: D3D90003 0000010D
	s_nop 0                                                    // 0000000031E4: BF800000
	s_nop 0                                                    // 0000000031E8: BF800000
	flat_store_dwordx4 v[4:5], v[6:9]                          // 0000000031EC: DC7C0000 00000604
	flat_load_dword v6, v[0:1]                                 // 0000000031F4: DC500000 06000000
	s_nop 0                                                    // 0000000031FC: BF800000
	s_nop 0                                                    // 000000003200: BF800000
	flat_load_dword v7, v[2:3]                                 // 000000003204: DC500000 07000002
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000320C: BF8C0070
	v_mfma_f32_4x4x1f32 a[0:3], v6, v7, a[0:3] cbsz:4 abid:1   // 000000003210: D3C20C00 04020F06
	s_nop 3                                                    // 000000003218: BF800003
	v_accvgpr_read_b32 v0, a0                                  // 00000000321C: D3D80000 08000100
	v_accvgpr_read_b32 v1, a1                                  // 000000003224: D3D80001 08000101
	v_accvgpr_read_b32 v2, a2                                  // 00000000322C: D3D80002 08000102
	v_accvgpr_read_b32 v3, a3                                  // 000000003234: D3D80003 08000103
	s_nop 1                                                    // 00000000323C: BF800001
	flat_store_dwordx4 v[4:5], v[0:3] offset:16                // 000000003240: DC7C0010 00000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003248: BF8C0070
	s_setpc_b64 s[30:31]                                       // 00000000324C: BE801D1E

_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi64ELi64EEEvRKDv4_DF16_S3_PDv32_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000003250: BF8C0000
	flat_load_dwordx2 v[38:39], v[0:1]                         // 000000003254: DC540000 26000000
	flat_load_dwordx2 v[48:49], v[2:3]                         // 00000000325C: DC540000 30000002
	flat_load_dwordx4 v[34:37], v[4:5] offset:112              // 000000003264: DC5C0070 22000004
	flat_load_dwordx4 v[30:33], v[4:5] offset:96               // 00000000326C: DC5C0060 1E000004
	flat_load_dwordx4 v[26:29], v[4:5] offset:80               // 000000003274: DC5C0050 1A000004
	flat_load_dwordx4 v[22:25], v[4:5] offset:64               // 00000000327C: DC5C0040 16000004
	flat_load_dwordx4 v[18:21], v[4:5] offset:48               // 000000003284: DC5C0030 12000004
	flat_load_dwordx4 v[14:17], v[4:5] offset:32               // 00000000328C: DC5C0020 0E000004
	flat_load_dwordx4 v[10:13], v[4:5] offset:16               // 000000003294: DC5C0010 0A000004
	flat_load_dwordx4 v[6:9], v[4:5]                           // 00000000329C: DC5C0000 06000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000032A4: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 0000000032A8: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 0000000032B0: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 0000000032B8: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 0000000032C0: D3D90003 00000109
	v_accvgpr_write_b32 a4, v10                                // 0000000032C8: D3D90004 0000010A
	v_accvgpr_write_b32 a5, v11                                // 0000000032D0: D3D90005 0000010B
	v_accvgpr_write_b32 a6, v12                                // 0000000032D8: D3D90006 0000010C
	v_accvgpr_write_b32 a7, v13                                // 0000000032E0: D3D90007 0000010D
	v_accvgpr_write_b32 a8, v14                                // 0000000032E8: D3D90008 0000010E
	v_accvgpr_write_b32 a9, v15                                // 0000000032F0: D3D90009 0000010F
	v_accvgpr_write_b32 a10, v16                               // 0000000032F8: D3D9000A 00000110
	v_accvgpr_write_b32 a11, v17                               // 000000003300: D3D9000B 00000111
	v_accvgpr_write_b32 a12, v18                               // 000000003308: D3D9000C 00000112
	v_accvgpr_write_b32 a13, v19                               // 000000003310: D3D9000D 00000113
	v_accvgpr_write_b32 a14, v20                               // 000000003318: D3D9000E 00000114
	v_accvgpr_write_b32 a15, v21                               // 000000003320: D3D9000F 00000115
	v_accvgpr_write_b32 a16, v22                               // 000000003328: D3D90010 00000116
	v_accvgpr_write_b32 a17, v23                               // 000000003330: D3D90011 00000117
	v_accvgpr_write_b32 a18, v24                               // 000000003338: D3D90012 00000118
	v_accvgpr_write_b32 a19, v25                               // 000000003340: D3D90013 00000119
	v_accvgpr_write_b32 a20, v26                               // 000000003348: D3D90014 0000011A
	v_accvgpr_write_b32 a21, v27                               // 000000003350: D3D90015 0000011B
	v_accvgpr_write_b32 a22, v28                               // 000000003358: D3D90016 0000011C
	v_accvgpr_write_b32 a23, v29                               // 000000003360: D3D90017 0000011D
	v_accvgpr_write_b32 a24, v30                               // 000000003368: D3D90018 0000011E
	v_accvgpr_write_b32 a25, v31                               // 000000003370: D3D90019 0000011F
	v_accvgpr_write_b32 a26, v32                               // 000000003378: D3D9001A 00000120
	v_accvgpr_write_b32 a27, v33                               // 000000003380: D3D9001B 00000121
	v_accvgpr_write_b32 a28, v34                               // 000000003388: D3D9001C 00000122
	v_accvgpr_write_b32 a29, v35                               // 000000003390: D3D9001D 00000123
	v_accvgpr_write_b32 a30, v36                               // 000000003398: D3D9001E 00000124
	v_accvgpr_write_b32 a31, v37                               // 0000000033A0: D3D9001F 00000125
	s_nop 0                                                    // 0000000033A8: BF800000
	s_nop 0                                                    // 0000000033AC: BF800000
	flat_load_dwordx4 v[34:37], v[4:5] offset:240              // 0000000033B0: DC5C00F0 22000004
	flat_load_dwordx4 v[30:33], v[4:5] offset:224              // 0000000033B8: DC5C00E0 1E000004
	flat_load_dwordx4 v[26:29], v[4:5] offset:208              // 0000000033C0: DC5C00D0 1A000004
	flat_load_dwordx4 v[22:25], v[4:5] offset:192              // 0000000033C8: DC5C00C0 16000004
	flat_load_dwordx4 v[18:21], v[4:5] offset:176              // 0000000033D0: DC5C00B0 12000004
	flat_load_dwordx4 v[14:17], v[4:5] offset:160              // 0000000033D8: DC5C00A0 0E000004
	flat_load_dwordx4 v[10:13], v[4:5] offset:144              // 0000000033E0: DC5C0090 0A000004
	flat_load_dwordx4 v[6:9], v[4:5] offset:128                // 0000000033E8: DC5C0080 06000004
	v_mfma_f32_32x32x4f16 a[0:31], v[38:39], v[48:49], a[0:31] cbsz:1// 0000000033F0: D3C80100 04026126
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000033F8: BF8C0070
	v_accvgpr_write_b32 a63, v37                               // 0000000033FC: D3D9003F 00000125
	v_accvgpr_write_b32 a62, v36                               // 000000003404: D3D9003E 00000124
	v_accvgpr_write_b32 a61, v35                               // 00000000340C: D3D9003D 00000123
	v_accvgpr_write_b32 a60, v34                               // 000000003414: D3D9003C 00000122
	v_accvgpr_write_b32 a59, v33                               // 00000000341C: D3D9003B 00000121
	v_accvgpr_write_b32 a58, v32                               // 000000003424: D3D9003A 00000120
	v_accvgpr_write_b32 a57, v31                               // 00000000342C: D3D90039 0000011F
	v_accvgpr_write_b32 a56, v30                               // 000000003434: D3D90038 0000011E
	v_accvgpr_write_b32 a55, v29                               // 00000000343C: D3D90037 0000011D
	v_accvgpr_write_b32 a54, v28                               // 000000003444: D3D90036 0000011C
	v_accvgpr_write_b32 a53, v27                               // 00000000344C: D3D90035 0000011B
	v_accvgpr_write_b32 a52, v26                               // 000000003454: D3D90034 0000011A
	v_accvgpr_write_b32 a51, v25                               // 00000000345C: D3D90033 00000119
	v_accvgpr_write_b32 a50, v24                               // 000000003464: D3D90032 00000118
	v_accvgpr_write_b32 a49, v23                               // 00000000346C: D3D90031 00000117
	v_accvgpr_write_b32 a48, v22                               // 000000003474: D3D90030 00000116
	v_accvgpr_write_b32 a47, v21                               // 00000000347C: D3D9002F 00000115
	v_accvgpr_write_b32 a46, v20                               // 000000003484: D3D9002E 00000114
	v_accvgpr_write_b32 a45, v19                               // 00000000348C: D3D9002D 00000113
	v_accvgpr_write_b32 a44, v18                               // 000000003494: D3D9002C 00000112
	v_accvgpr_write_b32 a43, v17                               // 00000000349C: D3D9002B 00000111
	v_accvgpr_write_b32 a42, v16                               // 0000000034A4: D3D9002A 00000110
	v_accvgpr_write_b32 a41, v15                               // 0000000034AC: D3D90029 0000010F
	v_accvgpr_write_b32 a40, v14                               // 0000000034B4: D3D90028 0000010E
	v_accvgpr_write_b32 a39, v13                               // 0000000034BC: D3D90027 0000010D
	v_accvgpr_write_b32 a38, v12                               // 0000000034C4: D3D90026 0000010C
	v_accvgpr_write_b32 a37, v11                               // 0000000034CC: D3D90025 0000010B
	v_accvgpr_write_b32 a36, v10                               // 0000000034D4: D3D90024 0000010A
	v_accvgpr_write_b32 a35, v9                                // 0000000034DC: D3D90023 00000109
	v_accvgpr_write_b32 a34, v8                                // 0000000034E4: D3D90022 00000108
	v_accvgpr_write_b32 a33, v7                                // 0000000034EC: D3D90021 00000107
	v_accvgpr_write_b32 a32, v6                                // 0000000034F4: D3D90020 00000106
	v_accvgpr_read_b32 v9, a27                                 // 0000000034FC: D3D80009 0800011B
	v_accvgpr_read_b32 v8, a26                                 // 000000003504: D3D80008 0800011A
	v_accvgpr_read_b32 v7, a25                                 // 00000000350C: D3D80007 08000119
	v_accvgpr_read_b32 v6, a24                                 // 000000003514: D3D80006 08000118
	v_accvgpr_read_b32 v13, a31                                // 00000000351C: D3D8000D 0800011F
	v_accvgpr_read_b32 v12, a30                                // 000000003524: D3D8000C 0800011E
	v_accvgpr_read_b32 v11, a29                                // 00000000352C: D3D8000B 0800011D
	v_accvgpr_read_b32 v10, a28                                // 000000003534: D3D8000A 0800011C
	v_accvgpr_read_b32 v17, a19                                // 00000000353C: D3D80011 08000113
	v_accvgpr_read_b32 v16, a18                                // 000000003544: D3D80010 08000112
	v_accvgpr_read_b32 v15, a17                                // 00000000354C: D3D8000F 08000111
	v_accvgpr_read_b32 v14, a16                                // 000000003554: D3D8000E 08000110
	v_accvgpr_read_b32 v21, a23                                // 00000000355C: D3D80015 08000117
	v_accvgpr_read_b32 v20, a22                                // 000000003564: D3D80014 08000116
	v_accvgpr_read_b32 v19, a21                                // 00000000356C: D3D80013 08000115
	v_accvgpr_read_b32 v18, a20                                // 000000003574: D3D80012 08000114
	v_accvgpr_read_b32 v25, a11                                // 00000000357C: D3D80019 0800010B
	v_accvgpr_read_b32 v24, a10                                // 000000003584: D3D80018 0800010A
	v_accvgpr_read_b32 v23, a9                                 // 00000000358C: D3D80017 08000109
	v_accvgpr_read_b32 v22, a8                                 // 000000003594: D3D80016 08000108
	v_accvgpr_read_b32 v29, a15                                // 00000000359C: D3D8001D 0800010F
	v_accvgpr_read_b32 v28, a14                                // 0000000035A4: D3D8001C 0800010E
	v_accvgpr_read_b32 v27, a13                                // 0000000035AC: D3D8001B 0800010D
	v_accvgpr_read_b32 v26, a12                                // 0000000035B4: D3D8001A 0800010C
	v_accvgpr_read_b32 v33, a3                                 // 0000000035BC: D3D80021 08000103
	v_accvgpr_read_b32 v32, a2                                 // 0000000035C4: D3D80020 08000102
	v_accvgpr_read_b32 v31, a1                                 // 0000000035CC: D3D8001F 08000101
	v_accvgpr_read_b32 v30, a0                                 // 0000000035D4: D3D8001E 08000100
	v_accvgpr_read_b32 v37, a7                                 // 0000000035DC: D3D80025 08000107
	v_accvgpr_read_b32 v36, a6                                 // 0000000035E4: D3D80024 08000106
	v_accvgpr_read_b32 v35, a5                                 // 0000000035EC: D3D80023 08000105
	v_accvgpr_read_b32 v34, a4                                 // 0000000035F4: D3D80022 08000104
	s_nop 0                                                    // 0000000035FC: BF800000
	s_nop 0                                                    // 000000003600: BF800000
	flat_store_dwordx4 v[4:5], v[6:9] offset:96                // 000000003604: DC7C0060 00000604
	flat_store_dwordx4 v[4:5], v[10:13] offset:112             // 00000000360C: DC7C0070 00000A04
	flat_store_dwordx4 v[4:5], v[14:17] offset:64              // 000000003614: DC7C0040 00000E04
	flat_store_dwordx4 v[4:5], v[18:21] offset:80              // 00000000361C: DC7C0050 00001204
	flat_store_dwordx4 v[4:5], v[22:25] offset:32              // 000000003624: DC7C0020 00001604
	flat_store_dwordx4 v[4:5], v[26:29] offset:48              // 00000000362C: DC7C0030 00001A04
	flat_store_dwordx4 v[4:5], v[30:33]                        // 000000003634: DC7C0000 00001E04
	flat_store_dwordx4 v[4:5], v[34:37] offset:16              // 00000000363C: DC7C0010 00002204
	flat_load_dwordx2 v[6:7], v[0:1]                           // 000000003644: DC540000 06000000
	s_nop 0                                                    // 00000000364C: BF800000
	s_nop 0                                                    // 000000003650: BF800000
	flat_load_dwordx2 v[8:9], v[2:3]                           // 000000003654: DC540000 08000002
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000365C: BF8C0070
	v_mfma_f32_32x32x4f16 a[0:31], v[6:7], v[8:9], a[32:63] cbsz:1 abid:1// 000000003660: D3C80900 04821106
	s_nop 7                                                    // 000000003668: BF800007
	s_nop 7                                                    // 00000000366C: BF800007
	s_nop 1                                                    // 000000003670: BF800001
	v_accvgpr_read_b32 v3, a27                                 // 000000003674: D3D80003 0800011B
	v_accvgpr_read_b32 v2, a26                                 // 00000000367C: D3D80002 0800011A
	v_accvgpr_read_b32 v1, a25                                 // 000000003684: D3D80001 08000119
	v_accvgpr_read_b32 v0, a24                                 // 00000000368C: D3D80000 08000118
	v_accvgpr_read_b32 v9, a31                                 // 000000003694: D3D80009 0800011F
	v_accvgpr_read_b32 v8, a30                                 // 00000000369C: D3D80008 0800011E
	v_accvgpr_read_b32 v7, a29                                 // 0000000036A4: D3D80007 0800011D
	v_accvgpr_read_b32 v6, a28                                 // 0000000036AC: D3D80006 0800011C
	v_accvgpr_read_b32 v13, a19                                // 0000000036B4: D3D8000D 08000113
	v_accvgpr_read_b32 v12, a18                                // 0000000036BC: D3D8000C 08000112
	v_accvgpr_read_b32 v11, a17                                // 0000000036C4: D3D8000B 08000111
	v_accvgpr_read_b32 v10, a16                                // 0000000036CC: D3D8000A 08000110
	v_accvgpr_read_b32 v17, a23                                // 0000000036D4: D3D80011 08000117
	v_accvgpr_read_b32 v16, a22                                // 0000000036DC: D3D80010 08000116
	v_accvgpr_read_b32 v15, a21                                // 0000000036E4: D3D8000F 08000115
	v_accvgpr_read_b32 v14, a20                                // 0000000036EC: D3D8000E 08000114
	v_accvgpr_read_b32 v21, a11                                // 0000000036F4: D3D80015 0800010B
	v_accvgpr_read_b32 v20, a10                                // 0000000036FC: D3D80014 0800010A
	v_accvgpr_read_b32 v19, a9                                 // 000000003704: D3D80013 08000109
	v_accvgpr_read_b32 v18, a8                                 // 00000000370C: D3D80012 08000108
	v_accvgpr_read_b32 v25, a15                                // 000000003714: D3D80019 0800010F
	v_accvgpr_read_b32 v24, a14                                // 00000000371C: D3D80018 0800010E
	v_accvgpr_read_b32 v23, a13                                // 000000003724: D3D80017 0800010D
	v_accvgpr_read_b32 v22, a12                                // 00000000372C: D3D80016 0800010C
	v_accvgpr_read_b32 v29, a3                                 // 000000003734: D3D8001D 08000103
	v_accvgpr_read_b32 v28, a2                                 // 00000000373C: D3D8001C 08000102
	v_accvgpr_read_b32 v27, a1                                 // 000000003744: D3D8001B 08000101
	v_accvgpr_read_b32 v26, a0                                 // 00000000374C: D3D8001A 08000100
	v_accvgpr_read_b32 v33, a7                                 // 000000003754: D3D80021 08000107
	v_accvgpr_read_b32 v32, a6                                 // 00000000375C: D3D80020 08000106
	v_accvgpr_read_b32 v31, a5                                 // 000000003764: D3D8001F 08000105
	v_accvgpr_read_b32 v30, a4                                 // 00000000376C: D3D8001E 08000104
	s_nop 0                                                    // 000000003774: BF800000
	s_nop 0                                                    // 000000003778: BF800000
	flat_store_dwordx4 v[4:5], v[0:3] offset:224               // 00000000377C: DC7C00E0 00000004
	flat_store_dwordx4 v[4:5], v[6:9] offset:240               // 000000003784: DC7C00F0 00000604
	flat_store_dwordx4 v[4:5], v[10:13] offset:192             // 00000000378C: DC7C00C0 00000A04
	flat_store_dwordx4 v[4:5], v[14:17] offset:208             // 000000003794: DC7C00D0 00000E04
	flat_store_dwordx4 v[4:5], v[18:21] offset:160             // 00000000379C: DC7C00A0 00001204
	flat_store_dwordx4 v[4:5], v[22:25] offset:176             // 0000000037A4: DC7C00B0 00001604
	flat_store_dwordx4 v[4:5], v[26:29] offset:128             // 0000000037AC: DC7C0080 00001A04
	flat_store_dwordx4 v[4:5], v[30:33] offset:144             // 0000000037B4: DC7C0090 00001E04
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000037BC: BF8C0070
	s_setpc_b64 s[30:31]                                       // 0000000037C0: BE801D1E

_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi32ELi64EEEvRKDv4_DF16_S3_PDv32_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 0000000037C4: BF8C0000
	flat_load_dwordx4 v[34:37], v[4:5] offset:112              // 0000000037C8: DC5C0070 22000004
	flat_load_dwordx4 v[30:33], v[4:5] offset:96               // 0000000037D0: DC5C0060 1E000004
	flat_load_dwordx4 v[26:29], v[4:5] offset:80               // 0000000037D8: DC5C0050 1A000004
	flat_load_dwordx4 v[22:25], v[4:5] offset:64               // 0000000037E0: DC5C0040 16000004
	flat_load_dwordx4 v[18:21], v[4:5] offset:48               // 0000000037E8: DC5C0030 12000004
	flat_load_dwordx4 v[14:17], v[4:5] offset:32               // 0000000037F0: DC5C0020 0E000004
	flat_load_dwordx4 v[10:13], v[4:5] offset:16               // 0000000037F8: DC5C0010 0A000004
	flat_load_dwordx4 v[6:9], v[4:5]                           // 000000003800: DC5C0000 06000004
	flat_load_dwordx2 v[38:39], v[0:1]                         // 000000003808: DC540000 26000000
	s_nop 0                                                    // 000000003810: BF800000
	s_nop 0                                                    // 000000003814: BF800000
	flat_load_dwordx2 v[0:1], v[2:3]                           // 000000003818: DC540000 00000002
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003820: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 000000003824: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 00000000382C: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 000000003834: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 00000000383C: D3D90003 00000109
	v_accvgpr_write_b32 a4, v10                                // 000000003844: D3D90004 0000010A
	v_accvgpr_write_b32 a5, v11                                // 00000000384C: D3D90005 0000010B
	v_accvgpr_write_b32 a6, v12                                // 000000003854: D3D90006 0000010C
	v_accvgpr_write_b32 a7, v13                                // 00000000385C: D3D90007 0000010D
	v_accvgpr_write_b32 a8, v14                                // 000000003864: D3D90008 0000010E
	v_accvgpr_write_b32 a9, v15                                // 00000000386C: D3D90009 0000010F
	v_accvgpr_write_b32 a10, v16                               // 000000003874: D3D9000A 00000110
	v_accvgpr_write_b32 a11, v17                               // 00000000387C: D3D9000B 00000111
	v_accvgpr_write_b32 a12, v18                               // 000000003884: D3D9000C 00000112
	v_accvgpr_write_b32 a13, v19                               // 00000000388C: D3D9000D 00000113
	v_accvgpr_write_b32 a14, v20                               // 000000003894: D3D9000E 00000114
	v_accvgpr_write_b32 a15, v21                               // 00000000389C: D3D9000F 00000115
	v_accvgpr_write_b32 a16, v22                               // 0000000038A4: D3D90010 00000116
	v_accvgpr_write_b32 a17, v23                               // 0000000038AC: D3D90011 00000117
	v_accvgpr_write_b32 a18, v24                               // 0000000038B4: D3D90012 00000118
	v_accvgpr_write_b32 a19, v25                               // 0000000038BC: D3D90013 00000119
	v_accvgpr_write_b32 a20, v26                               // 0000000038C4: D3D90014 0000011A
	v_accvgpr_write_b32 a21, v27                               // 0000000038CC: D3D90015 0000011B
	v_accvgpr_write_b32 a22, v28                               // 0000000038D4: D3D90016 0000011C
	v_accvgpr_write_b32 a23, v29                               // 0000000038DC: D3D90017 0000011D
	v_accvgpr_write_b32 a24, v30                               // 0000000038E4: D3D90018 0000011E
	v_accvgpr_write_b32 a25, v31                               // 0000000038EC: D3D90019 0000011F
	v_accvgpr_write_b32 a26, v32                               // 0000000038F4: D3D9001A 00000120
	v_accvgpr_write_b32 a27, v33                               // 0000000038FC: D3D9001B 00000121
	v_accvgpr_write_b32 a28, v34                               // 000000003904: D3D9001C 00000122
	v_accvgpr_write_b32 a29, v35                               // 00000000390C: D3D9001D 00000123
	v_accvgpr_write_b32 a30, v36                               // 000000003914: D3D9001E 00000124
	v_accvgpr_write_b32 a31, v37                               // 00000000391C: D3D9001F 00000125
	s_nop 0                                                    // 000000003924: BF800000
	v_mfma_f32_32x32x4f16 a[0:31], v[38:39], v[0:1], a[0:31] cbsz:1// 000000003928: D3C80100 04020126
	s_nop 7                                                    // 000000003930: BF800007
	s_nop 7                                                    // 000000003934: BF800007
	s_nop 1                                                    // 000000003938: BF800001
	v_accvgpr_read_b32 v3, a27                                 // 00000000393C: D3D80003 0800011B
	v_accvgpr_read_b32 v2, a26                                 // 000000003944: D3D80002 0800011A
	v_accvgpr_read_b32 v1, a25                                 // 00000000394C: D3D80001 08000119
	v_accvgpr_read_b32 v0, a24                                 // 000000003954: D3D80000 08000118
	v_accvgpr_read_b32 v9, a31                                 // 00000000395C: D3D80009 0800011F
	v_accvgpr_read_b32 v8, a30                                 // 000000003964: D3D80008 0800011E
	v_accvgpr_read_b32 v7, a29                                 // 00000000396C: D3D80007 0800011D
	v_accvgpr_read_b32 v6, a28                                 // 000000003974: D3D80006 0800011C
	v_accvgpr_read_b32 v13, a19                                // 00000000397C: D3D8000D 08000113
	v_accvgpr_read_b32 v12, a18                                // 000000003984: D3D8000C 08000112
	v_accvgpr_read_b32 v11, a17                                // 00000000398C: D3D8000B 08000111
	v_accvgpr_read_b32 v10, a16                                // 000000003994: D3D8000A 08000110
	v_accvgpr_read_b32 v17, a23                                // 00000000399C: D3D80011 08000117
	v_accvgpr_read_b32 v16, a22                                // 0000000039A4: D3D80010 08000116
	v_accvgpr_read_b32 v15, a21                                // 0000000039AC: D3D8000F 08000115
	v_accvgpr_read_b32 v14, a20                                // 0000000039B4: D3D8000E 08000114
	v_accvgpr_read_b32 v21, a11                                // 0000000039BC: D3D80015 0800010B
	v_accvgpr_read_b32 v20, a10                                // 0000000039C4: D3D80014 0800010A
	v_accvgpr_read_b32 v19, a9                                 // 0000000039CC: D3D80013 08000109
	v_accvgpr_read_b32 v18, a8                                 // 0000000039D4: D3D80012 08000108
	v_accvgpr_read_b32 v25, a15                                // 0000000039DC: D3D80019 0800010F
	v_accvgpr_read_b32 v24, a14                                // 0000000039E4: D3D80018 0800010E
	v_accvgpr_read_b32 v23, a13                                // 0000000039EC: D3D80017 0800010D
	v_accvgpr_read_b32 v22, a12                                // 0000000039F4: D3D80016 0800010C
	v_accvgpr_read_b32 v29, a3                                 // 0000000039FC: D3D8001D 08000103
	v_accvgpr_read_b32 v28, a2                                 // 000000003A04: D3D8001C 08000102
	v_accvgpr_read_b32 v27, a1                                 // 000000003A0C: D3D8001B 08000101
	v_accvgpr_read_b32 v26, a0                                 // 000000003A14: D3D8001A 08000100
	v_accvgpr_read_b32 v33, a7                                 // 000000003A1C: D3D80021 08000107
	v_accvgpr_read_b32 v32, a6                                 // 000000003A24: D3D80020 08000106
	v_accvgpr_read_b32 v31, a5                                 // 000000003A2C: D3D8001F 08000105
	v_accvgpr_read_b32 v30, a4                                 // 000000003A34: D3D8001E 08000104
	s_nop 0                                                    // 000000003A3C: BF800000
	s_nop 0                                                    // 000000003A40: BF800000
	flat_store_dwordx4 v[4:5], v[0:3] offset:96                // 000000003A44: DC7C0060 00000004
	flat_store_dwordx4 v[4:5], v[6:9] offset:112               // 000000003A4C: DC7C0070 00000604
	flat_store_dwordx4 v[4:5], v[10:13] offset:64              // 000000003A54: DC7C0040 00000A04
	flat_store_dwordx4 v[4:5], v[14:17] offset:80              // 000000003A5C: DC7C0050 00000E04
	flat_store_dwordx4 v[4:5], v[18:21] offset:32              // 000000003A64: DC7C0020 00001204
	flat_store_dwordx4 v[4:5], v[22:25] offset:48              // 000000003A6C: DC7C0030 00001604
	flat_store_dwordx4 v[4:5], v[26:29]                        // 000000003A74: DC7C0000 00001A04
	flat_store_dwordx4 v[4:5], v[30:33] offset:16              // 000000003A7C: DC7C0010 00001E04
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003A84: BF8C0070
	s_setpc_b64 s[30:31]                                       // 000000003A88: BE801D1E
_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi64ELi32EEEvRKDv4_DF16_S3_PDv32_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000003A8C: BF8C0000
	flat_load_dwordx4 v[34:37], v[4:5] offset:112              // 000000003A90: DC5C0070 22000004
	flat_load_dwordx4 v[30:33], v[4:5] offset:96               // 000000003A98: DC5C0060 1E000004
	flat_load_dwordx4 v[26:29], v[4:5] offset:80               // 000000003AA0: DC5C0050 1A000004
	flat_load_dwordx4 v[22:25], v[4:5] offset:64               // 000000003AA8: DC5C0040 16000004
	flat_load_dwordx4 v[18:21], v[4:5] offset:48               // 000000003AB0: DC5C0030 12000004
	flat_load_dwordx4 v[14:17], v[4:5] offset:32               // 000000003AB8: DC5C0020 0E000004
	flat_load_dwordx4 v[10:13], v[4:5] offset:16               // 000000003AC0: DC5C0010 0A000004
	flat_load_dwordx4 v[6:9], v[4:5]                           // 000000003AC8: DC5C0000 06000004
	flat_load_dwordx2 v[38:39], v[0:1]                         // 000000003AD0: DC540000 26000000
	s_nop 0                                                    // 000000003AD8: BF800000
	s_nop 0                                                    // 000000003ADC: BF800000
	flat_load_dwordx2 v[0:1], v[2:3]                           // 000000003AE0: DC540000 00000002
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003AE8: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 000000003AEC: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 000000003AF4: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 000000003AFC: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 000000003B04: D3D90003 00000109
	v_accvgpr_write_b32 a4, v10                                // 000000003B0C: D3D90004 0000010A
	v_accvgpr_write_b32 a5, v11                                // 000000003B14: D3D90005 0000010B
	v_accvgpr_write_b32 a6, v12                                // 000000003B1C: D3D90006 0000010C
	v_accvgpr_write_b32 a7, v13                                // 000000003B24: D3D90007 0000010D
	v_accvgpr_write_b32 a8, v14                                // 000000003B2C: D3D90008 0000010E
	v_accvgpr_write_b32 a9, v15                                // 000000003B34: D3D90009 0000010F
	v_accvgpr_write_b32 a10, v16                               // 000000003B3C: D3D9000A 00000110
	v_accvgpr_write_b32 a11, v17                               // 000000003B44: D3D9000B 00000111
	v_accvgpr_write_b32 a12, v18                               // 000000003B4C: D3D9000C 00000112
	v_accvgpr_write_b32 a13, v19                               // 000000003B54: D3D9000D 00000113
	v_accvgpr_write_b32 a14, v20                               // 000000003B5C: D3D9000E 00000114
	v_accvgpr_write_b32 a15, v21                               // 000000003B64: D3D9000F 00000115
	v_accvgpr_write_b32 a16, v22                               // 000000003B6C: D3D90010 00000116
	v_accvgpr_write_b32 a17, v23                               // 000000003B74: D3D90011 00000117
	v_accvgpr_write_b32 a18, v24                               // 000000003B7C: D3D90012 00000118
	v_accvgpr_write_b32 a19, v25                               // 000000003B84: D3D90013 00000119
	v_accvgpr_write_b32 a20, v26                               // 000000003B8C: D3D90014 0000011A
	v_accvgpr_write_b32 a21, v27                               // 000000003B94: D3D90015 0000011B
	v_accvgpr_write_b32 a22, v28                               // 000000003B9C: D3D90016 0000011C
	v_accvgpr_write_b32 a23, v29                               // 000000003BA4: D3D90017 0000011D
	v_accvgpr_write_b32 a24, v30                               // 000000003BAC: D3D90018 0000011E
	v_accvgpr_write_b32 a25, v31                               // 000000003BB4: D3D90019 0000011F
	v_accvgpr_write_b32 a26, v32                               // 000000003BBC: D3D9001A 00000120
	v_accvgpr_write_b32 a27, v33                               // 000000003BC4: D3D9001B 00000121
	v_accvgpr_write_b32 a28, v34                               // 000000003BCC: D3D9001C 00000122
	v_accvgpr_write_b32 a29, v35                               // 000000003BD4: D3D9001D 00000123
	v_accvgpr_write_b32 a30, v36                               // 000000003BDC: D3D9001E 00000124
	v_accvgpr_write_b32 a31, v37                               // 000000003BE4: D3D9001F 00000125
	s_nop 0                                                    // 000000003BEC: BF800000
	v_mfma_f32_32x32x4f16 a[0:31], v[38:39], v[0:1], a[0:31] blgp:1// 000000003BF0: D3C80000 24020126
	s_nop 7                                                    // 000000003BF8: BF800007
	s_nop 7                                                    // 000000003BFC: BF800007
	s_nop 1                                                    // 000000003C00: BF800001
	v_accvgpr_read_b32 v3, a27                                 // 000000003C04: D3D80003 0800011B
	v_accvgpr_read_b32 v2, a26                                 // 000000003C0C: D3D80002 0800011A
	v_accvgpr_read_b32 v1, a25                                 // 000000003C14: D3D80001 08000119
	v_accvgpr_read_b32 v0, a24                                 // 000000003C1C: D3D80000 08000118
	v_accvgpr_read_b32 v9, a31                                 // 000000003C24: D3D80009 0800011F
	v_accvgpr_read_b32 v8, a30                                 // 000000003C2C: D3D80008 0800011E
	v_accvgpr_read_b32 v7, a29                                 // 000000003C34: D3D80007 0800011D
	v_accvgpr_read_b32 v6, a28                                 // 000000003C3C: D3D80006 0800011C
	v_accvgpr_read_b32 v13, a19                                // 000000003C44: D3D8000D 08000113
	v_accvgpr_read_b32 v12, a18                                // 000000003C4C: D3D8000C 08000112
	v_accvgpr_read_b32 v11, a17                                // 000000003C54: D3D8000B 08000111
	v_accvgpr_read_b32 v10, a16                                // 000000003C5C: D3D8000A 08000110
	v_accvgpr_read_b32 v17, a23                                // 000000003C64: D3D80011 08000117
	v_accvgpr_read_b32 v16, a22                                // 000000003C6C: D3D80010 08000116
	v_accvgpr_read_b32 v15, a21                                // 000000003C74: D3D8000F 08000115
	v_accvgpr_read_b32 v14, a20                                // 000000003C7C: D3D8000E 08000114
	v_accvgpr_read_b32 v21, a11                                // 000000003C84: D3D80015 0800010B
	v_accvgpr_read_b32 v20, a10                                // 000000003C8C: D3D80014 0800010A
	v_accvgpr_read_b32 v19, a9                                 // 000000003C94: D3D80013 08000109
	v_accvgpr_read_b32 v18, a8                                 // 000000003C9C: D3D80012 08000108
	v_accvgpr_read_b32 v25, a15                                // 000000003CA4: D3D80019 0800010F
	v_accvgpr_read_b32 v24, a14                                // 000000003CAC: D3D80018 0800010E
	v_accvgpr_read_b32 v23, a13                                // 000000003CB4: D3D80017 0800010D
	v_accvgpr_read_b32 v22, a12                                // 000000003CBC: D3D80016 0800010C
	v_accvgpr_read_b32 v29, a3                                 // 000000003CC4: D3D8001D 08000103
	v_accvgpr_read_b32 v28, a2                                 // 000000003CCC: D3D8001C 08000102
	v_accvgpr_read_b32 v27, a1                                 // 000000003CD4: D3D8001B 08000101
	v_accvgpr_read_b32 v26, a0                                 // 000000003CDC: D3D8001A 08000100
	v_accvgpr_read_b32 v33, a7                                 // 000000003CE4: D3D80021 08000107
	v_accvgpr_read_b32 v32, a6                                 // 000000003CEC: D3D80020 08000106
	v_accvgpr_read_b32 v31, a5                                 // 000000003CF4: D3D8001F 08000105
	v_accvgpr_read_b32 v30, a4                                 // 000000003CFC: D3D8001E 08000104
	s_nop 0                                                    // 000000003D04: BF800000
	s_nop 0                                                    // 000000003D08: BF800000
	flat_store_dwordx4 v[4:5], v[0:3] offset:96                // 000000003D0C: DC7C0060 00000004
	flat_store_dwordx4 v[4:5], v[6:9] offset:112               // 000000003D14: DC7C0070 00000604
	flat_store_dwordx4 v[4:5], v[10:13] offset:64              // 000000003D1C: DC7C0040 00000A04
	flat_store_dwordx4 v[4:5], v[14:17] offset:80              // 000000003D24: DC7C0050 00000E04
	flat_store_dwordx4 v[4:5], v[18:21] offset:32              // 000000003D2C: DC7C0020 00001204
	flat_store_dwordx4 v[4:5], v[22:25] offset:48              // 000000003D34: DC7C0030 00001604
	flat_store_dwordx4 v[4:5], v[26:29]                        // 000000003D3C: DC7C0000 00001A04
	flat_store_dwordx4 v[4:5], v[30:33] offset:16              // 000000003D44: DC7C0010 00001E04
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003D4C: BF8C0070
	s_setpc_b64 s[30:31]                                       // 000000003D50: BE801D1E

_ZN2ck26gcnasm_mfma_f32_32x32x8f16ERKDv4_DF16_S2_PDv16_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000003D54: BF8C0000
	flat_load_dwordx4 v[18:21], v[4:5] offset:48               // 000000003D58: DC5C0030 12000004
	flat_load_dwordx4 v[14:17], v[4:5] offset:32               // 000000003D60: DC5C0020 0E000004
	flat_load_dwordx4 v[10:13], v[4:5] offset:16               // 000000003D68: DC5C0010 0A000004
	flat_load_dwordx4 v[6:9], v[4:5]                           // 000000003D70: DC5C0000 06000004
	flat_load_dwordx2 v[22:23], v[0:1]                         // 000000003D78: DC540000 16000000
	s_nop 0                                                    // 000000003D80: BF800000
	s_nop 0                                                    // 000000003D84: BF800000
	flat_load_dwordx2 v[0:1], v[2:3]                           // 000000003D88: DC540000 00000002
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003D90: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 000000003D94: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 000000003D9C: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 000000003DA4: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 000000003DAC: D3D90003 00000109
	v_accvgpr_write_b32 a4, v10                                // 000000003DB4: D3D90004 0000010A
	v_accvgpr_write_b32 a5, v11                                // 000000003DBC: D3D90005 0000010B
	v_accvgpr_write_b32 a6, v12                                // 000000003DC4: D3D90006 0000010C
	v_accvgpr_write_b32 a7, v13                                // 000000003DCC: D3D90007 0000010D
	v_accvgpr_write_b32 a8, v14                                // 000000003DD4: D3D90008 0000010E
	v_accvgpr_write_b32 a9, v15                                // 000000003DDC: D3D90009 0000010F
	v_accvgpr_write_b32 a10, v16                               // 000000003DE4: D3D9000A 00000110
	v_accvgpr_write_b32 a11, v17                               // 000000003DEC: D3D9000B 00000111
	v_accvgpr_write_b32 a12, v18                               // 000000003DF4: D3D9000C 00000112
	v_accvgpr_write_b32 a13, v19                               // 000000003DFC: D3D9000D 00000113
	v_accvgpr_write_b32 a14, v20                               // 000000003E04: D3D9000E 00000114
	v_accvgpr_write_b32 a15, v21                               // 000000003E0C: D3D9000F 00000115
	s_nop 0                                                    // 000000003E14: BF800000
	v_mfma_f32_32x32x8f16 a[0:15], v[22:23], v[0:1], a[0:15]   // 000000003E18: D3CC0000 04020116
	s_nop 7                                                    // 000000003E20: BF800007
	s_nop 7                                                    // 000000003E24: BF800007
	s_nop 1                                                    // 000000003E28: BF800001
	v_accvgpr_read_b32 v3, a11                                 // 000000003E2C: D3D80003 0800010B
	v_accvgpr_read_b32 v2, a10                                 // 000000003E34: D3D80002 0800010A
	v_accvgpr_read_b32 v1, a9                                  // 000000003E3C: D3D80001 08000109
	v_accvgpr_read_b32 v0, a8                                  // 000000003E44: D3D80000 08000108
	v_accvgpr_read_b32 v9, a15                                 // 000000003E4C: D3D80009 0800010F
	v_accvgpr_read_b32 v8, a14                                 // 000000003E54: D3D80008 0800010E
	v_accvgpr_read_b32 v7, a13                                 // 000000003E5C: D3D80007 0800010D
	v_accvgpr_read_b32 v6, a12                                 // 000000003E64: D3D80006 0800010C
	v_accvgpr_read_b32 v13, a3                                 // 000000003E6C: D3D8000D 08000103
	v_accvgpr_read_b32 v12, a2                                 // 000000003E74: D3D8000C 08000102
	v_accvgpr_read_b32 v11, a1                                 // 000000003E7C: D3D8000B 08000101
	v_accvgpr_read_b32 v10, a0                                 // 000000003E84: D3D8000A 08000100
	v_accvgpr_read_b32 v17, a7                                 // 000000003E8C: D3D80011 08000107
	v_accvgpr_read_b32 v16, a6                                 // 000000003E94: D3D80010 08000106
	v_accvgpr_read_b32 v15, a5                                 // 000000003E9C: D3D8000F 08000105
	v_accvgpr_read_b32 v14, a4                                 // 000000003EA4: D3D8000E 08000104
	s_nop 0                                                    // 000000003EAC: BF800000
	s_nop 0                                                    // 000000003EB0: BF800000
	flat_store_dwordx4 v[4:5], v[0:3] offset:32                // 000000003EB4: DC7C0020 00000004
	flat_store_dwordx4 v[4:5], v[6:9] offset:48                // 000000003EBC: DC7C0030 00000604
	flat_store_dwordx4 v[4:5], v[10:13]                        // 000000003EC4: DC7C0000 00000A04
	flat_store_dwordx4 v[4:5], v[14:17] offset:16              // 000000003ECC: DC7C0010 00000E04
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003ED4: BF8C0070
	s_setpc_b64 s[30:31]                                       // 000000003ED8: BE801D1E

_ZN2ck27gcnasm_mfma_f32_16x16x16f16ERKDv4_DF16_S2_PDv4_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000003EDC: BF8C0000
	flat_load_dwordx2 v[10:11], v[0:1]                         // 000000003EE0: DC540000 0A000000
	flat_load_dwordx2 v[12:13], v[2:3]                         // 000000003EE8: DC540000 0C000002
	flat_load_dwordx4 v[6:9], v[4:5]                           // 000000003EF0: DC5C0000 06000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003EF8: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 000000003EFC: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 000000003F04: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 000000003F0C: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 000000003F14: D3D90003 00000109
	s_nop 0                                                    // 000000003F1C: BF800000
	v_mfma_f32_16x16x16f16 a[0:3], v[10:11], v[12:13], a[0:3]  // 000000003F20: D3CD0000 0402190A
	s_nop 7                                                    // 000000003F28: BF800007
	s_nop 1                                                    // 000000003F2C: BF800001
	v_accvgpr_read_b32 v0, a0                                  // 000000003F30: D3D80000 08000100
	v_accvgpr_read_b32 v1, a1                                  // 000000003F38: D3D80001 08000101
	v_accvgpr_read_b32 v2, a2                                  // 000000003F40: D3D80002 08000102
	v_accvgpr_read_b32 v3, a3                                  // 000000003F48: D3D80003 08000103
	s_nop 1                                                    // 000000003F50: BF800001
	flat_store_dwordx4 v[4:5], v[0:3]                          // 000000003F54: DC7C0000 00000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003F5C: BF8C0070
	s_setpc_b64 s[30:31]                                       // 000000003F60: BE801D1E

_ZN2ck26gcnasm_mfma_f32_16x16x4f16ILi16ELi64EEEvRKDv4_DF16_S3_PDv16_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000003F64: BF8C0000
	flat_load_dwordx4 v[18:21], v[4:5] offset:48               // 000000003F68: DC5C0030 12000004
	flat_load_dwordx4 v[14:17], v[4:5] offset:32               // 000000003F70: DC5C0020 0E000004
	flat_load_dwordx4 v[10:13], v[4:5] offset:16               // 000000003F78: DC5C0010 0A000004
	flat_load_dwordx4 v[6:9], v[4:5]                           // 000000003F80: DC5C0000 06000004
	flat_load_dwordx2 v[22:23], v[0:1]                         // 000000003F88: DC540000 16000000
	s_nop 0                                                    // 000000003F90: BF800000
	s_nop 0                                                    // 000000003F94: BF800000
	flat_load_dwordx2 v[0:1], v[2:3]                           // 000000003F98: DC540000 00000002
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003FA0: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 000000003FA4: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 000000003FAC: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 000000003FB4: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 000000003FBC: D3D90003 00000109
	v_accvgpr_write_b32 a4, v10                                // 000000003FC4: D3D90004 0000010A
	v_accvgpr_write_b32 a5, v11                                // 000000003FCC: D3D90005 0000010B
	v_accvgpr_write_b32 a6, v12                                // 000000003FD4: D3D90006 0000010C
	v_accvgpr_write_b32 a7, v13                                // 000000003FDC: D3D90007 0000010D
	v_accvgpr_write_b32 a8, v14                                // 000000003FE4: D3D90008 0000010E
	v_accvgpr_write_b32 a9, v15                                // 000000003FEC: D3D90009 0000010F
	v_accvgpr_write_b32 a10, v16                               // 000000003FF4: D3D9000A 00000110
	v_accvgpr_write_b32 a11, v17                               // 000000003FFC: D3D9000B 00000111
	v_accvgpr_write_b32 a12, v18                               // 000000004004: D3D9000C 00000112
	v_accvgpr_write_b32 a13, v19                               // 00000000400C: D3D9000D 00000113
	v_accvgpr_write_b32 a14, v20                               // 000000004014: D3D9000E 00000114
	v_accvgpr_write_b32 a15, v21                               // 00000000401C: D3D9000F 00000115
	s_nop 0                                                    // 000000004024: BF800000
	v_mfma_f32_16x16x4f16 a[0:15], v[22:23], v[0:1], a[0:15] cbsz:2// 000000004028: D3C90200 04020116
	s_nop 7                                                    // 000000004030: BF800007
	s_nop 1                                                    // 000000004034: BF800001
	v_accvgpr_read_b32 v3, a11                                 // 000000004038: D3D80003 0800010B
	v_accvgpr_read_b32 v2, a10                                 // 000000004040: D3D80002 0800010A
	v_accvgpr_read_b32 v1, a9                                  // 000000004048: D3D80001 08000109
	v_accvgpr_read_b32 v0, a8                                  // 000000004050: D3D80000 08000108
	v_accvgpr_read_b32 v9, a15                                 // 000000004058: D3D80009 0800010F
	v_accvgpr_read_b32 v8, a14                                 // 000000004060: D3D80008 0800010E
	v_accvgpr_read_b32 v7, a13                                 // 000000004068: D3D80007 0800010D
	v_accvgpr_read_b32 v6, a12                                 // 000000004070: D3D80006 0800010C
	v_accvgpr_read_b32 v13, a3                                 // 000000004078: D3D8000D 08000103
	v_accvgpr_read_b32 v12, a2                                 // 000000004080: D3D8000C 08000102
	v_accvgpr_read_b32 v11, a1                                 // 000000004088: D3D8000B 08000101
	v_accvgpr_read_b32 v10, a0                                 // 000000004090: D3D8000A 08000100
	v_accvgpr_read_b32 v17, a7                                 // 000000004098: D3D80011 08000107
	v_accvgpr_read_b32 v16, a6                                 // 0000000040A0: D3D80010 08000106
	v_accvgpr_read_b32 v15, a5                                 // 0000000040A8: D3D8000F 08000105
	v_accvgpr_read_b32 v14, a4                                 // 0000000040B0: D3D8000E 08000104
	s_nop 0                                                    // 0000000040B8: BF800000
	s_nop 0                                                    // 0000000040BC: BF800000
	flat_store_dwordx4 v[4:5], v[0:3] offset:32                // 0000000040C0: DC7C0020 00000004
	flat_store_dwordx4 v[4:5], v[6:9] offset:48                // 0000000040C8: DC7C0030 00000604
	flat_store_dwordx4 v[4:5], v[10:13]                        // 0000000040D0: DC7C0000 00000A04
	flat_store_dwordx4 v[4:5], v[14:17] offset:16              // 0000000040D8: DC7C0010 00000E04
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000040E0: BF8C0070
	s_setpc_b64 s[30:31]                                       // 0000000040E4: BE801D1E

_ZN2ck26gcnasm_mfma_f32_16x16x4f16ILi64ELi16EEEvRKDv4_DF16_S3_PDv16_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 0000000040E8: BF8C0000
	flat_load_dwordx4 v[18:21], v[4:5] offset:48               // 0000000040EC: DC5C0030 12000004
	flat_load_dwordx4 v[14:17], v[4:5] offset:32               // 0000000040F4: DC5C0020 0E000004
	flat_load_dwordx4 v[10:13], v[4:5] offset:16               // 0000000040FC: DC5C0010 0A000004
	flat_load_dwordx4 v[6:9], v[4:5]                           // 000000004104: DC5C0000 06000004
	flat_load_dwordx2 v[22:23], v[0:1]                         // 00000000410C: DC540000 16000000
	s_nop 0                                                    // 000000004114: BF800000
	s_nop 0                                                    // 000000004118: BF800000
	flat_load_dwordx2 v[0:1], v[2:3]                           // 00000000411C: DC540000 00000002
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004124: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 000000004128: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 000000004130: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 000000004138: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 000000004140: D3D90003 00000109
	v_accvgpr_write_b32 a4, v10                                // 000000004148: D3D90004 0000010A
	v_accvgpr_write_b32 a5, v11                                // 000000004150: D3D90005 0000010B
	v_accvgpr_write_b32 a6, v12                                // 000000004158: D3D90006 0000010C
	v_accvgpr_write_b32 a7, v13                                // 000000004160: D3D90007 0000010D
	v_accvgpr_write_b32 a8, v14                                // 000000004168: D3D90008 0000010E
	v_accvgpr_write_b32 a9, v15                                // 000000004170: D3D90009 0000010F
	v_accvgpr_write_b32 a10, v16                               // 000000004178: D3D9000A 00000110
	v_accvgpr_write_b32 a11, v17                               // 000000004180: D3D9000B 00000111
	v_accvgpr_write_b32 a12, v18                               // 000000004188: D3D9000C 00000112
	v_accvgpr_write_b32 a13, v19                               // 000000004190: D3D9000D 00000113
	v_accvgpr_write_b32 a14, v20                               // 000000004198: D3D9000E 00000114
	v_accvgpr_write_b32 a15, v21                               // 0000000041A0: D3D9000F 00000115
	s_nop 0                                                    // 0000000041A8: BF800000
	v_mfma_f32_16x16x4f16 a[0:15], v[22:23], v[0:1], a[0:15] blgp:4// 0000000041AC: D3C90000 84020116
	s_nop 7                                                    // 0000000041B4: BF800007
	s_nop 1                                                    // 0000000041B8: BF800001
	v_accvgpr_read_b32 v3, a11                                 // 0000000041BC: D3D80003 0800010B
	v_accvgpr_read_b32 v2, a10                                 // 0000000041C4: D3D80002 0800010A
	v_accvgpr_read_b32 v1, a9                                  // 0000000041CC: D3D80001 08000109
	v_accvgpr_read_b32 v0, a8                                  // 0000000041D4: D3D80000 08000108
	v_accvgpr_read_b32 v9, a15                                 // 0000000041DC: D3D80009 0800010F
	v_accvgpr_read_b32 v8, a14                                 // 0000000041E4: D3D80008 0800010E
	v_accvgpr_read_b32 v7, a13                                 // 0000000041EC: D3D80007 0800010D
	v_accvgpr_read_b32 v6, a12                                 // 0000000041F4: D3D80006 0800010C
	v_accvgpr_read_b32 v13, a3                                 // 0000000041FC: D3D8000D 08000103
	v_accvgpr_read_b32 v12, a2                                 // 000000004204: D3D8000C 08000102
	v_accvgpr_read_b32 v11, a1                                 // 00000000420C: D3D8000B 08000101
	v_accvgpr_read_b32 v10, a0                                 // 000000004214: D3D8000A 08000100
	v_accvgpr_read_b32 v17, a7                                 // 00000000421C: D3D80011 08000107
	v_accvgpr_read_b32 v16, a6                                 // 000000004224: D3D80010 08000106
	v_accvgpr_read_b32 v15, a5                                 // 00000000422C: D3D8000F 08000105
	v_accvgpr_read_b32 v14, a4                                 // 000000004234: D3D8000E 08000104
	s_nop 0                                                    // 00000000423C: BF800000
	s_nop 0                                                    // 000000004240: BF800000
	flat_store_dwordx4 v[4:5], v[0:3] offset:32                // 000000004244: DC7C0020 00000004
	flat_store_dwordx4 v[4:5], v[6:9] offset:48                // 00000000424C: DC7C0030 00000604
	flat_store_dwordx4 v[4:5], v[10:13]                        // 000000004254: DC7C0000 00000A04
	flat_store_dwordx4 v[4:5], v[14:17] offset:16              // 00000000425C: DC7C0010 00000E04
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004264: BF8C0070
	s_setpc_b64 s[30:31]                                       // 000000004268: BE801D1E

_ZN2ck24gcnasm_mfma_f32_4x4x4f16ILi4ELi64EEEvRKDv4_DF16_S3_PDv4_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 00000000426C: BF8C0000
	flat_load_dwordx2 v[10:11], v[0:1]                         // 000000004270: DC540000 0A000000
	flat_load_dwordx2 v[12:13], v[2:3]                         // 000000004278: DC540000 0C000002
	flat_load_dwordx4 v[6:9], v[4:5]                           // 000000004280: DC5C0000 06000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004288: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 00000000428C: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 000000004294: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 00000000429C: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 0000000042A4: D3D90003 00000109
	s_nop 0                                                    // 0000000042AC: BF800000
	v_mfma_f32_4x4x4f16 a[0:3], v[10:11], v[12:13], a[0:3] cbsz:4// 0000000042B0: D3CA0400 0402190A
	s_nop 3                                                    // 0000000042B8: BF800003
	v_accvgpr_read_b32 v0, a0                                  // 0000000042BC: D3D80000 08000100
	v_accvgpr_read_b32 v1, a1                                  // 0000000042C4: D3D80001 08000101
	v_accvgpr_read_b32 v2, a2                                  // 0000000042CC: D3D80002 08000102
	v_accvgpr_read_b32 v3, a3                                  // 0000000042D4: D3D80003 08000103
	s_nop 1                                                    // 0000000042DC: BF800001
	flat_store_dwordx4 v[4:5], v[0:3]                          // 0000000042E0: DC7C0000 00000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000042E8: BF8C0070
	s_setpc_b64 s[30:31]                                       // 0000000042EC: BE801D1E

_ZN2ck24gcnasm_mfma_f32_4x4x4f16ILi8ELi64EEEvRKDv4_DF16_S3_PDv4_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 0000000042F0: BF8C0000
	flat_load_dwordx2 v[14:15], v[0:1]                         // 0000000042F4: DC540000 0E000000
	flat_load_dwordx2 v[16:17], v[2:3]                         // 0000000042FC: DC540000 10000002
	flat_load_dwordx4 v[6:9], v[4:5]                           // 000000004304: DC5C0000 06000004
	flat_load_dwordx4 v[10:13], v[4:5] offset:16               // 00000000430C: DC5C0010 0A000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004314: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 000000004318: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 000000004320: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 000000004328: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 000000004330: D3D90003 00000109
	s_nop 0                                                    // 000000004338: BF800000
	v_mfma_f32_4x4x4f16 a[0:3], v[14:15], v[16:17], a[0:3] cbsz:4// 00000000433C: D3CA0400 0402210E
	s_nop 3                                                    // 000000004344: BF800003
	v_accvgpr_read_b32 v9, a3                                  // 000000004348: D3D80009 08000103
	v_accvgpr_read_b32 v8, a2                                  // 000000004350: D3D80008 08000102
	v_accvgpr_read_b32 v7, a1                                  // 000000004358: D3D80007 08000101
	v_accvgpr_read_b32 v6, a0                                  // 000000004360: D3D80006 08000100
	v_accvgpr_write_b32 a0, v10                                // 000000004368: D3D90000 0000010A
	v_accvgpr_write_b32 a1, v11                                // 000000004370: D3D90001 0000010B
	v_accvgpr_write_b32 a2, v12                                // 000000004378: D3D90002 0000010C
	v_accvgpr_write_b32 a3, v13                                // 000000004380: D3D90003 0000010D
	s_nop 0                                                    // 000000004388: BF800000
	s_nop 0                                                    // 00000000438C: BF800000
	flat_store_dwordx4 v[4:5], v[6:9]                          // 000000004390: DC7C0000 00000604
	flat_load_dwordx2 v[6:7], v[0:1]                           // 000000004398: DC540000 06000000
	s_nop 0                                                    // 0000000043A0: BF800000
	s_nop 0                                                    // 0000000043A4: BF800000
	flat_load_dwordx2 v[8:9], v[2:3]                           // 0000000043A8: DC540000 08000002
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000043B0: BF8C0070
	v_mfma_f32_4x4x4f16 a[0:3], v[6:7], v[8:9], a[0:3] cbsz:4 abid:1// 0000000043B4: D3CA0C00 04021106
	s_nop 3                                                    // 0000000043BC: BF800003
	v_accvgpr_read_b32 v0, a0                                  // 0000000043C0: D3D80000 08000100
	v_accvgpr_read_b32 v1, a1                                  // 0000000043C8: D3D80001 08000101
	v_accvgpr_read_b32 v2, a2                                  // 0000000043D0: D3D80002 08000102
	v_accvgpr_read_b32 v3, a3                                  // 0000000043D8: D3D80003 08000103
	s_nop 1                                                    // 0000000043E0: BF800001
	flat_store_dwordx4 v[4:5], v[0:3] offset:16                // 0000000043E4: DC7C0010 00000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000043EC: BF8C0070
	s_setpc_b64 s[30:31]                                       // 0000000043F0: BE801D1E

_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi64ELi64EEEvRKDv2_tS3_PDv32_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 0000000043F4: BF8C0000
	flat_load_dword v38, v[0:1]                                // 0000000043F8: DC500000 26000000
	flat_load_dword v39, v[2:3]                                // 000000004400: DC500000 27000002
	flat_load_dwordx4 v[34:37], v[4:5] offset:112              // 000000004408: DC5C0070 22000004
	flat_load_dwordx4 v[30:33], v[4:5] offset:96               // 000000004410: DC5C0060 1E000004
	flat_load_dwordx4 v[26:29], v[4:5] offset:80               // 000000004418: DC5C0050 1A000004
	flat_load_dwordx4 v[22:25], v[4:5] offset:64               // 000000004420: DC5C0040 16000004
	flat_load_dwordx4 v[18:21], v[4:5] offset:48               // 000000004428: DC5C0030 12000004
	flat_load_dwordx4 v[14:17], v[4:5] offset:32               // 000000004430: DC5C0020 0E000004
	flat_load_dwordx4 v[10:13], v[4:5] offset:16               // 000000004438: DC5C0010 0A000004
	flat_load_dwordx4 v[6:9], v[4:5]                           // 000000004440: DC5C0000 06000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004448: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 00000000444C: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 000000004454: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 00000000445C: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 000000004464: D3D90003 00000109
	v_accvgpr_write_b32 a4, v10                                // 00000000446C: D3D90004 0000010A
	v_accvgpr_write_b32 a5, v11                                // 000000004474: D3D90005 0000010B
	v_accvgpr_write_b32 a6, v12                                // 00000000447C: D3D90006 0000010C
	v_accvgpr_write_b32 a7, v13                                // 000000004484: D3D90007 0000010D
	v_accvgpr_write_b32 a8, v14                                // 00000000448C: D3D90008 0000010E
	v_accvgpr_write_b32 a9, v15                                // 000000004494: D3D90009 0000010F
	v_accvgpr_write_b32 a10, v16                               // 00000000449C: D3D9000A 00000110
	v_accvgpr_write_b32 a11, v17                               // 0000000044A4: D3D9000B 00000111
	v_accvgpr_write_b32 a12, v18                               // 0000000044AC: D3D9000C 00000112
	v_accvgpr_write_b32 a13, v19                               // 0000000044B4: D3D9000D 00000113
	v_accvgpr_write_b32 a14, v20                               // 0000000044BC: D3D9000E 00000114
	v_accvgpr_write_b32 a15, v21                               // 0000000044C4: D3D9000F 00000115
	v_accvgpr_write_b32 a16, v22                               // 0000000044CC: D3D90010 00000116
	v_accvgpr_write_b32 a17, v23                               // 0000000044D4: D3D90011 00000117
	v_accvgpr_write_b32 a18, v24                               // 0000000044DC: D3D90012 00000118
	v_accvgpr_write_b32 a19, v25                               // 0000000044E4: D3D90013 00000119
	v_accvgpr_write_b32 a20, v26                               // 0000000044EC: D3D90014 0000011A
	v_accvgpr_write_b32 a21, v27                               // 0000000044F4: D3D90015 0000011B
	v_accvgpr_write_b32 a22, v28                               // 0000000044FC: D3D90016 0000011C
	v_accvgpr_write_b32 a23, v29                               // 000000004504: D3D90017 0000011D
	v_accvgpr_write_b32 a24, v30                               // 00000000450C: D3D90018 0000011E
	v_accvgpr_write_b32 a25, v31                               // 000000004514: D3D90019 0000011F
	v_accvgpr_write_b32 a26, v32                               // 00000000451C: D3D9001A 00000120
	v_accvgpr_write_b32 a27, v33                               // 000000004524: D3D9001B 00000121
	v_accvgpr_write_b32 a28, v34                               // 00000000452C: D3D9001C 00000122
	v_accvgpr_write_b32 a29, v35                               // 000000004534: D3D9001D 00000123
	v_accvgpr_write_b32 a30, v36                               // 00000000453C: D3D9001E 00000124
	v_accvgpr_write_b32 a31, v37                               // 000000004544: D3D9001F 00000125
	s_nop 0                                                    // 00000000454C: BF800000
	s_nop 0                                                    // 000000004550: BF800000
	flat_load_dwordx4 v[34:37], v[4:5] offset:240              // 000000004554: DC5C00F0 22000004
	flat_load_dwordx4 v[30:33], v[4:5] offset:224              // 00000000455C: DC5C00E0 1E000004
	flat_load_dwordx4 v[26:29], v[4:5] offset:208              // 000000004564: DC5C00D0 1A000004
	flat_load_dwordx4 v[22:25], v[4:5] offset:192              // 00000000456C: DC5C00C0 16000004
	flat_load_dwordx4 v[18:21], v[4:5] offset:176              // 000000004574: DC5C00B0 12000004
	flat_load_dwordx4 v[14:17], v[4:5] offset:160              // 00000000457C: DC5C00A0 0E000004
	flat_load_dwordx4 v[10:13], v[4:5] offset:144              // 000000004584: DC5C0090 0A000004
	flat_load_dwordx4 v[6:9], v[4:5] offset:128                // 00000000458C: DC5C0080 06000004
	v_mfma_f32_32x32x2bf16 a[0:31], v38, v39, a[0:31] cbsz:1   // 000000004594: D3E80100 04024F26
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000459C: BF8C0070
	v_accvgpr_write_b32 a63, v37                               // 0000000045A0: D3D9003F 00000125
	v_accvgpr_write_b32 a62, v36                               // 0000000045A8: D3D9003E 00000124
	v_accvgpr_write_b32 a61, v35                               // 0000000045B0: D3D9003D 00000123
	v_accvgpr_write_b32 a60, v34                               // 0000000045B8: D3D9003C 00000122
	v_accvgpr_write_b32 a59, v33                               // 0000000045C0: D3D9003B 00000121
	v_accvgpr_write_b32 a58, v32                               // 0000000045C8: D3D9003A 00000120
	v_accvgpr_write_b32 a57, v31                               // 0000000045D0: D3D90039 0000011F
	v_accvgpr_write_b32 a56, v30                               // 0000000045D8: D3D90038 0000011E
	v_accvgpr_write_b32 a55, v29                               // 0000000045E0: D3D90037 0000011D
	v_accvgpr_write_b32 a54, v28                               // 0000000045E8: D3D90036 0000011C
	v_accvgpr_write_b32 a53, v27                               // 0000000045F0: D3D90035 0000011B
	v_accvgpr_write_b32 a52, v26                               // 0000000045F8: D3D90034 0000011A
	v_accvgpr_write_b32 a51, v25                               // 000000004600: D3D90033 00000119
	v_accvgpr_write_b32 a50, v24                               // 000000004608: D3D90032 00000118
	v_accvgpr_write_b32 a49, v23                               // 000000004610: D3D90031 00000117
	v_accvgpr_write_b32 a48, v22                               // 000000004618: D3D90030 00000116
	v_accvgpr_write_b32 a47, v21                               // 000000004620: D3D9002F 00000115
	v_accvgpr_write_b32 a46, v20                               // 000000004628: D3D9002E 00000114
	v_accvgpr_write_b32 a45, v19                               // 000000004630: D3D9002D 00000113
	v_accvgpr_write_b32 a44, v18                               // 000000004638: D3D9002C 00000112
	v_accvgpr_write_b32 a43, v17                               // 000000004640: D3D9002B 00000111
	v_accvgpr_write_b32 a42, v16                               // 000000004648: D3D9002A 00000110
	v_accvgpr_write_b32 a41, v15                               // 000000004650: D3D90029 0000010F
	v_accvgpr_write_b32 a40, v14                               // 000000004658: D3D90028 0000010E
	v_accvgpr_write_b32 a39, v13                               // 000000004660: D3D90027 0000010D
	v_accvgpr_write_b32 a38, v12                               // 000000004668: D3D90026 0000010C
	v_accvgpr_write_b32 a37, v11                               // 000000004670: D3D90025 0000010B
	v_accvgpr_write_b32 a36, v10                               // 000000004678: D3D90024 0000010A
	v_accvgpr_write_b32 a35, v9                                // 000000004680: D3D90023 00000109
	v_accvgpr_write_b32 a34, v8                                // 000000004688: D3D90022 00000108
	v_accvgpr_write_b32 a33, v7                                // 000000004690: D3D90021 00000107
	v_accvgpr_write_b32 a32, v6                                // 000000004698: D3D90020 00000106
	v_accvgpr_read_b32 v9, a27                                 // 0000000046A0: D3D80009 0800011B
	v_accvgpr_read_b32 v8, a26                                 // 0000000046A8: D3D80008 0800011A
	v_accvgpr_read_b32 v7, a25                                 // 0000000046B0: D3D80007 08000119
	v_accvgpr_read_b32 v6, a24                                 // 0000000046B8: D3D80006 08000118
	v_accvgpr_read_b32 v13, a31                                // 0000000046C0: D3D8000D 0800011F
	v_accvgpr_read_b32 v12, a30                                // 0000000046C8: D3D8000C 0800011E
	v_accvgpr_read_b32 v11, a29                                // 0000000046D0: D3D8000B 0800011D
	v_accvgpr_read_b32 v10, a28                                // 0000000046D8: D3D8000A 0800011C
	v_accvgpr_read_b32 v17, a19                                // 0000000046E0: D3D80011 08000113
	v_accvgpr_read_b32 v16, a18                                // 0000000046E8: D3D80010 08000112
	v_accvgpr_read_b32 v15, a17                                // 0000000046F0: D3D8000F 08000111
	v_accvgpr_read_b32 v14, a16                                // 0000000046F8: D3D8000E 08000110
	v_accvgpr_read_b32 v21, a23                                // 000000004700: D3D80015 08000117
	v_accvgpr_read_b32 v20, a22                                // 000000004708: D3D80014 08000116
	v_accvgpr_read_b32 v19, a21                                // 000000004710: D3D80013 08000115
	v_accvgpr_read_b32 v18, a20                                // 000000004718: D3D80012 08000114
	v_accvgpr_read_b32 v25, a11                                // 000000004720: D3D80019 0800010B
	v_accvgpr_read_b32 v24, a10                                // 000000004728: D3D80018 0800010A
	v_accvgpr_read_b32 v23, a9                                 // 000000004730: D3D80017 08000109
	v_accvgpr_read_b32 v22, a8                                 // 000000004738: D3D80016 08000108
	v_accvgpr_read_b32 v29, a15                                // 000000004740: D3D8001D 0800010F
	v_accvgpr_read_b32 v28, a14                                // 000000004748: D3D8001C 0800010E
	v_accvgpr_read_b32 v27, a13                                // 000000004750: D3D8001B 0800010D
	v_accvgpr_read_b32 v26, a12                                // 000000004758: D3D8001A 0800010C
	v_accvgpr_read_b32 v33, a3                                 // 000000004760: D3D80021 08000103
	v_accvgpr_read_b32 v32, a2                                 // 000000004768: D3D80020 08000102
	v_accvgpr_read_b32 v31, a1                                 // 000000004770: D3D8001F 08000101
	v_accvgpr_read_b32 v30, a0                                 // 000000004778: D3D8001E 08000100
	v_accvgpr_read_b32 v37, a7                                 // 000000004780: D3D80025 08000107
	v_accvgpr_read_b32 v36, a6                                 // 000000004788: D3D80024 08000106
	v_accvgpr_read_b32 v35, a5                                 // 000000004790: D3D80023 08000105
	v_accvgpr_read_b32 v34, a4                                 // 000000004798: D3D80022 08000104
	s_nop 0                                                    // 0000000047A0: BF800000
	s_nop 0                                                    // 0000000047A4: BF800000
	flat_store_dwordx4 v[4:5], v[6:9] offset:96                // 0000000047A8: DC7C0060 00000604
	flat_store_dwordx4 v[4:5], v[10:13] offset:112             // 0000000047B0: DC7C0070 00000A04
	flat_store_dwordx4 v[4:5], v[14:17] offset:64              // 0000000047B8: DC7C0040 00000E04
	flat_store_dwordx4 v[4:5], v[18:21] offset:80              // 0000000047C0: DC7C0050 00001204
	flat_store_dwordx4 v[4:5], v[22:25] offset:32              // 0000000047C8: DC7C0020 00001604
	flat_store_dwordx4 v[4:5], v[26:29] offset:48              // 0000000047D0: DC7C0030 00001A04
	flat_store_dwordx4 v[4:5], v[30:33]                        // 0000000047D8: DC7C0000 00001E04
	flat_store_dwordx4 v[4:5], v[34:37] offset:16              // 0000000047E0: DC7C0010 00002204
	flat_load_dword v6, v[0:1]                                 // 0000000047E8: DC500000 06000000
	s_nop 0                                                    // 0000000047F0: BF800000
	s_nop 0                                                    // 0000000047F4: BF800000
	flat_load_dword v7, v[2:3]                                 // 0000000047F8: DC500000 07000002
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004800: BF8C0070
	v_mfma_f32_32x32x2bf16 a[0:31], v6, v7, a[32:63] cbsz:1 abid:1// 000000004804: D3E80900 04820F06
	s_nop 7                                                    // 00000000480C: BF800007
	s_nop 7                                                    // 000000004810: BF800007
	s_nop 1                                                    // 000000004814: BF800001
	v_accvgpr_read_b32 v3, a27                                 // 000000004818: D3D80003 0800011B
	v_accvgpr_read_b32 v2, a26                                 // 000000004820: D3D80002 0800011A
	v_accvgpr_read_b32 v1, a25                                 // 000000004828: D3D80001 08000119
	v_accvgpr_read_b32 v0, a24                                 // 000000004830: D3D80000 08000118
	v_accvgpr_read_b32 v9, a31                                 // 000000004838: D3D80009 0800011F
	v_accvgpr_read_b32 v8, a30                                 // 000000004840: D3D80008 0800011E
	v_accvgpr_read_b32 v7, a29                                 // 000000004848: D3D80007 0800011D
	v_accvgpr_read_b32 v6, a28                                 // 000000004850: D3D80006 0800011C
	v_accvgpr_read_b32 v13, a19                                // 000000004858: D3D8000D 08000113
	v_accvgpr_read_b32 v12, a18                                // 000000004860: D3D8000C 08000112
	v_accvgpr_read_b32 v11, a17                                // 000000004868: D3D8000B 08000111
	v_accvgpr_read_b32 v10, a16                                // 000000004870: D3D8000A 08000110
	v_accvgpr_read_b32 v17, a23                                // 000000004878: D3D80011 08000117
	v_accvgpr_read_b32 v16, a22                                // 000000004880: D3D80010 08000116
	v_accvgpr_read_b32 v15, a21                                // 000000004888: D3D8000F 08000115
	v_accvgpr_read_b32 v14, a20                                // 000000004890: D3D8000E 08000114
	v_accvgpr_read_b32 v21, a11                                // 000000004898: D3D80015 0800010B
	v_accvgpr_read_b32 v20, a10                                // 0000000048A0: D3D80014 0800010A
	v_accvgpr_read_b32 v19, a9                                 // 0000000048A8: D3D80013 08000109
	v_accvgpr_read_b32 v18, a8                                 // 0000000048B0: D3D80012 08000108
	v_accvgpr_read_b32 v25, a15                                // 0000000048B8: D3D80019 0800010F
	v_accvgpr_read_b32 v24, a14                                // 0000000048C0: D3D80018 0800010E
	v_accvgpr_read_b32 v23, a13                                // 0000000048C8: D3D80017 0800010D
	v_accvgpr_read_b32 v22, a12                                // 0000000048D0: D3D80016 0800010C
	v_accvgpr_read_b32 v29, a3                                 // 0000000048D8: D3D8001D 08000103
	v_accvgpr_read_b32 v28, a2                                 // 0000000048E0: D3D8001C 08000102
	v_accvgpr_read_b32 v27, a1                                 // 0000000048E8: D3D8001B 08000101
	v_accvgpr_read_b32 v26, a0                                 // 0000000048F0: D3D8001A 08000100
	v_accvgpr_read_b32 v33, a7                                 // 0000000048F8: D3D80021 08000107
	v_accvgpr_read_b32 v32, a6                                 // 000000004900: D3D80020 08000106
	v_accvgpr_read_b32 v31, a5                                 // 000000004908: D3D8001F 08000105
	v_accvgpr_read_b32 v30, a4                                 // 000000004910: D3D8001E 08000104
	s_nop 0                                                    // 000000004918: BF800000
	s_nop 0                                                    // 00000000491C: BF800000
	flat_store_dwordx4 v[4:5], v[0:3] offset:224               // 000000004920: DC7C00E0 00000004
	flat_store_dwordx4 v[4:5], v[6:9] offset:240               // 000000004928: DC7C00F0 00000604
	flat_store_dwordx4 v[4:5], v[10:13] offset:192             // 000000004930: DC7C00C0 00000A04
	flat_store_dwordx4 v[4:5], v[14:17] offset:208             // 000000004938: DC7C00D0 00000E04
	flat_store_dwordx4 v[4:5], v[18:21] offset:160             // 000000004940: DC7C00A0 00001204
	flat_store_dwordx4 v[4:5], v[22:25] offset:176             // 000000004948: DC7C00B0 00001604
	flat_store_dwordx4 v[4:5], v[26:29] offset:128             // 000000004950: DC7C0080 00001A04
	flat_store_dwordx4 v[4:5], v[30:33] offset:144             // 000000004958: DC7C0090 00001E04
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004960: BF8C0070
	s_setpc_b64 s[30:31]                                       // 000000004964: BE801D1E

_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi32ELi64EEEvRKDv2_tS3_PDv32_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000004968: BF8C0000
	flat_load_dwordx4 v[34:37], v[4:5] offset:112              // 00000000496C: DC5C0070 22000004
	flat_load_dwordx4 v[30:33], v[4:5] offset:96               // 000000004974: DC5C0060 1E000004
	flat_load_dwordx4 v[26:29], v[4:5] offset:80               // 00000000497C: DC5C0050 1A000004
	flat_load_dwordx4 v[22:25], v[4:5] offset:64               // 000000004984: DC5C0040 16000004
	flat_load_dwordx4 v[18:21], v[4:5] offset:48               // 00000000498C: DC5C0030 12000004
	flat_load_dwordx4 v[14:17], v[4:5] offset:32               // 000000004994: DC5C0020 0E000004
	flat_load_dwordx4 v[10:13], v[4:5] offset:16               // 00000000499C: DC5C0010 0A000004
	flat_load_dwordx4 v[6:9], v[4:5]                           // 0000000049A4: DC5C0000 06000004
	flat_load_dword v38, v[0:1]                                // 0000000049AC: DC500000 26000000
	s_nop 0                                                    // 0000000049B4: BF800000
	s_nop 0                                                    // 0000000049B8: BF800000
	flat_load_dword v0, v[2:3]                                 // 0000000049BC: DC500000 00000002
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000049C4: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 0000000049C8: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 0000000049D0: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 0000000049D8: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 0000000049E0: D3D90003 00000109
	v_accvgpr_write_b32 a4, v10                                // 0000000049E8: D3D90004 0000010A
	v_accvgpr_write_b32 a5, v11                                // 0000000049F0: D3D90005 0000010B
	v_accvgpr_write_b32 a6, v12                                // 0000000049F8: D3D90006 0000010C
	v_accvgpr_write_b32 a7, v13                                // 000000004A00: D3D90007 0000010D
	v_accvgpr_write_b32 a8, v14                                // 000000004A08: D3D90008 0000010E
	v_accvgpr_write_b32 a9, v15                                // 000000004A10: D3D90009 0000010F
	v_accvgpr_write_b32 a10, v16                               // 000000004A18: D3D9000A 00000110
	v_accvgpr_write_b32 a11, v17                               // 000000004A20: D3D9000B 00000111
	v_accvgpr_write_b32 a12, v18                               // 000000004A28: D3D9000C 00000112
	v_accvgpr_write_b32 a13, v19                               // 000000004A30: D3D9000D 00000113
	v_accvgpr_write_b32 a14, v20                               // 000000004A38: D3D9000E 00000114
	v_accvgpr_write_b32 a15, v21                               // 000000004A40: D3D9000F 00000115
	v_accvgpr_write_b32 a16, v22                               // 000000004A48: D3D90010 00000116
	v_accvgpr_write_b32 a17, v23                               // 000000004A50: D3D90011 00000117
	v_accvgpr_write_b32 a18, v24                               // 000000004A58: D3D90012 00000118
	v_accvgpr_write_b32 a19, v25                               // 000000004A60: D3D90013 00000119
	v_accvgpr_write_b32 a20, v26                               // 000000004A68: D3D90014 0000011A
	v_accvgpr_write_b32 a21, v27                               // 000000004A70: D3D90015 0000011B
	v_accvgpr_write_b32 a22, v28                               // 000000004A78: D3D90016 0000011C
	v_accvgpr_write_b32 a23, v29                               // 000000004A80: D3D90017 0000011D
	v_accvgpr_write_b32 a24, v30                               // 000000004A88: D3D90018 0000011E
	v_accvgpr_write_b32 a25, v31                               // 000000004A90: D3D90019 0000011F
	v_accvgpr_write_b32 a26, v32                               // 000000004A98: D3D9001A 00000120
	v_accvgpr_write_b32 a27, v33                               // 000000004AA0: D3D9001B 00000121
	v_accvgpr_write_b32 a28, v34                               // 000000004AA8: D3D9001C 00000122
	v_accvgpr_write_b32 a29, v35                               // 000000004AB0: D3D9001D 00000123
	v_accvgpr_write_b32 a30, v36                               // 000000004AB8: D3D9001E 00000124
	v_accvgpr_write_b32 a31, v37                               // 000000004AC0: D3D9001F 00000125
	s_nop 0                                                    // 000000004AC8: BF800000
	v_mfma_f32_32x32x2bf16 a[0:31], v38, v0, a[0:31] cbsz:1    // 000000004ACC: D3E80100 04020126
	s_nop 7                                                    // 000000004AD4: BF800007
	s_nop 7                                                    // 000000004AD8: BF800007
	s_nop 1                                                    // 000000004ADC: BF800001
	v_accvgpr_read_b32 v3, a27                                 // 000000004AE0: D3D80003 0800011B
	v_accvgpr_read_b32 v2, a26                                 // 000000004AE8: D3D80002 0800011A
	v_accvgpr_read_b32 v1, a25                                 // 000000004AF0: D3D80001 08000119
	v_accvgpr_read_b32 v0, a24                                 // 000000004AF8: D3D80000 08000118
	v_accvgpr_read_b32 v9, a31                                 // 000000004B00: D3D80009 0800011F
	v_accvgpr_read_b32 v8, a30                                 // 000000004B08: D3D80008 0800011E
	v_accvgpr_read_b32 v7, a29                                 // 000000004B10: D3D80007 0800011D
	v_accvgpr_read_b32 v6, a28                                 // 000000004B18: D3D80006 0800011C
	v_accvgpr_read_b32 v13, a19                                // 000000004B20: D3D8000D 08000113
	v_accvgpr_read_b32 v12, a18                                // 000000004B28: D3D8000C 08000112
	v_accvgpr_read_b32 v11, a17                                // 000000004B30: D3D8000B 08000111
	v_accvgpr_read_b32 v10, a16                                // 000000004B38: D3D8000A 08000110
	v_accvgpr_read_b32 v17, a23                                // 000000004B40: D3D80011 08000117
	v_accvgpr_read_b32 v16, a22                                // 000000004B48: D3D80010 08000116
	v_accvgpr_read_b32 v15, a21                                // 000000004B50: D3D8000F 08000115
	v_accvgpr_read_b32 v14, a20                                // 000000004B58: D3D8000E 08000114
	v_accvgpr_read_b32 v21, a11                                // 000000004B60: D3D80015 0800010B
	v_accvgpr_read_b32 v20, a10                                // 000000004B68: D3D80014 0800010A
	v_accvgpr_read_b32 v19, a9                                 // 000000004B70: D3D80013 08000109
	v_accvgpr_read_b32 v18, a8                                 // 000000004B78: D3D80012 08000108
	v_accvgpr_read_b32 v25, a15                                // 000000004B80: D3D80019 0800010F
	v_accvgpr_read_b32 v24, a14                                // 000000004B88: D3D80018 0800010E
	v_accvgpr_read_b32 v23, a13                                // 000000004B90: D3D80017 0800010D
	v_accvgpr_read_b32 v22, a12                                // 000000004B98: D3D80016 0800010C
	v_accvgpr_read_b32 v29, a3                                 // 000000004BA0: D3D8001D 08000103
	v_accvgpr_read_b32 v28, a2                                 // 000000004BA8: D3D8001C 08000102
	v_accvgpr_read_b32 v27, a1                                 // 000000004BB0: D3D8001B 08000101
	v_accvgpr_read_b32 v26, a0                                 // 000000004BB8: D3D8001A 08000100
	v_accvgpr_read_b32 v33, a7                                 // 000000004BC0: D3D80021 08000107
	v_accvgpr_read_b32 v32, a6                                 // 000000004BC8: D3D80020 08000106
	v_accvgpr_read_b32 v31, a5                                 // 000000004BD0: D3D8001F 08000105
	v_accvgpr_read_b32 v30, a4                                 // 000000004BD8: D3D8001E 08000104
	s_nop 0                                                    // 000000004BE0: BF800000
	s_nop 0                                                    // 000000004BE4: BF800000
	flat_store_dwordx4 v[4:5], v[0:3] offset:96                // 000000004BE8: DC7C0060 00000004
	flat_store_dwordx4 v[4:5], v[6:9] offset:112               // 000000004BF0: DC7C0070 00000604
	flat_store_dwordx4 v[4:5], v[10:13] offset:64              // 000000004BF8: DC7C0040 00000A04
	flat_store_dwordx4 v[4:5], v[14:17] offset:80              // 000000004C00: DC7C0050 00000E04
	flat_store_dwordx4 v[4:5], v[18:21] offset:32              // 000000004C08: DC7C0020 00001204
	flat_store_dwordx4 v[4:5], v[22:25] offset:48              // 000000004C10: DC7C0030 00001604
	flat_store_dwordx4 v[4:5], v[26:29]                        // 000000004C18: DC7C0000 00001A04
	flat_store_dwordx4 v[4:5], v[30:33] offset:16              // 000000004C20: DC7C0010 00001E04
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004C28: BF8C0070
	s_setpc_b64 s[30:31]                                       // 000000004C2C: BE801D1E

_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi64ELi32EEEvRKDv2_tS3_PDv32_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000004C30: BF8C0000
	flat_load_dwordx4 v[34:37], v[4:5] offset:112              // 000000004C34: DC5C0070 22000004
	flat_load_dwordx4 v[30:33], v[4:5] offset:96               // 000000004C3C: DC5C0060 1E000004
	flat_load_dwordx4 v[26:29], v[4:5] offset:80               // 000000004C44: DC5C0050 1A000004
	flat_load_dwordx4 v[22:25], v[4:5] offset:64               // 000000004C4C: DC5C0040 16000004
	flat_load_dwordx4 v[18:21], v[4:5] offset:48               // 000000004C54: DC5C0030 12000004
	flat_load_dwordx4 v[14:17], v[4:5] offset:32               // 000000004C5C: DC5C0020 0E000004
	flat_load_dwordx4 v[10:13], v[4:5] offset:16               // 000000004C64: DC5C0010 0A000004
	flat_load_dwordx4 v[6:9], v[4:5]                           // 000000004C6C: DC5C0000 06000004
	flat_load_dword v38, v[0:1]                                // 000000004C74: DC500000 26000000
	s_nop 0                                                    // 000000004C7C: BF800000
	s_nop 0                                                    // 000000004C80: BF800000
	flat_load_dword v0, v[2:3]                                 // 000000004C84: DC500000 00000002
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004C8C: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 000000004C90: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 000000004C98: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 000000004CA0: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 000000004CA8: D3D90003 00000109
	v_accvgpr_write_b32 a4, v10                                // 000000004CB0: D3D90004 0000010A
	v_accvgpr_write_b32 a5, v11                                // 000000004CB8: D3D90005 0000010B
	v_accvgpr_write_b32 a6, v12                                // 000000004CC0: D3D90006 0000010C
	v_accvgpr_write_b32 a7, v13                                // 000000004CC8: D3D90007 0000010D
	v_accvgpr_write_b32 a8, v14                                // 000000004CD0: D3D90008 0000010E
	v_accvgpr_write_b32 a9, v15                                // 000000004CD8: D3D90009 0000010F
	v_accvgpr_write_b32 a10, v16                               // 000000004CE0: D3D9000A 00000110
	v_accvgpr_write_b32 a11, v17                               // 000000004CE8: D3D9000B 00000111
	v_accvgpr_write_b32 a12, v18                               // 000000004CF0: D3D9000C 00000112
	v_accvgpr_write_b32 a13, v19                               // 000000004CF8: D3D9000D 00000113
	v_accvgpr_write_b32 a14, v20                               // 000000004D00: D3D9000E 00000114
	v_accvgpr_write_b32 a15, v21                               // 000000004D08: D3D9000F 00000115
	v_accvgpr_write_b32 a16, v22                               // 000000004D10: D3D90010 00000116
	v_accvgpr_write_b32 a17, v23                               // 000000004D18: D3D90011 00000117
	v_accvgpr_write_b32 a18, v24                               // 000000004D20: D3D90012 00000118
	v_accvgpr_write_b32 a19, v25                               // 000000004D28: D3D90013 00000119
	v_accvgpr_write_b32 a20, v26                               // 000000004D30: D3D90014 0000011A
	v_accvgpr_write_b32 a21, v27                               // 000000004D38: D3D90015 0000011B
	v_accvgpr_write_b32 a22, v28                               // 000000004D40: D3D90016 0000011C
	v_accvgpr_write_b32 a23, v29                               // 000000004D48: D3D90017 0000011D
	v_accvgpr_write_b32 a24, v30                               // 000000004D50: D3D90018 0000011E
	v_accvgpr_write_b32 a25, v31                               // 000000004D58: D3D90019 0000011F
	v_accvgpr_write_b32 a26, v32                               // 000000004D60: D3D9001A 00000120
	v_accvgpr_write_b32 a27, v33                               // 000000004D68: D3D9001B 00000121
	v_accvgpr_write_b32 a28, v34                               // 000000004D70: D3D9001C 00000122
	v_accvgpr_write_b32 a29, v35                               // 000000004D78: D3D9001D 00000123
	v_accvgpr_write_b32 a30, v36                               // 000000004D80: D3D9001E 00000124
	v_accvgpr_write_b32 a31, v37                               // 000000004D88: D3D9001F 00000125
	s_nop 0                                                    // 000000004D90: BF800000
	v_mfma_f32_32x32x2bf16 a[0:31], v38, v0, a[0:31] blgp:1    // 000000004D94: D3E80000 24020126
	s_nop 7                                                    // 000000004D9C: BF800007
	s_nop 7                                                    // 000000004DA0: BF800007
	s_nop 1                                                    // 000000004DA4: BF800001
	v_accvgpr_read_b32 v3, a27                                 // 000000004DA8: D3D80003 0800011B
	v_accvgpr_read_b32 v2, a26                                 // 000000004DB0: D3D80002 0800011A
	v_accvgpr_read_b32 v1, a25                                 // 000000004DB8: D3D80001 08000119
	v_accvgpr_read_b32 v0, a24                                 // 000000004DC0: D3D80000 08000118
	v_accvgpr_read_b32 v9, a31                                 // 000000004DC8: D3D80009 0800011F
	v_accvgpr_read_b32 v8, a30                                 // 000000004DD0: D3D80008 0800011E
	v_accvgpr_read_b32 v7, a29                                 // 000000004DD8: D3D80007 0800011D
	v_accvgpr_read_b32 v6, a28                                 // 000000004DE0: D3D80006 0800011C
	v_accvgpr_read_b32 v13, a19                                // 000000004DE8: D3D8000D 08000113
	v_accvgpr_read_b32 v12, a18                                // 000000004DF0: D3D8000C 08000112
	v_accvgpr_read_b32 v11, a17                                // 000000004DF8: D3D8000B 08000111
	v_accvgpr_read_b32 v10, a16                                // 000000004E00: D3D8000A 08000110
	v_accvgpr_read_b32 v17, a23                                // 000000004E08: D3D80011 08000117
	v_accvgpr_read_b32 v16, a22                                // 000000004E10: D3D80010 08000116
	v_accvgpr_read_b32 v15, a21                                // 000000004E18: D3D8000F 08000115
	v_accvgpr_read_b32 v14, a20                                // 000000004E20: D3D8000E 08000114
	v_accvgpr_read_b32 v21, a11                                // 000000004E28: D3D80015 0800010B
	v_accvgpr_read_b32 v20, a10                                // 000000004E30: D3D80014 0800010A
	v_accvgpr_read_b32 v19, a9                                 // 000000004E38: D3D80013 08000109
	v_accvgpr_read_b32 v18, a8                                 // 000000004E40: D3D80012 08000108
	v_accvgpr_read_b32 v25, a15                                // 000000004E48: D3D80019 0800010F
	v_accvgpr_read_b32 v24, a14                                // 000000004E50: D3D80018 0800010E
	v_accvgpr_read_b32 v23, a13                                // 000000004E58: D3D80017 0800010D
	v_accvgpr_read_b32 v22, a12                                // 000000004E60: D3D80016 0800010C
	v_accvgpr_read_b32 v29, a3                                 // 000000004E68: D3D8001D 08000103
	v_accvgpr_read_b32 v28, a2                                 // 000000004E70: D3D8001C 08000102
	v_accvgpr_read_b32 v27, a1                                 // 000000004E78: D3D8001B 08000101
	v_accvgpr_read_b32 v26, a0                                 // 000000004E80: D3D8001A 08000100
	v_accvgpr_read_b32 v33, a7                                 // 000000004E88: D3D80021 08000107
	v_accvgpr_read_b32 v32, a6                                 // 000000004E90: D3D80020 08000106
	v_accvgpr_read_b32 v31, a5                                 // 000000004E98: D3D8001F 08000105
	v_accvgpr_read_b32 v30, a4                                 // 000000004EA0: D3D8001E 08000104
	s_nop 0                                                    // 000000004EA8: BF800000
	s_nop 0                                                    // 000000004EAC: BF800000
	flat_store_dwordx4 v[4:5], v[0:3] offset:96                // 000000004EB0: DC7C0060 00000004
	flat_store_dwordx4 v[4:5], v[6:9] offset:112               // 000000004EB8: DC7C0070 00000604
	flat_store_dwordx4 v[4:5], v[10:13] offset:64              // 000000004EC0: DC7C0040 00000A04
	flat_store_dwordx4 v[4:5], v[14:17] offset:80              // 000000004EC8: DC7C0050 00000E04
	flat_store_dwordx4 v[4:5], v[18:21] offset:32              // 000000004ED0: DC7C0020 00001204
	flat_store_dwordx4 v[4:5], v[22:25] offset:48              // 000000004ED8: DC7C0030 00001604
	flat_store_dwordx4 v[4:5], v[26:29]                        // 000000004EE0: DC7C0000 00001A04
	flat_store_dwordx4 v[4:5], v[30:33] offset:16              // 000000004EE8: DC7C0010 00001E04
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004EF0: BF8C0070
	s_setpc_b64 s[30:31]                                       // 000000004EF4: BE801D1E

_ZN2ck27gcnasm_mfma_f32_32x32x4bf16ERKDv2_tS2_PDv16_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000004EF8: BF8C0000
	flat_load_dwordx4 v[18:21], v[4:5] offset:48               // 000000004EFC: DC5C0030 12000004
	flat_load_dwordx4 v[14:17], v[4:5] offset:32               // 000000004F04: DC5C0020 0E000004
	flat_load_dwordx4 v[10:13], v[4:5] offset:16               // 000000004F0C: DC5C0010 0A000004
	flat_load_dwordx4 v[6:9], v[4:5]                           // 000000004F14: DC5C0000 06000004
	flat_load_dword v22, v[0:1]                                // 000000004F1C: DC500000 16000000
	s_nop 0                                                    // 000000004F24: BF800000
	s_nop 0                                                    // 000000004F28: BF800000
	flat_load_dword v0, v[2:3]                                 // 000000004F2C: DC500000 00000002
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004F34: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 000000004F38: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 000000004F40: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 000000004F48: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 000000004F50: D3D90003 00000109
	v_accvgpr_write_b32 a4, v10                                // 000000004F58: D3D90004 0000010A
	v_accvgpr_write_b32 a5, v11                                // 000000004F60: D3D90005 0000010B
	v_accvgpr_write_b32 a6, v12                                // 000000004F68: D3D90006 0000010C
	v_accvgpr_write_b32 a7, v13                                // 000000004F70: D3D90007 0000010D
	v_accvgpr_write_b32 a8, v14                                // 000000004F78: D3D90008 0000010E
	v_accvgpr_write_b32 a9, v15                                // 000000004F80: D3D90009 0000010F
	v_accvgpr_write_b32 a10, v16                               // 000000004F88: D3D9000A 00000110
	v_accvgpr_write_b32 a11, v17                               // 000000004F90: D3D9000B 00000111
	v_accvgpr_write_b32 a12, v18                               // 000000004F98: D3D9000C 00000112
	v_accvgpr_write_b32 a13, v19                               // 000000004FA0: D3D9000D 00000113
	v_accvgpr_write_b32 a14, v20                               // 000000004FA8: D3D9000E 00000114
	v_accvgpr_write_b32 a15, v21                               // 000000004FB0: D3D9000F 00000115
	s_nop 0                                                    // 000000004FB8: BF800000
	v_mfma_f32_32x32x4bf16 a[0:15], v22, v0, a[0:15]           // 000000004FBC: D3EC0000 04020116
	s_nop 7                                                    // 000000004FC4: BF800007
	s_nop 7                                                    // 000000004FC8: BF800007
	s_nop 1                                                    // 000000004FCC: BF800001
	v_accvgpr_read_b32 v3, a11                                 // 000000004FD0: D3D80003 0800010B
	v_accvgpr_read_b32 v2, a10                                 // 000000004FD8: D3D80002 0800010A
	v_accvgpr_read_b32 v1, a9                                  // 000000004FE0: D3D80001 08000109
	v_accvgpr_read_b32 v0, a8                                  // 000000004FE8: D3D80000 08000108
	v_accvgpr_read_b32 v9, a15                                 // 000000004FF0: D3D80009 0800010F
	v_accvgpr_read_b32 v8, a14                                 // 000000004FF8: D3D80008 0800010E
	v_accvgpr_read_b32 v7, a13                                 // 000000005000: D3D80007 0800010D
	v_accvgpr_read_b32 v6, a12                                 // 000000005008: D3D80006 0800010C
	v_accvgpr_read_b32 v13, a3                                 // 000000005010: D3D8000D 08000103
	v_accvgpr_read_b32 v12, a2                                 // 000000005018: D3D8000C 08000102
	v_accvgpr_read_b32 v11, a1                                 // 000000005020: D3D8000B 08000101
	v_accvgpr_read_b32 v10, a0                                 // 000000005028: D3D8000A 08000100
	v_accvgpr_read_b32 v17, a7                                 // 000000005030: D3D80011 08000107
	v_accvgpr_read_b32 v16, a6                                 // 000000005038: D3D80010 08000106
	v_accvgpr_read_b32 v15, a5                                 // 000000005040: D3D8000F 08000105
	v_accvgpr_read_b32 v14, a4                                 // 000000005048: D3D8000E 08000104
	s_nop 0                                                    // 000000005050: BF800000
	s_nop 0                                                    // 000000005054: BF800000
	flat_store_dwordx4 v[4:5], v[0:3] offset:32                // 000000005058: DC7C0020 00000004
	flat_store_dwordx4 v[4:5], v[6:9] offset:48                // 000000005060: DC7C0030 00000604
	flat_store_dwordx4 v[4:5], v[10:13]                        // 000000005068: DC7C0000 00000A04
	flat_store_dwordx4 v[4:5], v[14:17] offset:16              // 000000005070: DC7C0010 00000E04
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005078: BF8C0070
	s_setpc_b64 s[30:31]                                       // 00000000507C: BE801D1E

_ZN2ck27gcnasm_mfma_f32_16x16x8bf16ERKDv2_tS2_PDv4_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000005080: BF8C0000
	flat_load_dword v10, v[0:1]                                // 000000005084: DC500000 0A000000
	flat_load_dword v11, v[2:3]                                // 00000000508C: DC500000 0B000002
	flat_load_dwordx4 v[6:9], v[4:5]                           // 000000005094: DC5C0000 06000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000509C: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 0000000050A0: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 0000000050A8: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 0000000050B0: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 0000000050B8: D3D90003 00000109
	s_nop 0                                                    // 0000000050C0: BF800000
	v_mfma_f32_16x16x8bf16 a[0:3], v10, v11, a[0:3]            // 0000000050C4: D3ED0000 0402170A
	s_nop 7                                                    // 0000000050CC: BF800007
	s_nop 1                                                    // 0000000050D0: BF800001
	v_accvgpr_read_b32 v0, a0                                  // 0000000050D4: D3D80000 08000100
	v_accvgpr_read_b32 v1, a1                                  // 0000000050DC: D3D80001 08000101
	v_accvgpr_read_b32 v2, a2                                  // 0000000050E4: D3D80002 08000102
	v_accvgpr_read_b32 v3, a3                                  // 0000000050EC: D3D80003 08000103
	s_nop 1                                                    // 0000000050F4: BF800001
	flat_store_dwordx4 v[4:5], v[0:3]                          // 0000000050F8: DC7C0000 00000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005100: BF8C0070
	s_setpc_b64 s[30:31]                                       // 000000005104: BE801D1E
_ZN2ck27gcnasm_mfma_f32_16x16x2bf16ILi16ELi64EEEvRKDv2_tS3_PDv16_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000005108: BF8C0000
	flat_load_dwordx4 v[18:21], v[4:5] offset:48               // 00000000510C: DC5C0030 12000004
	flat_load_dwordx4 v[14:17], v[4:5] offset:32               // 000000005114: DC5C0020 0E000004
	flat_load_dwordx4 v[10:13], v[4:5] offset:16               // 00000000511C: DC5C0010 0A000004
	flat_load_dwordx4 v[6:9], v[4:5]                           // 000000005124: DC5C0000 06000004
	flat_load_dword v22, v[0:1]                                // 00000000512C: DC500000 16000000
	s_nop 0                                                    // 000000005134: BF800000
	s_nop 0                                                    // 000000005138: BF800000
	flat_load_dword v0, v[2:3]                                 // 00000000513C: DC500000 00000002
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005144: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 000000005148: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 000000005150: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 000000005158: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 000000005160: D3D90003 00000109
	v_accvgpr_write_b32 a4, v10                                // 000000005168: D3D90004 0000010A
	v_accvgpr_write_b32 a5, v11                                // 000000005170: D3D90005 0000010B
	v_accvgpr_write_b32 a6, v12                                // 000000005178: D3D90006 0000010C
	v_accvgpr_write_b32 a7, v13                                // 000000005180: D3D90007 0000010D
	v_accvgpr_write_b32 a8, v14                                // 000000005188: D3D90008 0000010E
	v_accvgpr_write_b32 a9, v15                                // 000000005190: D3D90009 0000010F
	v_accvgpr_write_b32 a10, v16                               // 000000005198: D3D9000A 00000110
	v_accvgpr_write_b32 a11, v17                               // 0000000051A0: D3D9000B 00000111
	v_accvgpr_write_b32 a12, v18                               // 0000000051A8: D3D9000C 00000112
	v_accvgpr_write_b32 a13, v19                               // 0000000051B0: D3D9000D 00000113
	v_accvgpr_write_b32 a14, v20                               // 0000000051B8: D3D9000E 00000114
	v_accvgpr_write_b32 a15, v21                               // 0000000051C0: D3D9000F 00000115
	s_nop 0                                                    // 0000000051C8: BF800000
	v_mfma_f32_16x16x2bf16 a[0:15], v22, v0, a[0:15] cbsz:2    // 0000000051CC: D3E90200 04020116
	s_nop 7                                                    // 0000000051D4: BF800007
	s_nop 1                                                    // 0000000051D8: BF800001
	v_accvgpr_read_b32 v3, a11                                 // 0000000051DC: D3D80003 0800010B
	v_accvgpr_read_b32 v2, a10                                 // 0000000051E4: D3D80002 0800010A
	v_accvgpr_read_b32 v1, a9                                  // 0000000051EC: D3D80001 08000109
	v_accvgpr_read_b32 v0, a8                                  // 0000000051F4: D3D80000 08000108
	v_accvgpr_read_b32 v9, a15                                 // 0000000051FC: D3D80009 0800010F
	v_accvgpr_read_b32 v8, a14                                 // 000000005204: D3D80008 0800010E
	v_accvgpr_read_b32 v7, a13                                 // 00000000520C: D3D80007 0800010D
	v_accvgpr_read_b32 v6, a12                                 // 000000005214: D3D80006 0800010C
	v_accvgpr_read_b32 v13, a3                                 // 00000000521C: D3D8000D 08000103
	v_accvgpr_read_b32 v12, a2                                 // 000000005224: D3D8000C 08000102
	v_accvgpr_read_b32 v11, a1                                 // 00000000522C: D3D8000B 08000101
	v_accvgpr_read_b32 v10, a0                                 // 000000005234: D3D8000A 08000100
	v_accvgpr_read_b32 v17, a7                                 // 00000000523C: D3D80011 08000107
	v_accvgpr_read_b32 v16, a6                                 // 000000005244: D3D80010 08000106
	v_accvgpr_read_b32 v15, a5                                 // 00000000524C: D3D8000F 08000105
	v_accvgpr_read_b32 v14, a4                                 // 000000005254: D3D8000E 08000104
	s_nop 0                                                    // 00000000525C: BF800000
	s_nop 0                                                    // 000000005260: BF800000
	flat_store_dwordx4 v[4:5], v[0:3] offset:32                // 000000005264: DC7C0020 00000004
	flat_store_dwordx4 v[4:5], v[6:9] offset:48                // 00000000526C: DC7C0030 00000604
	flat_store_dwordx4 v[4:5], v[10:13]                        // 000000005274: DC7C0000 00000A04
	flat_store_dwordx4 v[4:5], v[14:17] offset:16              // 00000000527C: DC7C0010 00000E04
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005284: BF8C0070
	s_setpc_b64 s[30:31]                                       // 000000005288: BE801D1E

_ZN2ck27gcnasm_mfma_f32_16x16x2bf16ILi64ELi16EEEvRKDv2_tS3_PDv16_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 00000000528C: BF8C0000
	flat_load_dwordx4 v[18:21], v[4:5] offset:48               // 000000005290: DC5C0030 12000004
	flat_load_dwordx4 v[14:17], v[4:5] offset:32               // 000000005298: DC5C0020 0E000004
	flat_load_dwordx4 v[10:13], v[4:5] offset:16               // 0000000052A0: DC5C0010 0A000004
	flat_load_dwordx4 v[6:9], v[4:5]                           // 0000000052A8: DC5C0000 06000004
	flat_load_dword v22, v[0:1]                                // 0000000052B0: DC500000 16000000
	s_nop 0                                                    // 0000000052B8: BF800000
	s_nop 0                                                    // 0000000052BC: BF800000
	flat_load_dword v0, v[2:3]                                 // 0000000052C0: DC500000 00000002
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000052C8: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 0000000052CC: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 0000000052D4: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 0000000052DC: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 0000000052E4: D3D90003 00000109
	v_accvgpr_write_b32 a4, v10                                // 0000000052EC: D3D90004 0000010A
	v_accvgpr_write_b32 a5, v11                                // 0000000052F4: D3D90005 0000010B
	v_accvgpr_write_b32 a6, v12                                // 0000000052FC: D3D90006 0000010C
	v_accvgpr_write_b32 a7, v13                                // 000000005304: D3D90007 0000010D
	v_accvgpr_write_b32 a8, v14                                // 00000000530C: D3D90008 0000010E
	v_accvgpr_write_b32 a9, v15                                // 000000005314: D3D90009 0000010F
	v_accvgpr_write_b32 a10, v16                               // 00000000531C: D3D9000A 00000110
	v_accvgpr_write_b32 a11, v17                               // 000000005324: D3D9000B 00000111
	v_accvgpr_write_b32 a12, v18                               // 00000000532C: D3D9000C 00000112
	v_accvgpr_write_b32 a13, v19                               // 000000005334: D3D9000D 00000113
	v_accvgpr_write_b32 a14, v20                               // 00000000533C: D3D9000E 00000114
	v_accvgpr_write_b32 a15, v21                               // 000000005344: D3D9000F 00000115
	s_nop 0                                                    // 00000000534C: BF800000
	v_mfma_f32_16x16x2bf16 a[0:15], v22, v0, a[0:15] blgp:4    // 000000005350: D3E90000 84020116
	s_nop 7                                                    // 000000005358: BF800007
	s_nop 1                                                    // 00000000535C: BF800001
	v_accvgpr_read_b32 v3, a11                                 // 000000005360: D3D80003 0800010B
	v_accvgpr_read_b32 v2, a10                                 // 000000005368: D3D80002 0800010A
	v_accvgpr_read_b32 v1, a9                                  // 000000005370: D3D80001 08000109
	v_accvgpr_read_b32 v0, a8                                  // 000000005378: D3D80000 08000108
	v_accvgpr_read_b32 v9, a15                                 // 000000005380: D3D80009 0800010F
	v_accvgpr_read_b32 v8, a14                                 // 000000005388: D3D80008 0800010E
	v_accvgpr_read_b32 v7, a13                                 // 000000005390: D3D80007 0800010D
	v_accvgpr_read_b32 v6, a12                                 // 000000005398: D3D80006 0800010C
	v_accvgpr_read_b32 v13, a3                                 // 0000000053A0: D3D8000D 08000103
	v_accvgpr_read_b32 v12, a2                                 // 0000000053A8: D3D8000C 08000102
	v_accvgpr_read_b32 v11, a1                                 // 0000000053B0: D3D8000B 08000101
	v_accvgpr_read_b32 v10, a0                                 // 0000000053B8: D3D8000A 08000100
	v_accvgpr_read_b32 v17, a7                                 // 0000000053C0: D3D80011 08000107
	v_accvgpr_read_b32 v16, a6                                 // 0000000053C8: D3D80010 08000106
	v_accvgpr_read_b32 v15, a5                                 // 0000000053D0: D3D8000F 08000105
	v_accvgpr_read_b32 v14, a4                                 // 0000000053D8: D3D8000E 08000104
	s_nop 0                                                    // 0000000053E0: BF800000
	s_nop 0                                                    // 0000000053E4: BF800000
	flat_store_dwordx4 v[4:5], v[0:3] offset:32                // 0000000053E8: DC7C0020 00000004
	flat_store_dwordx4 v[4:5], v[6:9] offset:48                // 0000000053F0: DC7C0030 00000604
	flat_store_dwordx4 v[4:5], v[10:13]                        // 0000000053F8: DC7C0000 00000A04
	flat_store_dwordx4 v[4:5], v[14:17] offset:16              // 000000005400: DC7C0010 00000E04
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005408: BF8C0070
	s_setpc_b64 s[30:31]                                       // 00000000540C: BE801D1E

_ZN2ck25gcnasm_mfma_f32_4x4x2bf16ILi4ELi64EEEvRKDv2_tS3_PDv4_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000005410: BF8C0000
	flat_load_dword v10, v[0:1]                                // 000000005414: DC500000 0A000000
	flat_load_dword v11, v[2:3]                                // 00000000541C: DC500000 0B000002
	flat_load_dwordx4 v[6:9], v[4:5]                           // 000000005424: DC5C0000 06000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000542C: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 000000005430: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 000000005438: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 000000005440: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 000000005448: D3D90003 00000109
	s_nop 0                                                    // 000000005450: BF800000
	v_mfma_f32_4x4x2bf16 a[0:3], v10, v11, a[0:3] cbsz:4       // 000000005454: D3EB0400 0402170A
	s_nop 3                                                    // 00000000545C: BF800003
	v_accvgpr_read_b32 v0, a0                                  // 000000005460: D3D80000 08000100
	v_accvgpr_read_b32 v1, a1                                  // 000000005468: D3D80001 08000101
	v_accvgpr_read_b32 v2, a2                                  // 000000005470: D3D80002 08000102
	v_accvgpr_read_b32 v3, a3                                  // 000000005478: D3D80003 08000103
	s_nop 1                                                    // 000000005480: BF800001
	flat_store_dwordx4 v[4:5], v[0:3]                          // 000000005484: DC7C0000 00000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000548C: BF8C0070
	s_setpc_b64 s[30:31]                                       // 000000005490: BE801D1E

_ZN2ck25gcnasm_mfma_f32_4x4x2bf16ILi8ELi64EEEvRKDv2_tS3_PDv4_f:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000005494: BF8C0000
	flat_load_dword v14, v[0:1]                                // 000000005498: DC500000 0E000000
	flat_load_dword v15, v[2:3]                                // 0000000054A0: DC500000 0F000002
	flat_load_dwordx4 v[6:9], v[4:5]                           // 0000000054A8: DC5C0000 06000004
	flat_load_dwordx4 v[10:13], v[4:5] offset:16               // 0000000054B0: DC5C0010 0A000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000054B8: BF8C0070
	v_accvgpr_write_b32 a0, v6                                 // 0000000054BC: D3D90000 00000106
	v_accvgpr_write_b32 a1, v7                                 // 0000000054C4: D3D90001 00000107
	v_accvgpr_write_b32 a2, v8                                 // 0000000054CC: D3D90002 00000108
	v_accvgpr_write_b32 a3, v9                                 // 0000000054D4: D3D90003 00000109
	s_nop 0                                                    // 0000000054DC: BF800000
	v_mfma_f32_4x4x2bf16 a[0:3], v14, v15, a[0:3] cbsz:4       // 0000000054E0: D3EB0400 04021F0E
	s_nop 3                                                    // 0000000054E8: BF800003
	v_accvgpr_read_b32 v9, a3                                  // 0000000054EC: D3D80009 08000103
	v_accvgpr_read_b32 v8, a2                                  // 0000000054F4: D3D80008 08000102
	v_accvgpr_read_b32 v7, a1                                  // 0000000054FC: D3D80007 08000101
	v_accvgpr_read_b32 v6, a0                                  // 000000005504: D3D80006 08000100
	v_accvgpr_write_b32 a0, v10                                // 00000000550C: D3D90000 0000010A
	v_accvgpr_write_b32 a1, v11                                // 000000005514: D3D90001 0000010B
	v_accvgpr_write_b32 a2, v12                                // 00000000551C: D3D90002 0000010C
	v_accvgpr_write_b32 a3, v13                                // 000000005524: D3D90003 0000010D
	s_nop 0                                                    // 00000000552C: BF800000
	s_nop 0                                                    // 000000005530: BF800000
	flat_store_dwordx4 v[4:5], v[6:9]                          // 000000005534: DC7C0000 00000604
	flat_load_dword v6, v[0:1]                                 // 00000000553C: DC500000 06000000
	s_nop 0                                                    // 000000005544: BF800000
	s_nop 0                                                    // 000000005548: BF800000
	flat_load_dword v7, v[2:3]                                 // 00000000554C: DC500000 07000002
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005554: BF8C0070
	v_mfma_f32_4x4x2bf16 a[0:3], v6, v7, a[0:3] cbsz:4 abid:1  // 000000005558: D3EB0C00 04020F06
	s_nop 3                                                    // 000000005560: BF800003
	v_accvgpr_read_b32 v0, a0                                  // 000000005564: D3D80000 08000100
	v_accvgpr_read_b32 v1, a1                                  // 00000000556C: D3D80001 08000101
	v_accvgpr_read_b32 v2, a2                                  // 000000005574: D3D80002 08000102
	v_accvgpr_read_b32 v3, a3                                  // 00000000557C: D3D80003 08000103
	s_nop 1                                                    // 000000005584: BF800001
	flat_store_dwordx4 v[4:5], v[0:3] offset:16                // 000000005588: DC7C0010 00000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005590: BF8C0070
	s_setpc_b64 s[30:31]                                       // 000000005594: BE801D1E
	s_nop 0                                                    // 000000005598: BF800000
	s_nop 0                                                    // 00000000559C: BF800000
	s_nop 0                                                    // 0000000055A0: BF800000
	s_nop 0                                                    // 0000000055A4: BF800000
	s_nop 0                                                    // 0000000055A8: BF800000
	s_nop 0                                                    // 0000000055AC: BF800000
	s_nop 0                                                    // 0000000055B0: BF800000
	s_nop 0                                                    // 0000000055B4: BF800000
	s_nop 0                                                    // 0000000055B8: BF800000
	s_nop 0                                                    // 0000000055BC: BF800000
	s_nop 0                                                    // 0000000055C0: BF800000
	s_nop 0                                                    // 0000000055C4: BF800000
	s_nop 0                                                    // 0000000055C8: BF800000
	s_nop 0                                                    // 0000000055CC: BF800000
	s_nop 0                                                    // 0000000055D0: BF800000
	s_nop 0                                                    // 0000000055D4: BF800000
	s_nop 0                                                    // 0000000055D8: BF800000
	s_nop 0                                                    // 0000000055DC: BF800000
	s_nop 0                                                    // 0000000055E0: BF800000
	s_nop 0                                                    // 0000000055E4: BF800000
	s_nop 0                                                    // 0000000055E8: BF800000
	s_nop 0                                                    // 0000000055EC: BF800000
	s_nop 0                                                    // 0000000055F0: BF800000
	s_nop 0                                                    // 0000000055F4: BF800000
	s_nop 0                                                    // 0000000055F8: BF800000
	s_nop 0                                                    // 0000000055FC: BF800000

gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw:
	s_add_u32 flat_scratch_lo, s6, s9                          // 000000005600: 80660906
	s_addc_u32 flat_scratch_hi, s7, 0                          // 000000005604: 82678007
	s_add_u32 s0, s0, s9                                       // 000000005608: 80000900
	s_mov_b32 s6, 0x5397829d                                   // 00000000560C: BE8600FF 5397829D
	s_addc_u32 s1, s1, 0                                       // 000000005614: 82018001
	s_mul_hi_i32 s7, s8, s6                                    // 000000005618: 96870608
	s_lshr_b32 s9, s7, 31                                      // 00000000561C: 8F099F07
	s_ashr_i32 s20, s7, 8                                      // 000000005620: 90148807
	s_add_i32 s20, s20, s9                                     // 000000005624: 81140914
	s_mul_i32 s7, s20, 0xfffffcf0                              // 000000005628: 9207FF14 FFFFFCF0
	v_bfe_u32 v3, v0, 1, 5                                     // 000000005630: D1C80003 02150300
	s_add_i32 s7, s7, s8                                       // 000000005638: 81070807
	v_lshlrev_b32_e32 v2, 1, v3                                // 00000000563C: 24040681
	v_and_b32_e32 v7, 63, v0                                   // 000000005640: 260E00BF
	s_ashr_i32 s8, s7, 31                                      // 000000005644: 90089F07
	v_sub_u32_e32 v2, v7, v2                                   // 000000005648: 6A040507
	s_lshr_b32 s8, s8, 30                                      // 00000000564C: 8F089E08
	v_lshrrev_b32_e32 v1, 6, v0                                // 000000005650: 20020086
	v_lshlrev_b32_e32 v5, 2, v2                                // 000000005654: 240A0482
	s_add_i32 s8, s7, s8                                       // 000000005658: 81080807
	v_lshl_add_u32 v2, v1, 3, v5                               // 00000000565C: D1FD0002 04150701
	s_and_b32 s9, s8, -4                                       // 000000005664: 8609C408
	v_ashrrev_i32_e32 v4, 31, v2                               // 000000005668: 2208049F
	s_sub_i32 s7, s7, s9                                       // 00000000566C: 81870907
	v_lshrrev_b32_e32 v4, 22, v4                               // 000000005670: 20080896
	s_lshl_b32 s21, s7, 8                                      // 000000005674: 8E158807
	v_add_u32_e32 v4, v2, v4                                   // 000000005678: 68080902
	s_movk_i32 s7, 0xfc00                                      // 00000000567C: B007FC00
	v_ashrrev_i32_e32 v6, 10, v4                               // 000000005680: 220C088A
	v_and_b32_e32 v4, s7, v4                                   // 000000005684: 26080807
	v_sub_u32_e32 v2, v2, v4                                   // 000000005688: 6A040902
	v_ashrrev_i32_e32 v4, 31, v2                               // 00000000568C: 2208049F
	v_lshrrev_b32_e32 v4, 22, v4                               // 000000005690: 20080896
	v_add_u32_e32 v8, v2, v4                                   // 000000005694: 68100902
	v_ashrrev_i32_e32 v4, 10, v8                               // 000000005698: 2208108A
	v_and_b32_e32 v8, s7, v8                                   // 00000000569C: 26101007
	s_lshl_b32 s7, s20, 20                                     // 0000000056A0: 8E079414
	v_sub_u32_e32 v2, v2, v8                                   // 0000000056A4: 6A041102
	s_add_i32 s7, s21, s7                                      // 0000000056A8: 81070715
	s_load_dwordx2 s[24:25], s[4:5], 0x8                       // 0000000056AC: C0060602 00000008
	s_load_dwordx2 s[28:29], s[4:5], 0x0                       // 0000000056B4: C0060702 00000000
	v_lshl_or_b32 v8, v3, 3, s7                                // 0000000056BC: D2000008 001D0703
	v_lshlrev_b32_e32 v3, 6, v3                                // 0000000056C4: 24060686
	v_add3_u32 v6, v4, v6, v2                                  // 0000000056C8: D1FF0006 040A0D04
	v_lshl_or_b32 v1, v1, 11, v3                               // 0000000056D0: D2000001 040D1701
	v_lshl_add_u32 v3, v6, 10, v8                              // 0000000056D8: D1FD0003 04211506
	s_mov_b32 s27, 0x27000                                     // 0000000056E0: BE9B00FF 00027000
	s_mov_b32 s26, -1                                          // 0000000056E8: BE9A00C1
	v_lshlrev_b32_e32 v8, 1, v3                                // 0000000056EC: 24100681
	s_movk_i32 s7, 0x400                                       // 0000000056F0: B0070400
	s_mov_b32 s9, 0x3ffc00                                     // 0000000056F4: BE8900FF 003FFC00
	v_add_u32_e32 v6, 1, v4                                    // 0000000056FC: 680C0881
	v_add_u32_e32 v10, v2, v4                                  // 000000005700: 68140902
	v_add_lshl_u32 v28, v1, v5, 1                              // 000000005704: D1FE001C 02060B01
	v_add_u32_e32 v1, 0x2020, v28                              // 00000000570C: 680238FF 00002020
	s_ashr_i32 s8, s8, 2                                       // 000000005714: 90088208
	s_lshl_b32 s18, s8, 7                                      // 000000005718: 8E128708
	s_load_dwordx2 s[16:17], s[4:5], 0x10                      // 00000000571C: C0060402 00000010
	s_waitcnt lgkmcnt(0)                                       // 000000005724: BF8CC07F
	buffer_load_dwordx4 v[12:15], v8, s[24:27], 0 offen        // 000000005728: E05C1000 80060C08
	v_or_b32_e32 v8, 1, v2                                     // 000000005730: 28100481
	v_add_u32_e32 v9, s9, v8                                   // 000000005734: 68121009
	v_cmp_gt_i32_e32 vcc, s7, v8                               // 000000005738: 7D881007
	v_cndmask_b32_e32 v8, v9, v8, vcc                          // 00000000573C: 00101109
	v_cndmask_b32_e32 v9, v6, v4, vcc                          // 000000005740: 00120906
	v_sub_u32_e32 v8, v8, v10                                  // 000000005744: 6A101508
	v_add_lshl_u32 v8, v8, v9, 10                              // 000000005748: D1FE0008 022A1308
	v_add_lshl_u32 v8, v8, v3, 1                               // 000000005750: D1FE0008 02060708
	s_mov_b32 s4, 0x92492493                                   // 000000005758: BE8400FF 92492493
	s_movk_i32 s22, 0x3800                                     // 000000005760: B0163800
	s_mov_b32 s30, s26                                         // 000000005764: BE9E001A
	s_mov_b32 s31, s27                                         // 000000005768: BE9F001B
	s_movk_i32 s33, 0xfc08                                     // 00000000576C: B021FC08
	s_movk_i32 s23, 0x3ff                                      // 000000005770: B01703FF
	v_accvgpr_write_b32 a64, 0                                 // 000000005774: D3D90040 00000080
	v_accvgpr_write_b32 a65, 0                                 // 00000000577C: D3D90041 00000080
	v_accvgpr_write_b32 a66, 0                                 // 000000005784: D3D90042 00000080
	v_accvgpr_write_b32 a67, 0                                 // 00000000578C: D3D90043 00000080
	v_accvgpr_write_b32 a68, 0                                 // 000000005794: D3D90044 00000080
	v_accvgpr_write_b32 a69, 0                                 // 00000000579C: D3D90045 00000080
	v_accvgpr_write_b32 a70, 0                                 // 0000000057A4: D3D90046 00000080
	v_accvgpr_write_b32 a71, 0                                 // 0000000057AC: D3D90047 00000080
	v_accvgpr_write_b32 a72, 0                                 // 0000000057B4: D3D90048 00000080
	v_accvgpr_write_b32 a73, 0                                 // 0000000057BC: D3D90049 00000080
	v_accvgpr_write_b32 a74, 0                                 // 0000000057C4: D3D9004A 00000080
	v_accvgpr_write_b32 a75, 0                                 // 0000000057CC: D3D9004B 00000080
	buffer_load_dwordx4 v[16:19], v8, s[24:27], 0 offen        // 0000000057D4: E05C1000 80061008
	v_or_b32_e32 v8, 2, v2                                     // 0000000057DC: 28100482
	v_add_u32_e32 v9, s9, v8                                   // 0000000057E0: 68121009
	v_cmp_gt_i32_e32 vcc, s7, v8                               // 0000000057E4: 7D881007
	v_cndmask_b32_e32 v8, v9, v8, vcc                          // 0000000057E8: 00101109
	v_cndmask_b32_e32 v9, v6, v4, vcc                          // 0000000057EC: 00120906
	v_sub_u32_e32 v8, v8, v10                                  // 0000000057F0: 6A101508
	v_add_lshl_u32 v8, v8, v9, 10                              // 0000000057F4: D1FE0008 022A1308
	v_add_lshl_u32 v8, v8, v3, 1                               // 0000000057FC: D1FE0008 02060708
	v_accvgpr_write_b32 a76, 0                                 // 000000005804: D3D9004C 00000080
	v_accvgpr_write_b32 a77, 0                                 // 00000000580C: D3D9004D 00000080
	v_accvgpr_write_b32 a78, 0                                 // 000000005814: D3D9004E 00000080
	v_accvgpr_write_b32 a79, 0                                 // 00000000581C: D3D9004F 00000080
	v_accvgpr_write_b32 a80, 0                                 // 000000005824: D3D90050 00000080
	v_accvgpr_write_b32 a81, 0                                 // 00000000582C: D3D90051 00000080
	v_accvgpr_write_b32 a82, 0                                 // 000000005834: D3D90052 00000080
	v_accvgpr_write_b32 a83, 0                                 // 00000000583C: D3D90053 00000080
	v_accvgpr_write_b32 a84, 0                                 // 000000005844: D3D90054 00000080
	v_accvgpr_write_b32 a85, 0                                 // 00000000584C: D3D90055 00000080
	v_accvgpr_write_b32 a86, 0                                 // 000000005854: D3D90056 00000080
	v_accvgpr_write_b32 a87, 0                                 // 00000000585C: D3D90057 00000080
	v_accvgpr_write_b32 a88, 0                                 // 000000005864: D3D90058 00000080
	v_accvgpr_write_b32 a89, 0                                 // 00000000586C: D3D90059 00000080
	v_accvgpr_write_b32 a90, 0                                 // 000000005874: D3D9005A 00000080
	v_accvgpr_write_b32 a91, 0                                 // 00000000587C: D3D9005B 00000080
	v_accvgpr_write_b32 a92, 0                                 // 000000005884: D3D9005C 00000080
	v_accvgpr_write_b32 a93, 0                                 // 00000000588C: D3D9005D 00000080
	buffer_load_dwordx4 v[20:23], v8, s[24:27], 0 offen        // 000000005894: E05C1000 80061408
	v_or_b32_e32 v8, 3, v2                                     // 00000000589C: 28100483
	v_add_u32_e32 v9, s9, v8                                   // 0000000058A0: 68121009
	v_cmp_gt_i32_e32 vcc, s7, v8                               // 0000000058A4: 7D881007
	v_cndmask_b32_e32 v8, v9, v8, vcc                          // 0000000058A8: 00101109
	v_cndmask_b32_e32 v6, v6, v4, vcc                          // 0000000058AC: 000C0906
	v_sub_u32_e32 v8, v8, v10                                  // 0000000058B0: 6A101508
	v_add_lshl_u32 v6, v8, v6, 10                              // 0000000058B4: D1FE0006 022A0D08
	v_add_lshl_u32 v6, v6, v3, 1                               // 0000000058BC: D1FE0006 02060706
	v_mov_b32_e32 v8, 0xffff                                   // 0000000058C4: 7E1002FF 0000FFFF
	s_movk_i32 s9, 0x2000                                      // 0000000058CC: B0092000
	v_mov_b32_e32 v9, 0xffff0000                               // 0000000058D0: 7E1202FF FFFF0000
	v_add_u32_e32 v10, s9, v28                                 // 0000000058D8: 68143809
	v_accvgpr_write_b32 a94, 0                                 // 0000000058DC: D3D9005E 00000080
	v_accvgpr_write_b32 a95, 0                                 // 0000000058E4: D3D9005F 00000080
	v_accvgpr_write_b32 a127, 0                                // 0000000058EC: D3D9007F 00000080
	v_accvgpr_write_b32 a126, 0                                // 0000000058F4: D3D9007E 00000080
	v_accvgpr_write_b32 a125, 0                                // 0000000058FC: D3D9007D 00000080
	v_accvgpr_write_b32 a124, 0                                // 000000005904: D3D9007C 00000080
	v_accvgpr_write_b32 a123, 0                                // 00000000590C: D3D9007B 00000080
	v_accvgpr_write_b32 a122, 0                                // 000000005914: D3D9007A 00000080
	v_accvgpr_write_b32 a121, 0                                // 00000000591C: D3D90079 00000080
	v_accvgpr_write_b32 a120, 0                                // 000000005924: D3D90078 00000080
	v_accvgpr_write_b32 a119, 0                                // 00000000592C: D3D90077 00000080
	v_accvgpr_write_b32 a118, 0                                // 000000005934: D3D90076 00000080
	v_accvgpr_write_b32 a117, 0                                // 00000000593C: D3D90075 00000080
	s_waitcnt vmcnt(2)                                         // 000000005944: BF8C0F72
	v_and_b32_e32 v5, v8, v12                                  // 000000005948: 260A1908
	v_accvgpr_write_b32 a116, 0                                // 00000000594C: D3D90074 00000080
	v_accvgpr_write_b32 a115, 0                                // 000000005954: D3D90073 00000080
	buffer_load_dwordx4 v[24:27], v6, s[24:27], 0 offen        // 00000000595C: E05C1000 80061806
	v_lshrrev_b32_e32 v6, 16, v12                              // 000000005964: 200C1890
	v_and_b32_e32 v12, v8, v13                                 // 000000005968: 26181B08
	v_lshrrev_b32_e32 v13, 16, v13                             // 00000000596C: 201A1A90
	v_accvgpr_write_b32 a114, 0                                // 000000005970: D3D90072 00000080
	v_accvgpr_write_b32 a113, 0                                // 000000005978: D3D90071 00000080
	v_accvgpr_write_b32 a112, 0                                // 000000005980: D3D90070 00000080
	v_accvgpr_write_b32 a111, 0                                // 000000005988: D3D9006F 00000080
	v_accvgpr_write_b32 a110, 0                                // 000000005990: D3D9006E 00000080
	v_accvgpr_write_b32 a109, 0                                // 000000005998: D3D9006D 00000080
	v_accvgpr_write_b32 a108, 0                                // 0000000059A0: D3D9006C 00000080
	v_accvgpr_write_b32 a107, 0                                // 0000000059A8: D3D9006B 00000080
	v_accvgpr_write_b32 a106, 0                                // 0000000059B0: D3D9006A 00000080
	v_accvgpr_write_b32 a105, 0                                // 0000000059B8: D3D90069 00000080
	v_accvgpr_write_b32 a104, 0                                // 0000000059C0: D3D90068 00000080
	v_accvgpr_write_b32 a103, 0                                // 0000000059C8: D3D90067 00000080
	v_accvgpr_write_b32 a102, 0                                // 0000000059D0: D3D90066 00000080
	v_accvgpr_write_b32 a101, 0                                // 0000000059D8: D3D90065 00000080
	v_accvgpr_write_b32 a100, 0                                // 0000000059E0: D3D90064 00000080
	v_accvgpr_write_b32 a99, 0                                 // 0000000059E8: D3D90063 00000080
	v_accvgpr_write_b32 a98, 0                                 // 0000000059F0: D3D90062 00000080
	v_accvgpr_write_b32 a97, 0                                 // 0000000059F8: D3D90061 00000080
	v_accvgpr_write_b32 a96, 0                                 // 000000005A00: D3D90060 00000080
	v_accvgpr_write_b32 a32, 0                                 // 000000005A08: D3D90020 00000080
	s_waitcnt vmcnt(2)                                         // 000000005A10: BF8C0F72
	v_lshl_or_b32 v5, v16, 16, v5                              // 000000005A14: D2000005 04152110
	v_and_or_b32 v11, v16, v9, v6                              // 000000005A1C: D201000B 041A1310
	v_lshl_or_b32 v16, v17, 16, v12                            // 000000005A24: D2000010 04312111
	v_accvgpr_write_b32 a33, 0                                 // 000000005A2C: D3D90021 00000080
	v_accvgpr_write_b32 a34, 0                                 // 000000005A34: D3D90022 00000080
	v_accvgpr_write_b32 a35, 0                                 // 000000005A3C: D3D90023 00000080
	v_accvgpr_write_b32 a36, 0                                 // 000000005A44: D3D90024 00000080
	v_accvgpr_write_b32 a37, 0                                 // 000000005A4C: D3D90025 00000080
	v_accvgpr_write_b32 a38, 0                                 // 000000005A54: D3D90026 00000080
	v_accvgpr_write_b32 a39, 0                                 // 000000005A5C: D3D90027 00000080
	v_accvgpr_write_b32 a40, 0                                 // 000000005A64: D3D90028 00000080
	v_accvgpr_write_b32 a41, 0                                 // 000000005A6C: D3D90029 00000080
	v_accvgpr_write_b32 a42, 0                                 // 000000005A74: D3D9002A 00000080
	v_accvgpr_write_b32 a43, 0                                 // 000000005A7C: D3D9002B 00000080
	v_accvgpr_write_b32 a44, 0                                 // 000000005A84: D3D9002C 00000080
	v_accvgpr_write_b32 a45, 0                                 // 000000005A8C: D3D9002D 00000080
	v_accvgpr_write_b32 a46, 0                                 // 000000005A94: D3D9002E 00000080
	v_accvgpr_write_b32 a47, 0                                 // 000000005A9C: D3D9002F 00000080
	v_accvgpr_write_b32 a48, 0                                 // 000000005AA4: D3D90030 00000080
	v_accvgpr_write_b32 a49, 0                                 // 000000005AAC: D3D90031 00000080
	v_accvgpr_write_b32 a50, 0                                 // 000000005AB4: D3D90032 00000080
	v_accvgpr_write_b32 a51, 0                                 // 000000005ABC: D3D90033 00000080
	v_accvgpr_write_b32 a52, 0                                 // 000000005AC4: D3D90034 00000080
	v_accvgpr_write_b32 a53, 0                                 // 000000005ACC: D3D90035 00000080
	v_accvgpr_write_b32 a54, 0                                 // 000000005AD4: D3D90036 00000080
	v_accvgpr_write_b32 a55, 0                                 // 000000005ADC: D3D90037 00000080
	v_accvgpr_write_b32 a56, 0                                 // 000000005AE4: D3D90038 00000080
	s_waitcnt vmcnt(1)                                         // 000000005AEC: BF8C0F71
	v_and_b32_e32 v29, v8, v20                                 // 000000005AF0: 263A2908
	v_lshrrev_b32_e32 v30, 16, v20                             // 000000005AF4: 203C2890
	v_and_b32_e32 v31, v8, v21                                 // 000000005AF8: 263E2B08
	v_lshrrev_b32_e32 v21, 16, v21                             // 000000005AFC: 202A2A90
	v_and_or_b32 v20, v17, v9, v13                             // 000000005B00: D2010014 04361311
	v_and_b32_e32 v13, v8, v22                                 // 000000005B08: 261A2D08
	v_accvgpr_write_b32 a57, 0                                 // 000000005B0C: D3D90039 00000080
	v_accvgpr_write_b32 a58, 0                                 // 000000005B14: D3D9003A 00000080
	v_accvgpr_write_b32 a59, 0                                 // 000000005B1C: D3D9003B 00000080
	v_accvgpr_write_b32 a60, 0                                 // 000000005B24: D3D9003C 00000080
	v_accvgpr_write_b32 a61, 0                                 // 000000005B2C: D3D9003D 00000080
	v_accvgpr_write_b32 a62, 0                                 // 000000005B34: D3D9003E 00000080
	v_accvgpr_write_b32 a63, 0                                 // 000000005B3C: D3D9003F 00000080
	v_accvgpr_write_b32 a0, 0                                  // 000000005B44: D3D90000 00000080
	v_accvgpr_write_b32 a1, 0                                  // 000000005B4C: D3D90001 00000080
	v_accvgpr_write_b32 a2, 0                                  // 000000005B54: D3D90002 00000080
	v_accvgpr_write_b32 a3, 0                                  // 000000005B5C: D3D90003 00000080
	v_accvgpr_write_b32 a4, 0                                  // 000000005B64: D3D90004 00000080
	v_accvgpr_write_b32 a5, 0                                  // 000000005B6C: D3D90005 00000080
	v_accvgpr_write_b32 a6, 0                                  // 000000005B74: D3D90006 00000080
	v_accvgpr_write_b32 a7, 0                                  // 000000005B7C: D3D90007 00000080
	v_accvgpr_write_b32 a8, 0                                  // 000000005B84: D3D90008 00000080
	v_accvgpr_write_b32 a9, 0                                  // 000000005B8C: D3D90009 00000080
	v_accvgpr_write_b32 a10, 0                                 // 000000005B94: D3D9000A 00000080
	v_accvgpr_write_b32 a11, 0                                 // 000000005B9C: D3D9000B 00000080
	v_accvgpr_write_b32 a12, 0                                 // 000000005BA4: D3D9000C 00000080
	v_accvgpr_write_b32 a13, 0                                 // 000000005BAC: D3D9000D 00000080
	v_accvgpr_write_b32 a14, 0                                 // 000000005BB4: D3D9000E 00000080
	v_accvgpr_write_b32 a15, 0                                 // 000000005BBC: D3D9000F 00000080
	s_waitcnt vmcnt(0)                                         // 000000005BC4: BF8C0F70
	v_lshl_or_b32 v6, v24, 16, v29                             // 000000005BC8: D2000006 04752118
	v_and_or_b32 v12, v24, v9, v30                             // 000000005BD0: D201000C 047A1318
	v_lshl_or_b32 v17, v25, 16, v31                            // 000000005BD8: D2000011 047D2119
	v_and_or_b32 v21, v25, v9, v21                             // 000000005BE0: D2010015 04561319
	ds_write2_b64 v10, v[5:6], v[11:12] offset1:2              // 000000005BE8: D89C0200 000B050A
	ds_write2_b64 v1, v[16:17], v[20:21] offset1:2             // 000000005BF0: D89C0200 00141001
	v_and_b32_e32 v1, v8, v14                                  // 000000005BF8: 26021D08
	v_lshl_or_b32 v5, v18, 16, v1                              // 000000005BFC: D2000005 04052112
	v_lshrrev_b32_e32 v1, 16, v22                              // 000000005C04: 20022C90
	v_lshl_or_b32 v6, v26, 16, v13                             // 000000005C08: D2000006 0435211A
	v_and_or_b32 v12, v26, v9, v1                              // 000000005C10: D201000C 0406131A
	v_lshrrev_b32_e32 v1, 16, v14                              // 000000005C18: 20021C90
	v_lshrrev_b32_e32 v13, 1, v0                               // 000000005C1C: 201A0081
	v_and_or_b32 v11, v18, v9, v1                              // 000000005C20: D201000B 04061312
	v_or_b32_e32 v1, s18, v13                                  // 000000005C28: 28021A12
	v_mul_hi_i32 v14, v1, s6                                   // 000000005C2C: D287000E 00000D01
	v_add_u32_e32 v16, 0x2040, v28                             // 000000005C34: 682038FF 00002040
	ds_write2_b64 v16, v[5:6], v[11:12] offset1:2              // 000000005C3C: D89C0200 000B0510
	s_movk_i32 s6, 0xff3c                                      // 000000005C44: B006FF3C
	v_lshrrev_b32_e32 v6, 31, v14                              // 000000005C48: 200C1C9F
	v_ashrrev_i32_e32 v11, 6, v14                              // 000000005C4C: 22161C86
	v_add_u32_e32 v11, v11, v6                                 // 000000005C50: 68160D0B
	v_mul_lo_u32 v6, v11, s6                                   // 000000005C54: D2850006 00000D0B
	v_and_b32_e32 v5, v8, v23                                  // 000000005C5C: 260A2F08
	v_lshrrev_b32_e32 v12, 16, v23                             // 000000005C60: 20182E90
	v_and_or_b32 v16, v27, v9, v12                             // 000000005C64: D2010010 0432131B
	v_add_u32_e32 v14, v6, v1                                  // 000000005C6C: 681C0306
	v_mul_hi_i32 v17, v14, s4                                  // 000000005C70: D2870011 0000090E
	v_lshl_or_b32 v6, v27, 16, v5                              // 000000005C78: D2000006 0415211B
	v_add_u32_e32 v11, s20, v11                                // 000000005C80: 68161614
	s_mov_b32 s4, 0x31000                                      // 000000005C84: BE8400FF 00031000
	v_add_u32_e32 v5, v17, v14                                 // 000000005C8C: 680A1D11
	v_lshrrev_b32_e32 v12, 31, v5                              // 000000005C90: 20180A9F
	v_ashrrev_i32_e32 v5, 3, v5                                // 000000005C94: 220A0A83
	v_add_u32_e32 v5, v5, v12                                  // 000000005C98: 680A1905
	v_mul_lo_u32 v12, v5, -14                                  // 000000005C9C: D285000C 00019D05
	v_mul_lo_u32 v17, v11, s4                                  // 000000005CA4: D2850011 0000090B
	v_mul_lo_u32 v5, v5, s22                                   // 000000005CAC: D2850005 00002D05
	v_and_b32_e32 v23, 1, v0                                   // 000000005CB4: 262E0081
	v_lshlrev_b32_e32 v11, 4, v23                              // 000000005CB8: 24162E84
	v_add_lshl_u32 v12, v14, v12, 10                           // 000000005CBC: D1FE000C 022A190E
	v_or_b32_e32 v14, v17, v11                                 // 000000005CC4: 281C1711
	v_add3_u32 v14, v14, v5, v12                               // 000000005CC8: D1FF000E 04320B0E
	v_and_b32_e32 v5, v8, v15                                  // 000000005CD0: 260A1F08
	v_lshrrev_b32_e32 v15, 16, v15                             // 000000005CD4: 201E1E90
	v_lshl_or_b32 v5, v19, 16, v5                              // 000000005CD8: D2000005 04152113
	v_and_or_b32 v15, v19, v9, v15                             // 000000005CE0: D201000F 043E1313
	v_add_u32_e32 v17, 0x2060, v28                             // 000000005CE8: 682238FF 00002060
	ds_write2_b64 v17, v[5:6], v[15:16] offset1:2              // 000000005CF0: D89C0200 000F0511
	v_lshlrev_b32_e32 v5, 1, v14                               // 000000005CF8: 240A1C81
	v_or_b32_e32 v6, s33, v11                                  // 000000005CFC: 280C1621
	v_and_b32_e32 v1, 0xc0, v0                                 // 000000005D00: 260200FF 000000C0
	v_accvgpr_write_b32 a16, 0                                 // 000000005D08: D3D90010 00000080
	v_accvgpr_write_b32 a17, 0                                 // 000000005D10: D3D90011 00000080
	v_accvgpr_write_b32 a18, 0                                 // 000000005D18: D3D90012 00000080
	v_accvgpr_write_b32 a19, 0                                 // 000000005D20: D3D90013 00000080
	v_accvgpr_write_b32 a20, 0                                 // 000000005D28: D3D90014 00000080
	v_accvgpr_write_b32 a21, 0                                 // 000000005D30: D3D90015 00000080
	v_accvgpr_write_b32 a22, 0                                 // 000000005D38: D3D90016 00000080
	v_accvgpr_write_b32 a23, 0                                 // 000000005D40: D3D90017 00000080
	v_accvgpr_write_b32 a24, 0                                 // 000000005D48: D3D90018 00000080
	v_accvgpr_write_b32 a25, 0                                 // 000000005D50: D3D90019 00000080
	v_accvgpr_write_b32 a26, 0                                 // 000000005D58: D3D9001A 00000080
	v_accvgpr_write_b32 a27, 0                                 // 000000005D60: D3D9001B 00000080
	v_accvgpr_write_b32 a28, 0                                 // 000000005D68: D3D9001C 00000080
	v_accvgpr_write_b32 a29, 0                                 // 000000005D70: D3D9001D 00000080
	v_accvgpr_write_b32 a30, 0                                 // 000000005D78: D3D9001E 00000080
	v_accvgpr_write_b32 a31, 0                                 // 000000005D80: D3D9001F 00000080
	buffer_load_dwordx4 v[15:18], v5, s[28:31], 0 offen        // 000000005D88: E05C1000 80070F05
	v_or_b32_e32 v5, 8, v11                                    // 000000005D90: 280A1688
	v_cmp_gt_i32_e32 vcc, s7, v5                               // 000000005D94: 7D880A07
	v_cndmask_b32_e32 v6, v6, v5, vcc                          // 000000005D98: 000C0B06
	v_cmp_lt_i32_e32 vcc, s23, v5                              // 000000005D9C: 7D820A17
	v_cndmask_b32_e64 v5, 0, 1, vcc                            // 000000005DA0: D1000005 01A90280
	v_cmp_lt_i32_e64 s[4:5], 0, v5                             // 000000005DA8: D0C10004 00020A80
	v_cndmask_b32_e64 v5, 0, -1, s[4:5]                        // 000000005DB0: D1000005 00118280
	v_cndmask_b32_e64 v19, 0, 1, s[4:5]                        // 000000005DB8: D1000013 00110280
	v_subbrev_co_u32_e32 v19, vcc, 0, v19, vcc                 // 000000005DC0: 3C262680
	v_sub_u32_e32 v6, v6, v11                                  // 000000005DC4: 6A0C1706
	v_mul_i32_i24_e32 v5, s22, v5                              // 000000005DC8: 0C0A0A16
	v_add3_u32 v5, v6, v14, v5                                 // 000000005DCC: D1FF0005 04161D06
	v_lshlrev_b32_e32 v19, 10, v19                             // 000000005DD4: 2426268A
	v_add_lshl_u32 v5, v5, v19, 1                              // 000000005DD8: D1FE0005 02062705
	v_lshlrev_b32_e32 v6, 4, v7                                // 000000005DE0: 240C0E84
	s_mov_b32 s19, -4                                          // 000000005DE4: BE9300C4
	v_mov_b32_e32 v12, 0                                       // 000000005DE8: 7E180280
	s_movk_i32 s34, 0x3df                                      // 000000005DEC: B02203DF
	s_movk_i32 s35, 0x3e0                                      // 000000005DF0: B02303E0
	s_movk_i32 s36, 0x3fe                                      // 000000005DF4: B02403FE
	s_movk_i32 s37, 0x3fd                                      // 000000005DF8: B02503FD
	s_movk_i32 s38, 0x3f7                                      // 000000005DFC: B02603F7
	s_movk_i32 s39, 0x3f8                                      // 000000005E00: B02703F8
	s_nop 0                                                    // 000000005E04: BF800000
	s_nop 0                                                    // 000000005E08: BF800000
	buffer_load_dwordx4 v[19:22], v5, s[28:31], 0 offen        // 000000005E0C: E05C1000 80071305
	v_lshlrev_b32_e32 v5, 4, v13                               // 000000005E14: 240A1A84
	v_lshl_or_b32 v13, v23, 12, v5                             // 000000005E18: D200000D 04151917
	v_lshlrev_b32_e32 v5, 4, v1                                // 000000005E20: 240A0284
	v_or3_b32 v7, v5, v6, s9                                   // 000000005E24: D2020007 00260D05
	v_or_b32_e32 v5, s7, v6                                    // 000000005E2C: 280A0C07
	s_waitcnt vmcnt(1)                                         // 000000005E30: BF8C0F71
	ds_write_b128 v13, v[15:18]                                // 000000005E34: D9BE0000 00000F0D
	s_waitcnt vmcnt(0)                                         // 000000005E3C: BF8C0F70
	ds_write_b128 v13, v[19:22] offset:2048                    // 000000005E40: D9BE0800 0000130D
	v_mov_b32_e32 v15, 0xfffffc20                              // 000000005E48: 7E1E02FF FFFFFC20
	v_mov_b32_e32 v16, 0x7fffc800                              // 000000005E50: 7E2002FF 7FFFC800

BB77_1:
	v_cmp_gt_i32_e32 vcc, s35, v2                              // 000000005E58: 7D880423
	v_cmp_gt_i32_e64 s[4:5], s35, v11                          // 000000005E5C: D0C40004 00021623
	v_cndmask_b32_e64 v19, v15, 32, s[4:5]                     // 000000005E64: D1000013 0011410F
	v_cmp_lt_i32_e64 s[4:5], s34, v11                          // 000000005E6C: D0C10004 00021622
	v_cndmask_b32_e64 v17, v15, 32, vcc                        // 000000005E74: D1000011 01A9410F
	v_cmp_lt_i32_e32 vcc, s34, v2                              // 000000005E7C: 7D820422
	v_cndmask_b32_e64 v18, 0, 1, vcc                           // 000000005E80: D1000012 01A90280
	v_addc_co_u32_e64 v20, s[4:5], 0, v12, s[4:5]              // 000000005E88: D11C0414 00121880
	v_addc_co_u32_e32 v4, vcc, 0, v4, vcc                      // 000000005E90: 38080880
	v_add_u32_e32 v2, v17, v2                                  // 000000005E94: 68040511
	v_add_u32_e32 v11, v19, v11                                // 000000005E98: 68161713
	v_cmp_lt_i32_e64 s[4:5], 0, v4                             // 000000005E9C: D0C10004 00020880
	v_cmp_lt_i32_e32 vcc, 0, v20                               // 000000005EA4: 7D822880
	v_cndmask_b32_e64 v21, 0, -1, vcc                          // 000000005EA8: D1000015 01A98280
	v_subbrev_co_u32_e32 v20, vcc, 0, v20, vcc                 // 000000005EB0: 3C282880
	v_add_u32_e32 v14, v19, v14                                // 000000005EB4: 681C1D13
	v_cndmask_b32_e64 v19, 0, 1, s[4:5]                        // 000000005EB8: D1000013 00110280
	v_cmp_lt_i32_e64 s[10:11], s38, v11                        // 000000005EC0: D0C1000A 00021626
	v_or_b32_e32 v22, 1, v2                                    // 000000005EC8: 282C0481
	v_add_u32_e32 v23, 0x3ffc01, v2                            // 000000005ECC: 682E04FF 003FFC01
	v_or_b32_e32 v26, 3, v2                                    // 000000005ED4: 28340483
	v_add_u32_e32 v27, 0x3ffc03, v2                            // 000000005ED8: 683604FF 003FFC03
	v_cmp_gt_i32_e64 s[6:7], s37, v2                           // 000000005EE0: D0C40006 00020425
	v_cmp_gt_i32_e64 s[12:13], s23, v2                         // 000000005EE8: D0C4000C 00020417
	v_subbrev_co_u32_e64 v4, s[14:15], 0, v4, s[4:5]           // 000000005EF0: D11E0E04 00120880
	v_or_b32_e32 v17, v17, v19                                 // 000000005EF8: 28222711
	v_cndmask_b32_e64 v19, v23, v22, s[12:13]                  // 000000005EFC: D1000013 00322D17
	v_subbrev_co_u32_e64 v18, s[4:5], 0, v18, s[4:5]           // 000000005F04: D11E0412 00122480
	v_cndmask_b32_e64 v23, v27, v26, s[6:7]                    // 000000005F0C: D1000017 001A351B
	v_addc_co_u32_e64 v26, s[4:5], 0, v20, s[10:11]            // 000000005F14: D11C041A 002A2880
	v_or_b32_e32 v24, 2, v2                                    // 000000005F1C: 28300482
	v_add_u32_e32 v25, 0x3ffc02, v2                            // 000000005F20: 683204FF 003FFC02
	v_cmp_gt_i32_e32 vcc, s36, v2                              // 000000005F28: 7D880424
	v_cndmask_b32_e32 v22, v25, v24, vcc                       // 000000005F2C: 002C3119
	v_sub_u32_e32 v24, v12, v20                                // 000000005F30: 6A30290C
	v_cndmask_b32_e64 v30, 0, 1, s[10:11]                      // 000000005F34: D100001E 00290280
	v_cmp_lt_i32_e64 s[4:5], 0, v26                            // 000000005F3C: D0C10004 00023480
	v_mov_b32_e32 v12, v20                                     // 000000005F44: 7E180314
	v_sub_u32_e32 v20, v22, v2                                 // 000000005F48: 6A280516
	v_sub_u32_e32 v22, v23, v2                                 // 000000005F4C: 6A2C0517
	v_lshlrev_b32_e32 v23, 10, v24                             // 000000005F50: 242E308A
	v_subbrev_co_u32_e64 v24, s[4:5], 0, v30, s[4:5]           // 000000005F54: D11E0418 00123C80
	v_or_b32_e32 v28, 8, v11                                   // 000000005F5C: 28381688
	v_add_u32_e32 v29, s33, v11                                // 000000005F60: 683A1621
	v_cmp_gt_i32_e64 s[8:9], s39, v11                          // 000000005F64: D0C40008 00021627
	v_cndmask_b32_e64 v25, v29, v28, s[8:9]                    // 000000005F6C: D1000019 0022391D
	v_add_u32_e32 v17, v18, v17                                // 000000005F74: 68222312
	v_sub_u32_e32 v19, v19, v2                                 // 000000005F78: 6A260513
	v_cmp_gt_i32_e64 s[4:5], 1, v26                            // 000000005F7C: D0C40004 00023481
	v_mul_i32_i24_e32 v21, s22, v21                            // 000000005F84: 0C2A2A16
	v_add_u32_e32 v18, 1, v4                                   // 000000005F88: 68240881
	v_lshl_add_u32 v3, v17, 10, v3                             // 000000005F8C: D1FD0003 040D1511
	v_add3_u32 v14, v14, v21, v23                              // 000000005F94: D1FF000E 045E2B0E
	v_sub_u32_e32 v25, v25, v11                                // 000000005F9C: 6A321719
	v_cndmask_b32_e64 v26, v16, 0, s[4:5]                      // 000000005FA0: D100001A 00110110
	v_cndmask_b32_e64 v17, v18, v4, s[12:13]                   // 000000005FA8: D1000011 00320912
	v_sub_u32_e32 v19, v19, v4                                 // 000000005FB0: 6A260913
	v_cndmask_b32_e32 v27, v18, v4, vcc                        // 000000005FB4: 00360912
	v_add_lshl_u32 v23, v19, v17, 10                           // 000000005FB8: D1FE0017 022A2313
	v_sub_u32_e32 v20, v20, v4                                 // 000000005FC0: 6A280914
	v_lshlrev_b32_e32 v28, 10, v24                             // 000000005FC4: 2438308A
	v_add3_u32 v25, v25, v14, v26                              // 000000005FC8: D1FF0019 046A1D19
	v_cndmask_b32_e64 v18, v18, v4, s[6:7]                     // 000000005FD0: D1000012 001A0912
	v_sub_u32_e32 v22, v22, v4                                 // 000000005FD8: 6A2C0916
	v_add_lshl_u32 v24, v20, v27, 10                           // 000000005FDC: D1FE0018 022A3714
	v_add_lshl_u32 v22, v22, v18, 10                           // 000000005FE4: D1FE0016 022A2516
	v_lshlrev_b32_e32 v21, 1, v3                               // 000000005FEC: 242A0681
	v_lshlrev_b32_e32 v27, 1, v14                              // 000000005FF0: 24361C81
	v_add_lshl_u32 v37, v23, v3, 1                             // 000000005FF4: D1FE0025 02060717
	v_sub_u32_e32 v40, v25, v28                                // 000000005FFC: 6A503919
	v_add_lshl_u32 v38, v24, v3, 1                             // 000000006000: D1FE0026 02060718
	v_add_lshl_u32 v39, v22, v3, 1                             // 000000006008: D1FE0027 02060716
	s_nop 0                                                    // 000000006010: BF800000
	s_nop 0                                                    // 000000006014: BF800000
	buffer_load_dwordx4 v[17:20], v21, s[24:27], 0 offen       // 000000006018: E05C1000 80061115
	s_nop 0                                                    // 000000006020: BF800000
	s_nop 0                                                    // 000000006024: BF800000
	buffer_load_dwordx4 v[21:24], v27, s[28:31], 0 offen       // 000000006028: E05C1000 8007151B
	s_nop 0                                                    // 000000006030: BF800000
	s_nop 0                                                    // 000000006034: BF800000
	buffer_load_dwordx4 v[25:28], v37, s[24:27], 0 offen       // 000000006038: E05C1000 80061925
	buffer_load_dwordx4 v[29:32], v38, s[24:27], 0 offen       // 000000006040: E05C1000 80061D26
	buffer_load_dwordx4 v[33:36], v39, s[24:27], 0 offen       // 000000006048: E05C1000 80062127
	v_lshlrev_b32_e32 v37, 1, v40                              // 000000006050: 244A5081
	s_nop 0                                                    // 000000006054: BF800000
	s_nop 0                                                    // 000000006058: BF800000
	buffer_load_dwordx4 v[37:40], v37, s[28:31], 0 offen       // 00000000605C: E05C1000 80072525
	s_waitcnt lgkmcnt(0)                                       // 000000006064: BF8CC07F
	s_barrier                                                  // 000000006068: BF8A0000
	ds_read_b128 v[41:44], v7                                  // 00000000606C: D9FE0000 29000007
	ds_read_b128 v[45:48], v7 offset:4096                      // 000000006074: D9FE1000 2D000007
	ds_read_b128 v[49:52], v6                                  // 00000000607C: D9FE0000 31000006
	ds_read_b128 v[53:56], v6 offset:2048                      // 000000006084: D9FE0800 35000006
	ds_read_b128 v[57:60], v7 offset:8192                      // 00000000608C: D9FE2000 39000007
	ds_read_b128 v[61:64], v7 offset:12288                     // 000000006094: D9FE3000 3D000007
	ds_read_b128 v[65:68], v6 offset:4096                      // 00000000609C: D9FE1000 41000006
	ds_read_b128 v[69:72], v6 offset:6144                      // 0000000060A4: D9FE1800 45000006
	ds_read_b128 v[73:76], v5                                  // 0000000060AC: D9FE0000 49000005
	ds_read_b128 v[77:80], v5 offset:2048                      // 0000000060B4: D9FE0800 4D000005
	ds_read_b128 v[81:84], v5 offset:4096                      // 0000000060BC: D9FE1000 51000005
	ds_read_b128 v[85:88], v5 offset:6144                      // 0000000060C4: D9FE1800 55000005
	s_waitcnt lgkmcnt(9)                                       // 0000000060CC: BF8CC97F
	v_mfma_f32_32x32x4f16 a[96:127], v[41:42], v[49:50], a[96:127] cbsz:1 abid:1// 0000000060D0: D3C80960 05826329
	s_waitcnt lgkmcnt(3)                                       // 0000000060D8: BF8CC37F
	v_mfma_f32_32x32x4f16 a[32:63], v[41:42], v[73:74], a[32:63] cbsz:1// 0000000060DC: D3C80120 04829329
	v_mfma_f32_32x32x4f16 a[0:31], v[41:42], v[73:74], a[0:31] cbsz:1 abid:1// 0000000060E4: D3C80900 04029329
	v_mfma_f32_32x32x4f16 a[64:95], v[41:42], v[49:50], a[64:95] cbsz:1// 0000000060EC: D3C80140 05026329
	s_add_i32 s19, s19, 4                                      // 0000000060F4: 81138413
	s_cmpk_gt_u32 s19, 0x77                                    // 0000000060F8: B5130077
	s_waitcnt lgkmcnt(0)                                       // 0000000060FC: BF8CC07F
	s_barrier                                                  // 000000006100: BF8A0000
	v_mfma_f32_32x32x4f16 a[96:127], v[43:44], v[51:52], a[96:127] cbsz:1 abid:1// 000000006104: D3C80960 0582672B
	v_mfma_f32_32x32x4f16 a[32:63], v[43:44], v[75:76], a[32:63] cbsz:1// 00000000610C: D3C80120 0482972B
	v_mfma_f32_32x32x4f16 a[0:31], v[43:44], v[75:76], a[0:31] cbsz:1 abid:1// 000000006114: D3C80900 0402972B
	v_mfma_f32_32x32x4f16 a[64:95], v[43:44], v[51:52], a[64:95] cbsz:1// 00000000611C: D3C80140 0502672B
	v_mfma_f32_32x32x4f16 a[96:127], v[45:46], v[53:54], a[96:127] cbsz:1 abid:1// 000000006124: D3C80960 05826B2D
	s_waitcnt lgkmcnt(2)                                       // 00000000612C: BF8CC27F
	v_mfma_f32_32x32x4f16 a[32:63], v[45:46], v[77:78], a[32:63] cbsz:1// 000000006130: D3C80120 04829B2D
	v_mfma_f32_32x32x4f16 a[0:31], v[45:46], v[77:78], a[0:31] cbsz:1 abid:1// 000000006138: D3C80900 04029B2D
	v_mfma_f32_32x32x4f16 a[64:95], v[45:46], v[53:54], a[64:95] cbsz:1// 000000006140: D3C80140 05026B2D
	v_mfma_f32_32x32x4f16 a[96:127], v[47:48], v[55:56], a[96:127] cbsz:1 abid:1// 000000006148: D3C80960 05826F2F
	v_mfma_f32_32x32x4f16 a[32:63], v[47:48], v[79:80], a[32:63] cbsz:1// 000000006150: D3C80120 04829F2F
	v_mfma_f32_32x32x4f16 a[0:31], v[47:48], v[79:80], a[0:31] cbsz:1 abid:1// 000000006158: D3C80900 04029F2F
	v_mfma_f32_32x32x4f16 a[64:95], v[47:48], v[55:56], a[64:95] cbsz:1// 000000006160: D3C80140 05026F2F
	v_mfma_f32_32x32x4f16 a[96:127], v[57:58], v[65:66], a[96:127] cbsz:1 abid:1// 000000006168: D3C80960 05828339
	s_waitcnt lgkmcnt(1)                                       // 000000006170: BF8CC17F
	v_mfma_f32_32x32x4f16 a[32:63], v[57:58], v[81:82], a[32:63] cbsz:1// 000000006174: D3C80120 0482A339
	v_mfma_f32_32x32x4f16 a[0:31], v[57:58], v[81:82], a[0:31] cbsz:1 abid:1// 00000000617C: D3C80900 0402A339
	v_mfma_f32_32x32x4f16 a[64:95], v[57:58], v[65:66], a[64:95] cbsz:1// 000000006184: D3C80140 05028339
	s_waitcnt vmcnt(5)                                         // 00000000618C: BF8C0F75
	v_and_b32_e32 v43, v8, v18                                 // 000000006190: 26562508
	v_and_b32_e32 v41, v8, v17                                 // 000000006194: 26522308
	v_lshrrev_b32_e32 v42, 16, v17                             // 000000006198: 20542290
	v_lshrrev_b32_e32 v18, 16, v18                             // 00000000619C: 20242490
	s_waitcnt vmcnt(4)                                         // 0000000061A0: BF8C0F74
	ds_write_b128 v13, v[21:24]                                // 0000000061A4: D9BE0000 0000150D
	v_and_b32_e32 v46, v8, v20                                 // 0000000061AC: 265C2908
	s_waitcnt vmcnt(3)                                         // 0000000061B0: BF8C0F73
	v_lshl_or_b32 v17, v25, 16, v41                            // 0000000061B4: D2000011 04A52119
	s_waitcnt vmcnt(2)                                         // 0000000061BC: BF8C0F72
	v_and_b32_e32 v41, v8, v30                                 // 0000000061C0: 26523D08
	v_lshl_or_b32 v21, v26, 16, v43                            // 0000000061C4: D2000015 04AD211A
	v_mfma_f32_32x32x4f16 a[96:127], v[59:60], v[67:68], a[96:127] cbsz:1 abid:1// 0000000061CC: D3C80960 0582873B
	v_mfma_f32_32x32x4f16 a[32:63], v[59:60], v[83:84], a[32:63] cbsz:1// 0000000061D4: D3C80120 0482A73B
	v_mfma_f32_32x32x4f16 a[0:31], v[59:60], v[83:84], a[0:31] cbsz:1 abid:1// 0000000061DC: D3C80900 0402A73B
	v_mfma_f32_32x32x4f16 a[64:95], v[59:60], v[67:68], a[64:95] cbsz:1// 0000000061E4: D3C80140 0502873B
	v_and_or_b32 v23, v26, v9, v18                             // 0000000061EC: D2010017 044A131A
	v_and_b32_e32 v26, v8, v31                                 // 0000000061F4: 26343F08
	v_and_b32_e32 v22, v8, v29                                 // 0000000061F8: 262C3B08
	v_lshrrev_b32_e32 v24, 16, v29                             // 0000000061FC: 20303A90
	v_and_b32_e32 v43, v8, v32                                 // 000000006200: 26564108
	v_lshrrev_b32_e32 v32, 16, v32                             // 000000006204: 20404090
	v_and_b32_e32 v44, v8, v19                                 // 000000006208: 26582708
	v_lshrrev_b32_e32 v45, 16, v19                             // 00000000620C: 205A2690
	v_and_or_b32 v19, v25, v9, v42                             // 000000006210: D2010013 04AA1319
	v_lshrrev_b32_e32 v20, 16, v20                             // 000000006218: 20282890
	v_lshrrev_b32_e32 v42, 16, v31                             // 00000000621C: 20543E90
	v_lshrrev_b32_e32 v30, 16, v30                             // 000000006220: 203C3C90
	v_mfma_f32_32x32x4f16 a[96:127], v[61:62], v[69:70], a[96:127] cbsz:1 abid:1// 000000006224: D3C80960 05828B3D
	s_waitcnt lgkmcnt(1)                                       // 00000000622C: BF8CC17F
	v_mfma_f32_32x32x4f16 a[32:63], v[61:62], v[85:86], a[32:63] cbsz:1// 000000006230: D3C80120 0482AB3D
	v_mfma_f32_32x32x4f16 a[0:31], v[61:62], v[85:86], a[0:31] cbsz:1 abid:1// 000000006238: D3C80900 0402AB3D
	v_mfma_f32_32x32x4f16 a[64:95], v[61:62], v[69:70], a[64:95] cbsz:1// 000000006240: D3C80140 05028B3D
	v_lshl_or_b32 v25, v27, 16, v44                            // 000000006248: D2000019 04B1211B
	v_and_or_b32 v31, v28, v9, v20                             // 000000006250: D201001F 0452131C
	v_lshl_or_b32 v29, v28, 16, v46                            // 000000006258: D200001D 04B9211C
	s_waitcnt vmcnt(1)                                         // 000000006260: BF8C0F71
	v_lshl_or_b32 v18, v33, 16, v22                            // 000000006264: D2000012 04592121
	v_and_or_b32 v20, v33, v9, v24                             // 00000000626C: D2010014 04621321
	v_and_or_b32 v24, v34, v9, v30                             // 000000006274: D2010018 047A1322
	v_and_or_b32 v27, v27, v9, v45                             // 00000000627C: D201001B 04B6131B
	v_lshl_or_b32 v22, v34, 16, v41                            // 000000006284: D2000016 04A52122
	v_lshl_or_b32 v26, v35, 16, v26                            // 00000000628C: D200001A 04692123
	v_and_or_b32 v28, v35, v9, v42                             // 000000006294: D201001C 04AA1323
	v_lshl_or_b32 v30, v36, 16, v43                            // 00000000629C: D200001E 04AD2124
	v_and_or_b32 v32, v36, v9, v32                             // 0000000062A4: D2010020 04821324
	v_mfma_f32_32x32x4f16 a[96:127], v[63:64], v[71:72], a[96:127] cbsz:1 abid:1// 0000000062AC: D3C80960 05828F3F
	v_mfma_f32_32x32x4f16 a[32:63], v[63:64], v[87:88], a[32:63] cbsz:1// 0000000062B4: D3C80120 0482AF3F
	v_mfma_f32_32x32x4f16 a[0:31], v[63:64], v[87:88], a[0:31] cbsz:1 abid:1// 0000000062BC: D3C80900 0402AF3F
	v_mfma_f32_32x32x4f16 a[64:95], v[63:64], v[71:72], a[64:95] cbsz:1// 0000000062C4: D3C80140 05028F3F
	s_waitcnt vmcnt(0)                                         // 0000000062CC: BF8C0F70
	ds_write_b128 v13, v[37:40] offset:2048                    // 0000000062D0: D9BE0800 0000250D
	ds_write2_b64 v10, v[17:18], v[19:20] offset1:2            // 0000000062D8: D89C0200 0013110A
	ds_write2_b64 v10, v[21:22], v[23:24] offset0:4 offset1:6  // 0000000062E0: D89C0604 0017150A
	ds_write2_b64 v10, v[25:26], v[27:28] offset0:8 offset1:10 // 0000000062E8: D89C0A08 001B190A
	ds_write2_b64 v10, v[29:30], v[31:32] offset0:12 offset1:14// 0000000062F0: D89C0E0C 001F1D0A
	s_cbranch_scc0 BB77_1                                      // 0000000062F8: BF84FED7
	s_waitcnt lgkmcnt(0)                                       // 0000000062FC: BF8CC07F
	s_barrier                                                  // 000000006300: BF8A0000
	ds_read_b128 v[8:11], v7                                   // 000000006304: D9FE0000 08000007
	ds_read_b128 v[12:15], v7 offset:4096                      // 00000000630C: D9FE1000 0C000007
	ds_read_b128 v[16:19], v6                                  // 000000006314: D9FE0000 10000006
	ds_read_b128 v[20:23], v6 offset:2048                      // 00000000631C: D9FE0800 14000006
	ds_read_b128 v[24:27], v5                                  // 000000006324: D9FE0000 18000005
	ds_read_b128 v[28:31], v5 offset:2048                      // 00000000632C: D9FE0800 1C000005
	v_and_or_b32 v81, v0, 31, s18                              // 000000006334: D2010051 00493F00
	v_lshrrev_b32_e32 v2, 3, v0                                // 00000000633C: 20040083
	s_waitcnt lgkmcnt(3)                                       // 000000006340: BF8CC37F
	v_mfma_f32_32x32x4f16 a[64:95], v[8:9], v[16:17], a[64:95] cbsz:1// 000000006344: D3C80140 05022108
	v_mfma_f32_32x32x4f16 a[96:127], v[8:9], v[16:17], a[96:127] cbsz:1 abid:1// 00000000634C: D3C80960 05822108
	s_mov_b32 s5, 0x5397829d                                   // 000000006354: BE8500FF 5397829D
	s_mov_b32 s19, 0x27000                                     // 00000000635C: BE9300FF 00027000
	s_mov_b32 s18, -1                                          // 000000006364: BE9200C1
	s_movk_i32 s6, 0xff3c                                      // 000000006368: B006FF3C
	s_mov_b32 s4, 0x92492493                                   // 00000000636C: BE8400FF 92492493
	s_movk_i32 s7, 0x3800                                      // 000000006374: B0073800
	s_mov_b32 s8, 0x31000                                      // 000000006378: BE8800FF 00031000
	s_waitcnt lgkmcnt(1)                                       // 000000006380: BF8CC17F
	v_mfma_f32_32x32x4f16 a[32:63], v[8:9], v[24:25], a[32:63] cbsz:1// 000000006384: D3C80120 04823108
	v_mfma_f32_32x32x4f16 a[0:31], v[8:9], v[24:25], a[0:31] cbsz:1 abid:1// 00000000638C: D3C80900 04023108
	v_mul_hi_i32 v0, v81, s5                                   // 000000006394: D2870000 00000B51
	v_or_b32_e32 v34, 32, v81                                  // 00000000639C: 2844A2A0
	v_mul_hi_i32 v36, v34, s5                                  // 0000000063A0: D2870024 00000B22
	v_mfma_f32_32x32x4f16 a[64:95], v[10:11], v[18:19], a[64:95] cbsz:1// 0000000063A8: D3C80140 0502250A
	v_mfma_f32_32x32x4f16 a[96:127], v[10:11], v[18:19], a[96:127] cbsz:1 abid:1// 0000000063B0: D3C80960 0582250A
	v_lshrrev_b32_e32 v38, 31, v36                             // 0000000063B8: 204C489F
	v_mfma_f32_32x32x4f16 a[32:63], v[10:11], v[26:27], a[32:63] cbsz:1// 0000000063BC: D3C80120 0482350A
	v_mfma_f32_32x32x4f16 a[0:31], v[10:11], v[26:27], a[0:31] cbsz:1 abid:1// 0000000063C4: D3C80900 0402350A
	v_mfma_f32_32x32x4f16 a[64:95], v[12:13], v[20:21], a[64:95] cbsz:1// 0000000063CC: D3C80140 0502290C
	v_mfma_f32_32x32x4f16 a[96:127], v[12:13], v[20:21], a[96:127] cbsz:1 abid:1// 0000000063D4: D3C80960 0582290C
	s_waitcnt lgkmcnt(0)                                       // 0000000063DC: BF8CC07F
	v_mfma_f32_32x32x4f16 a[32:63], v[12:13], v[28:29], a[32:63] cbsz:1// 0000000063E0: D3C80120 0482390C
	v_mfma_f32_32x32x4f16 a[0:31], v[12:13], v[28:29], a[0:31] cbsz:1 abid:1// 0000000063E8: D3C80900 0402390C
	v_mfma_f32_32x32x4f16 a[64:95], v[14:15], v[22:23], a[64:95] cbsz:1// 0000000063F0: D3C80140 05022D0E
	v_mfma_f32_32x32x4f16 a[96:127], v[14:15], v[22:23], a[96:127] cbsz:1 abid:1// 0000000063F8: D3C80960 05822D0E
	ds_read_b128 v[8:11], v7 offset:8192                       // 000000006400: D9FE2000 08000007
	ds_read_b128 v[16:19], v7 offset:12288                     // 000000006408: D9FE3000 10000007
	ds_read_b128 v[20:23], v6 offset:4096                      // 000000006410: D9FE1000 14000006
	ds_read_b128 v[24:27], v6 offset:6144                      // 000000006418: D9FE1800 18000006
	v_lshrrev_b32_e32 v7, 31, v0                               // 000000006420: 200E009F
	v_ashrrev_i32_e32 v0, 6, v0                                // 000000006424: 22000086
	v_add_u32_e32 v0, v0, v7                                   // 000000006428: 68000F00
	v_mul_lo_u32 v7, v0, s6                                    // 00000000642C: D2850007 00000D00
	v_add_u32_e32 v0, s20, v0                                  // 000000006434: 68000014
	v_mfma_f32_32x32x4f16 a[32:63], v[14:15], v[30:31], a[32:63] cbsz:1// 000000006438: D3C80120 04823D0E
	v_mfma_f32_32x32x4f16 a[0:31], v[14:15], v[30:31], a[0:31] cbsz:1 abid:1// 000000006440: D3C80900 04023D0E
	ds_read_b128 v[12:15], v5 offset:4096                      // 000000006448: D9FE1000 0C000005
	ds_read_b128 v[3:6], v5 offset:6144                        // 000000006450: D9FE1800 03000005
	v_add_u32_e32 v7, v7, v81                                  // 000000006458: 680EA307
	s_waitcnt lgkmcnt(3)                                       // 00000000645C: BF8CC37F
	v_mfma_f32_32x32x4f16 a[64:95], v[8:9], v[20:21], a[64:95] cbsz:1// 000000006460: D3C80140 05022908
	v_mfma_f32_32x32x4f16 a[96:127], v[8:9], v[20:21], a[96:127] cbsz:1 abid:1// 000000006468: D3C80960 05822908
	s_waitcnt lgkmcnt(1)                                       // 000000006470: BF8CC17F
	v_mfma_f32_32x32x4f16 a[32:63], v[8:9], v[12:13], a[32:63] cbsz:1// 000000006474: D3C80120 04821908
	v_mfma_f32_32x32x4f16 a[0:31], v[8:9], v[12:13], a[0:31] cbsz:1 abid:1// 00000000647C: D3C80900 04021908
	v_and_or_b32 v12, v2, 4, v1                                // 000000006484: D201000C 04050902
	v_add_u32_e32 v1, s21, v12                                 // 00000000648C: 68021815
	v_ashrrev_i32_e32 v2, 31, v1                               // 000000006490: 2204029F
	v_lshrrev_b32_e32 v2, 29, v2                               // 000000006494: 2004049D
	v_add_u32_e32 v2, v1, v2                                   // 000000006498: 68040501
	v_mfma_f32_32x32x4f16 a[64:95], v[10:11], v[22:23], a[64:95] cbsz:1// 00000000649C: D3C80140 05022D0A
	v_and_b32_e32 v2, -8, v2                                   // 0000000064A4: 260404C8
	v_sub_u32_e32 v1, v1, v2                                   // 0000000064A8: 6A020501
	v_ashrrev_i32_e32 v8, 31, v1                               // 0000000064AC: 2210029F
	v_mul_lo_u32 v9, v0, s8                                    // 0000000064B0: D2850009 00001100
	v_lshrrev_b32_e32 v0, 30, v8                               // 0000000064B8: 2000109E
	v_add_u32_e32 v0, v1, v0                                   // 0000000064BC: 68000101
	v_mul_hi_i32 v1, v7, s4                                    // 0000000064C0: D2870001 00000907
	v_and_b32_e32 v0, -4, v0                                   // 0000000064C8: 260000C4
	v_mfma_f32_32x32x4f16 a[32:63], v[10:11], v[14:15], a[32:63] cbsz:1// 0000000064CC: D3C80120 04821D0A
	v_mfma_f32_32x32x4f16 a[0:31], v[10:11], v[14:15], a[0:31] cbsz:1 abid:1// 0000000064D4: D3C80900 04021D0A
	v_add_u32_e32 v1, v1, v7                                   // 0000000064DC: 68020F01
	v_add_u32_e32 v2, v0, v2                                   // 0000000064E0: 68040500
	v_add_u32_e32 v0, 8, v2                                    // 0000000064E4: 68000488
	v_mfma_f32_32x32x4f16 a[96:127], v[10:11], v[22:23], a[96:127] cbsz:1 abid:1// 0000000064E8: D3C80960 05822D0A
	v_mfma_f32_32x32x4f16 a[64:95], v[16:17], v[24:25], a[64:95] cbsz:1// 0000000064F0: D3C80140 05023110
	s_waitcnt lgkmcnt(0)                                       // 0000000064F8: BF8CC07F
	v_mfma_f32_32x32x4f16 a[32:63], v[16:17], v[3:4], a[32:63] cbsz:1// 0000000064FC: D3C80120 04820710
	v_mfma_f32_32x32x4f16 a[0:31], v[16:17], v[3:4], a[0:31] cbsz:1 abid:1// 000000006504: D3C80900 04020710
	v_lshrrev_b32_e32 v3, 31, v1                               // 00000000650C: 2006029F
	v_ashrrev_i32_e32 v1, 3, v1                                // 000000006510: 22020283
	v_add_u32_e32 v1, v1, v3                                   // 000000006514: 68020701
	v_mul_lo_u32 v3, v1, -14                                   // 000000006518: D2850003 00019D01
	v_mul_lo_u32 v4, v1, s7                                    // 000000006520: D2850004 00000F01
	v_mfma_f32_32x32x4f16 a[64:95], v[18:19], v[26:27], a[64:95] cbsz:1// 000000006528: D3C80140 05023512
	v_add_u32_e32 v1, 16, v2                                   // 000000006530: 68020490
	v_add_lshl_u32 v3, v3, v7, 10                              // 000000006534: D1FE0003 022A0F03
	v_add3_u32 v41, v4, v9, v3                                 // 00000000653C: D1FF0029 040E1304
	v_add_lshl_u32 v80, v41, v2, 1                             // 000000006544: D1FE0050 02060529
	v_add_lshl_u32 v84, v41, v0, 1                             // 00000000654C: D1FE0054 02060129
	v_add_lshl_u32 v53, v41, v1, 1                             // 000000006554: D1FE0035 02060329
	v_mfma_f32_32x32x4f16 a[96:127], v[16:17], v[24:25], a[96:127] cbsz:1 abid:1// 00000000655C: D3C80960 05823110
	v_mfma_f32_32x32x4f16 a[32:63], v[18:19], v[5:6], a[32:63] cbsz:1// 000000006564: D3C80120 04820B12
	v_mfma_f32_32x32x4f16 a[0:31], v[18:19], v[5:6], a[0:31] cbsz:1 abid:1// 00000000656C: D3C80900 04020B12
	s_nop 6                                                    // 000000006574: BF800006
	v_mfma_f32_32x32x4f16 a[96:127], v[18:19], v[26:27], a[96:127] cbsz:1 abid:1// 000000006578: D3C80960 05823512
	s_nop 0                                                    // 000000006580: BF800000
	v_accvgpr_read_b32 v4, a64                                 // 000000006584: D3D80004 08000140
	v_accvgpr_read_b32 v39, a67                                // 00000000658C: D3D80027 08000143
	s_setreg_imm32_b32 hwreg(HW_REG_MODE, 2, 2), 0             // 000000006594: BA000881 00000000
	v_cvt_f16_f32_e32 v4, v4                                   // 00000000659C: 7E081504
	v_accvgpr_read_b32 v6, a66                                 // 0000000065A0: D3D80006 08000142
	v_cvt_f16_f32_e32 v39, v39                                 // 0000000065A8: 7E4E1527
	v_accvgpr_read_b32 v5, a65                                 // 0000000065AC: D3D80005 08000141
	v_cvt_f16_f32_e32 v6, v6                                   // 0000000065B4: 7E0C1506
	v_cvt_f16_f32_e32 v5, v5                                   // 0000000065B8: 7E0A1505
	s_nop 0                                                    // 0000000065BC: BF800000
	s_nop 0                                                    // 0000000065C0: BF800000
	buffer_store_short v4, off, s[0:3], 0 offset:8             // 0000000065C4: E0680008 80000400
	buffer_store_short v39, off, s[0:3], 0 offset:14           // 0000000065CC: E068000E 80002700
	buffer_store_short v6, off, s[0:3], 0 offset:12            // 0000000065D4: E068000C 80000600
	buffer_store_short v5, off, s[0:3], 0 offset:10            // 0000000065DC: E068000A 80000500
	buffer_load_dword v83, off, s[0:3], 0 offset:12            // 0000000065E4: E050000C 80005300
	buffer_load_dword v82, off, s[0:3], 0 offset:8             // 0000000065EC: E0500008 80005200
	v_accvgpr_read_b32 v3, a68                                 // 0000000065F4: D3D80003 08000144
	v_accvgpr_read_b32 v44, a71                                // 0000000065FC: D3D8002C 08000147
	v_cvt_f16_f32_e32 v89, v3                                  // 000000006604: 7EB21503
	v_accvgpr_read_b32 v43, a70                                // 000000006608: D3D8002B 08000146
	v_cvt_f16_f32_e32 v92, v44                                 // 000000006610: 7EB8152C
	v_accvgpr_read_b32 v42, a69                                // 000000006614: D3D8002A 08000145
	v_cvt_f16_f32_e32 v91, v43                                 // 00000000661C: 7EB6152B
	v_cvt_f16_f32_e32 v90, v42                                 // 000000006620: 7EB4152A
	v_accvgpr_read_b32 v85, a72                                // 000000006624: D3D80055 08000148
	v_accvgpr_read_b32 v88, a75                                // 00000000662C: D3D80058 0800014B
	v_accvgpr_read_b32 v86, a73                                // 000000006634: D3D80056 08000149
	v_accvgpr_read_b32 v87, a74                                // 00000000663C: D3D80057 0800014A
	v_accvgpr_read_b32 v40, a76                                // 000000006644: D3D80028 0800014C
	v_accvgpr_read_b32 v46, a78                                // 00000000664C: D3D8002E 0800014E
	v_accvgpr_read_b32 v54, a79                                // 000000006654: D3D80036 0800014F
	v_accvgpr_read_b32 v45, a77                                // 00000000665C: D3D8002D 0800014D
	v_cvt_f16_f32_e32 v40, v40                                 // 000000006664: 7E501528
	v_cvt_f16_f32_e32 v54, v54                                 // 000000006668: 7E6C1536
	v_cvt_f16_f32_e32 v46, v46                                 // 00000000666C: 7E5C152E
	v_cvt_f16_f32_e32 v45, v45                                 // 000000006670: 7E5A152D
	v_ashrrev_i32_e32 v3, 6, v36                               // 000000006674: 22064886
	v_add_u32_e32 v4, v3, v38                                  // 000000006678: 68084D03
	v_mul_lo_u32 v3, v4, s6                                    // 00000000667C: D2850003 00000D04
	v_accvgpr_read_b32 v37, a80                                // 000000006684: D3D80025 08000150
	v_accvgpr_read_b32 v58, a82                                // 00000000668C: D3D8003A 08000152
	v_accvgpr_read_b32 v62, a83                                // 000000006694: D3D8003E 08000153
	v_add_u32_e32 v5, v3, v34                                  // 00000000669C: 680A4503
	v_add_u32_e32 v3, 24, v2                                   // 0000000066A0: 68060498
	v_add_lshl_u32 v43, v41, v3, 1                             // 0000000066A4: D1FE002B 02060729
	v_accvgpr_read_b32 v44, a81                                // 0000000066AC: D3D8002C 08000151
	v_cvt_f16_f32_e32 v37, v37                                 // 0000000066B4: 7E4A1525
	v_cvt_f16_f32_e32 v58, v58                                 // 0000000066B8: 7E74153A
	v_cvt_f16_f32_e32 v44, v44                                 // 0000000066BC: 7E58152C
	v_mul_hi_i32 v6, v5, s4                                    // 0000000066C0: D2870006 00000905
	v_add_u32_e32 v4, s20, v4                                  // 0000000066C8: 68080814
	v_mul_lo_u32 v4, v4, s8                                    // 0000000066CC: D2850004 00001104
	v_accvgpr_read_b32 v35, a84                                // 0000000066D4: D3D80023 08000154
	v_add_u32_e32 v6, v6, v5                                   // 0000000066DC: 680C0B06
	v_lshrrev_b32_e32 v34, 31, v6                              // 0000000066E0: 20440C9F
	v_ashrrev_i32_e32 v6, 3, v6                                // 0000000066E4: 220C0C83
	v_add_u32_e32 v6, v6, v34                                  // 0000000066E8: 680C4506
	v_mul_lo_u32 v34, v6, -14                                  // 0000000066EC: D2850022 00019D06
	v_mul_lo_u32 v6, v6, s7                                    // 0000000066F4: D2850006 00000F06
	v_accvgpr_read_b32 v51, a86                                // 0000000066FC: D3D80033 08000156
	v_accvgpr_read_b32 v61, a87                                // 000000006704: D3D8003D 08000157
	v_add_lshl_u32 v5, v34, v5, 10                             // 00000000670C: D1FE0005 022A0B22
	v_add3_u32 v93, v6, v4, v5                                 // 000000006714: D1FF005D 04160906
	v_add_lshl_u32 v55, v93, v2, 1                             // 00000000671C: D1FE0037 0206055D
	v_accvgpr_read_b32 v48, a85                                // 000000006724: D3D80030 08000155
	v_cvt_f16_f32_e32 v35, v35                                 // 00000000672C: 7E461523
	v_cvt_f16_f32_e32 v48, v48                                 // 000000006730: 7E601530
	v_accvgpr_read_b32 v33, a88                                // 000000006734: D3D80021 08000158
	v_add_lshl_u32 v52, v93, v0, 1                             // 00000000673C: D1FE0034 0206015D
	v_accvgpr_read_b32 v49, a90                                // 000000006744: D3D80031 0800015A
	v_accvgpr_read_b32 v60, a91                                // 00000000674C: D3D8003C 0800015B
	v_accvgpr_read_b32 v47, a89                                // 000000006754: D3D8002F 08000159
	v_cvt_f16_f32_e32 v33, v33                                 // 00000000675C: 7E421521
	v_cvt_f16_f32_e32 v47, v47                                 // 000000006760: 7E5E152F
	v_accvgpr_read_b32 v29, a92                                // 000000006764: D3D8001D 0800015C
	v_accvgpr_read_b32 v56, a93                                // 00000000676C: D3D80038 0800015D
	v_accvgpr_read_b32 v59, a95                                // 000000006774: D3D8003B 0800015F
	v_cvt_f16_f32_e32 v29, v29                                 // 00000000677C: 7E3A151D
	v_add_lshl_u32 v50, v93, v1, 1                             // 000000006780: D1FE0032 0206035D
	v_accvgpr_read_b32 v57, a94                                // 000000006788: D3D80039 0800015E
	v_accvgpr_read_b32 v7, a28                                 // 000000006790: D3D80007 0800011C
	v_accvgpr_read_b32 v8, a24                                 // 000000006798: D3D80008 08000118
	v_accvgpr_read_b32 v64, a98                                // 0000000067A0: D3D80040 08000162
	v_accvgpr_read_b32 v65, a99                                // 0000000067A8: D3D80041 08000163
	v_accvgpr_read_b32 v67, a102                               // 0000000067B0: D3D80043 08000166
	v_accvgpr_read_b32 v68, a103                               // 0000000067B8: D3D80044 08000167
	v_accvgpr_read_b32 v70, a106                               // 0000000067C0: D3D80046 0800016A
	v_accvgpr_read_b32 v71, a107                               // 0000000067C8: D3D80047 0800016B
	v_accvgpr_read_b32 v73, a110                               // 0000000067D0: D3D80049 0800016E
	v_accvgpr_read_b32 v74, a111                               // 0000000067D8: D3D8004A 0800016F
	v_accvgpr_read_b32 v76, a114                               // 0000000067E0: D3D8004C 08000172
	v_accvgpr_read_b32 v77, a115                               // 0000000067E8: D3D8004D 08000173
	v_accvgpr_read_b32 v79, a118                               // 0000000067F0: D3D8004F 08000176
	v_accvgpr_read_b32 v95, a123                               // 0000000067F8: D3D8005F 0800017B
	v_accvgpr_read_b32 v98, a126                               // 000000006800: D3D80062 0800017E
	s_nop 0                                                    // 000000006808: BF800000
	s_waitcnt vmcnt(0)                                         // 00000000680C: BF8C0F70
	s_nop 0                                                    // 000000006810: BF800000
	buffer_store_dwordx2 v[82:83], v80, s[16:19], 0 offen      // 000000006814: E0741000 80045250
	buffer_store_short v89, off, s[0:3], 0 offset:8            // 00000000681C: E0680008 80005900
	buffer_store_short v92, off, s[0:3], 0 offset:14           // 000000006824: E068000E 80005C00
	buffer_store_short v91, off, s[0:3], 0 offset:12           // 00000000682C: E068000C 80005B00
	buffer_store_short v90, off, s[0:3], 0 offset:10           // 000000006834: E068000A 80005A00
	v_or_b32_e32 v83, 64, v81                                  // 00000000683C: 28A6A2C0
	v_or_b32_e32 v81, 0x60, v81                                // 000000006840: 28A2A2FF 00000060
	v_mul_hi_i32 v104, v81, s5                                 // 000000006848: D2870068 00000B51
	v_accvgpr_read_b32 v80, a119                               // 000000006850: D3D80050 08000177
	v_accvgpr_read_b32 v92, a122                               // 000000006858: D3D8005C 0800017A
	v_accvgpr_read_b32 v99, a127                               // 000000006860: D3D80063 0800017F
	v_lshrrev_b32_e32 v108, 31, v104                           // 000000006868: 20D8D09F
	v_ashrrev_i32_e32 v104, 6, v104                            // 00000000686C: 22D0D086
	v_add_u32_e32 v104, v104, v108                             // 000000006870: 68D0D968
	v_mul_lo_u32 v108, v104, s6                                // 000000006874: D285006C 00000D68
	v_add_u32_e32 v104, s20, v104                              // 00000000687C: 68D0D014
	v_mul_lo_u32 v104, v104, s8                                // 000000006880: D2850068 00001168
	v_accvgpr_read_b32 v102, a34                               // 000000006888: D3D80066 08000122
	v_add_u32_e32 v81, v108, v81                               // 000000006890: 68A2A36C
	v_mul_hi_i32 v108, v81, s4                                 // 000000006894: D287006C 00000951
	v_accvgpr_read_b32 v103, a35                               // 00000000689C: D3D80067 08000123
	v_accvgpr_read_b32 v106, a38                               // 0000000068A4: D3D8006A 08000126
	v_accvgpr_read_b32 v107, a39                               // 0000000068AC: D3D8006B 08000127
	v_add_u32_e32 v108, v108, v81                              // 0000000068B4: 68D8A36C
	v_lshrrev_b32_e32 v115, 31, v108                           // 0000000068B8: 20E6D89F
	v_ashrrev_i32_e32 v108, 3, v108                            // 0000000068BC: 22D8D883
	v_add_u32_e32 v108, v108, v115                             // 0000000068C0: 68D8E76C
	v_mul_lo_u32 v115, v108, -14                               // 0000000068C4: D2850073 00019D6C
	v_mul_lo_u32 v108, v108, s7                                // 0000000068CC: D285006C 00000F6C
	v_accvgpr_read_b32 v110, a42                               // 0000000068D4: D3D8006E 0800012A
	v_accvgpr_read_b32 v111, a43                               // 0000000068DC: D3D8006F 0800012B
	v_add_lshl_u32 v81, v115, v81, 10                          // 0000000068E4: D1FE0051 022AA373
	v_add3_u32 v104, v108, v104, v81                           // 0000000068EC: D1FF0068 0546D16C
	v_accvgpr_read_b32 v113, a46                               // 0000000068F4: D3D80071 0800012E
	v_accvgpr_read_b32 v114, a47                               // 0000000068FC: D3D80072 0800012F
	v_accvgpr_read_b32 v117, a50                               // 000000006904: D3D80075 08000132
	v_accvgpr_read_b32 v118, a51                               // 00000000690C: D3D80076 08000133
	v_accvgpr_read_b32 v120, a57                               // 000000006914: D3D80078 08000139
	v_accvgpr_read_b32 v121, a58                               // 00000000691C: D3D80079 0800013A
	v_accvgpr_read_b32 v123, a61                               // 000000006924: D3D8007B 0800013D
	v_accvgpr_read_b32 v124, a63                               // 00000000692C: D3D8007C 0800013F
	v_accvgpr_read_b32 v32, a96                                // 000000006934: D3D80020 08000160
	v_cvt_f16_f32_e32 v32, v32                                 // 00000000693C: 7E401520
	v_add_lshl_u32 v34, v93, v3, 1                             // 000000006940: D1FE0022 0206075D
	v_accvgpr_read_b32 v63, a97                                // 000000006948: D3D8003F 08000161
	v_or_b32_e32 v4, 32, v12                                   // 000000006950: 280818A0
	v_add_u32_e32 v4, s21, v4                                  // 000000006954: 68080815
	v_ashrrev_i32_e32 v5, 31, v4                               // 000000006958: 220A089F
	v_lshrrev_b32_e32 v5, 29, v5                               // 00000000695C: 200A0A9D
	v_add_u32_e32 v5, v4, v5                                   // 000000006960: 680A0B04
	v_and_b32_e32 v5, -8, v5                                   // 000000006964: 260A0AC8
	v_sub_u32_e32 v4, v4, v5                                   // 000000006968: 6A080B04
	v_ashrrev_i32_e32 v6, 31, v4                               // 00000000696C: 220C089F
	v_lshrrev_b32_e32 v6, 30, v6                               // 000000006970: 200C0C9E
	v_accvgpr_read_b32 v31, a100                               // 000000006974: D3D8001F 08000164
	v_add_u32_e32 v4, v4, v6                                   // 00000000697C: 68080D04
	v_and_b32_e32 v4, -4, v4                                   // 000000006980: 260808C4
	v_cvt_f16_f32_e32 v31, v31                                 // 000000006984: 7E3E151F
	v_add_u32_e32 v4, v4, v5                                   // 000000006988: 68080B04
	v_add_lshl_u32 v36, v41, v4, 1                             // 00000000698C: D1FE0024 02060929
	v_accvgpr_read_b32 v66, a101                               // 000000006994: D3D80042 08000165
	v_accvgpr_read_b32 v30, a104                               // 00000000699C: D3D8001E 08000168
	v_cvt_f16_f32_e32 v30, v30                                 // 0000000069A4: 7E3C151E
	v_add_u32_e32 v5, 8, v4                                    // 0000000069A8: 680A0888
	v_add_lshl_u32 v38, v41, v5, 1                             // 0000000069AC: D1FE0026 02060B29
	v_accvgpr_read_b32 v69, a105                               // 0000000069B4: D3D80045 08000169
	v_accvgpr_read_b32 v28, a108                               // 0000000069BC: D3D8001C 0800016C
	v_cvt_f16_f32_e32 v28, v28                                 // 0000000069C4: 7E38151C
	v_add_u32_e32 v6, 16, v4                                   // 0000000069C8: 680C0890
	v_add_lshl_u32 v39, v41, v6, 1                             // 0000000069CC: D1FE0027 02060D29
	v_accvgpr_read_b32 v72, a109                               // 0000000069D4: D3D80048 0800016D
	v_accvgpr_read_b32 v27, a112                               // 0000000069DC: D3D8001B 08000170
	v_cvt_f16_f32_e32 v27, v27                                 // 0000000069E4: 7E36151B
	v_add_u32_e32 v12, 24, v4                                  // 0000000069E8: 68180898
	v_add_lshl_u32 v41, v41, v12, 1                            // 0000000069EC: D1FE0029 02061929
	v_accvgpr_read_b32 v75, a113                               // 0000000069F4: D3D8004B 08000171
	v_accvgpr_read_b32 v25, a116                               // 0000000069FC: D3D80019 08000174
	v_cvt_f16_f32_e32 v25, v25                                 // 000000006A04: 7E321519
	v_add_lshl_u32 v42, v93, v4, 1                             // 000000006A08: D1FE002A 0206095D
	v_accvgpr_read_b32 v78, a117                               // 000000006A10: D3D8004E 08000175
	v_accvgpr_read_b32 v23, a120                               // 000000006A18: D3D80017 08000178
	v_cvt_f16_f32_e32 v23, v23                                 // 000000006A20: 7E2E1517
	v_add_lshl_u32 v90, v93, v5, 1                             // 000000006A24: D1FE005A 02060B5D
	v_accvgpr_read_b32 v91, a121                               // 000000006A2C: D3D8005B 08000179
	v_accvgpr_read_b32 v21, a124                               // 000000006A34: D3D80015 0800017C
	v_cvt_f16_f32_e32 v21, v21                                 // 000000006A3C: 7E2A1515
	v_add_lshl_u32 v96, v93, v6, 1                             // 000000006A40: D1FE0060 02060D5D
	v_accvgpr_read_b32 v97, a125                               // 000000006A48: D3D80061 0800017D
	v_accvgpr_read_b32 v26, a32                                // 000000006A50: D3D8001A 08000120
	v_cvt_f16_f32_e32 v26, v26                                 // 000000006A58: 7E34151A
	v_add_lshl_u32 v93, v93, v12, 1                            // 000000006A5C: D1FE005D 0206195D
	v_accvgpr_read_b32 v101, a33                               // 000000006A64: D3D80065 08000121
	v_mul_hi_i32 v89, v83, s5                                  // 000000006A6C: D2870059 00000B53
	v_accvgpr_read_b32 v24, a36                                // 000000006A74: D3D80018 08000124
	v_cvt_f16_f32_e32 v24, v24                                 // 000000006A7C: 7E301518
	v_accvgpr_read_b32 v105, a37                               // 000000006A80: D3D80069 08000125
	v_lshrrev_b32_e32 v94, 31, v89                             // 000000006A88: 20BCB29F
	v_ashrrev_i32_e32 v89, 6, v89                              // 000000006A8C: 22B2B286
	v_add_u32_e32 v89, v89, v94                                // 000000006A90: 68B2BD59
	v_mul_lo_u32 v94, v89, s6                                  // 000000006A94: D285005E 00000D59
	v_add_u32_e32 v89, s20, v89                                // 000000006A9C: 68B2B214
	v_mul_lo_u32 v89, v89, s8                                  // 000000006AA0: D2850059 00001159
	v_accvgpr_read_b32 v22, a40                                // 000000006AA8: D3D80016 08000128
	v_add_u32_e32 v83, v94, v83                                // 000000006AB0: 68A6A75E
	v_mul_hi_i32 v94, v83, s4                                  // 000000006AB4: D287005E 00000953
	v_cvt_f16_f32_e32 v22, v22                                 // 000000006ABC: 7E2C1516
	v_accvgpr_read_b32 v109, a41                               // 000000006AC0: D3D8006D 08000129
	v_accvgpr_read_b32 v20, a44                                // 000000006AC8: D3D80014 0800012C
	v_add_u32_e32 v94, v94, v83                                // 000000006AD0: 68BCA75E
	v_lshrrev_b32_e32 v100, 31, v94                            // 000000006AD4: 20C8BC9F
	v_ashrrev_i32_e32 v94, 3, v94                              // 000000006AD8: 22BCBC83
	v_add_u32_e32 v94, v94, v100                               // 000000006ADC: 68BCC95E
	v_mul_lo_u32 v100, v94, -14                                // 000000006AE0: D2850064 00019D5E
	v_mul_lo_u32 v94, v94, s7                                  // 000000006AE8: D285005E 00000F5E
	v_cvt_f16_f32_e32 v20, v20                                 // 000000006AF0: 7E281514
	v_accvgpr_read_b32 v112, a45                               // 000000006AF4: D3D80070 0800012D
	v_accvgpr_read_b32 v19, a48                                // 000000006AFC: D3D80013 08000130
	v_cvt_f16_f32_e32 v19, v19                                 // 000000006B04: 7E261513
	v_accvgpr_read_b32 v116, a49                               // 000000006B08: D3D80074 08000131
	v_accvgpr_read_b32 v17, a52                                // 000000006B10: D3D80011 08000134
	v_accvgpr_read_b32 v119, a55                               // 000000006B18: D3D80077 08000137
	v_cvt_f16_f32_e32 v17, v17                                 // 000000006B20: 7E221511
	v_accvgpr_read_b32 v115, a54                               // 000000006B24: D3D80073 08000136
	v_accvgpr_read_b32 v108, a53                               // 000000006B2C: D3D8006C 08000135
	v_cvt_f16_f32_e32 v115, v115                               // 000000006B34: 7EE61573
	v_cvt_f16_f32_e32 v108, v108                               // 000000006B38: 7ED8156C
	v_accvgpr_read_b32 v15, a56                                // 000000006B3C: D3D8000F 08000138
	v_accvgpr_read_b32 v122, a59                               // 000000006B44: D3D8007A 0800013B
	v_cvt_f16_f32_e32 v15, v15                                 // 000000006B4C: 7E1E150F
	v_accvgpr_read_b32 v13, a60                                // 000000006B50: D3D8000D 0800013C
	v_cvt_f16_f32_e32 v13, v13                                 // 000000006B58: 7E1A150D
	v_accvgpr_read_b32 v18, a0                                 // 000000006B5C: D3D80012 08000100
	v_cvt_f16_f32_e32 v18, v18                                 // 000000006B64: 7E241512
	v_accvgpr_read_b32 v125, a1                                // 000000006B68: D3D8007D 08000101
	v_accvgpr_read_b32 v16, a4                                 // 000000006B70: D3D80010 08000104
	v_cvt_f16_f32_e32 v16, v16                                 // 000000006B78: 7E201510
	v_accvgpr_read_b32 v14, a8                                 // 000000006B7C: D3D8000E 08000108
	v_cvt_f16_f32_e32 v14, v14                                 // 000000006B84: 7E1C150E
	v_accvgpr_read_b32 v11, a12                                // 000000006B88: D3D8000B 0800010C
	v_cvt_f16_f32_e32 v11, v11                                 // 000000006B90: 7E16150B
	v_accvgpr_read_b32 v10, a16                                // 000000006B94: D3D8000A 08000110
	v_cvt_f16_f32_e32 v10, v10                                 // 000000006B9C: 7E14150A
	v_accvgpr_read_b32 v9, a20                                 // 000000006BA0: D3D80009 08000114
	v_cvt_f16_f32_e32 v9, v9                                   // 000000006BA8: 7E121509
	s_nop 0                                                    // 000000006BAC: BF800000
	s_nop 0                                                    // 000000006BB0: BF800000
	buffer_load_dword v82, off, s[0:3], 0 offset:12            // 000000006BB4: E050000C 80005200
	buffer_load_dword v81, off, s[0:3], 0 offset:8             // 000000006BBC: E0500008 80005100
	s_nop 0                                                    // 000000006BC4: BF800000
	s_waitcnt vmcnt(0)                                         // 000000006BC8: BF8C0F70
	s_nop 0                                                    // 000000006BCC: BF800000
	buffer_store_dwordx2 v[81:82], v84, s[16:19], 0 offen      // 000000006BD0: E0741000 80045154
	v_cvt_f16_f32_e32 v81, v85                                 // 000000006BD8: 7EA21555
	v_cvt_f16_f32_e32 v85, v88                                 // 000000006BDC: 7EAA1558
	v_cvt_f16_f32_e32 v82, v86                                 // 000000006BE0: 7EA41556
	v_cvt_f16_f32_e32 v86, v87                                 // 000000006BE4: 7EAC1557
	v_accvgpr_read_b32 v84, a62                                // 000000006BE8: D3D80054 0800013E
	v_cvt_f16_f32_e32 v84, v84                                 // 000000006BF0: 7EA81554
	v_accvgpr_read_b32 v87, a2                                 // 000000006BF4: D3D80057 08000102
	v_cvt_f16_f32_e32 v87, v87                                 // 000000006BFC: 7EAE1557
	v_accvgpr_read_b32 v88, a19                                // 000000006C00: D3D80058 08000113
	v_cvt_f16_f32_e32 v88, v88                                 // 000000006C08: 7EB01558
	s_nop 0                                                    // 000000006C0C: BF800000
	s_nop 0                                                    // 000000006C10: BF800000
	buffer_store_short v81, off, s[0:3], 0 offset:8            // 000000006C14: E0680008 80005100
	buffer_store_short v85, off, s[0:3], 0 offset:14           // 000000006C1C: E068000E 80005500
	buffer_store_short v86, off, s[0:3], 0 offset:12           // 000000006C24: E068000C 80005600
	buffer_store_short v82, off, s[0:3], 0 offset:10           // 000000006C2C: E068000A 80005200
	buffer_load_dword v82, off, s[0:3], 0 offset:12            // 000000006C34: E050000C 80005200
	v_accvgpr_read_b32 v86, a13                                // 000000006C3C: D3D80056 0800010D
	v_cvt_f16_f32_e32 v86, v86                                 // 000000006C44: 7EAC1556
	v_add_lshl_u32 v85, v104, v12, 1                           // 000000006C48: D1FE0055 02061968
	s_nop 0                                                    // 000000006C50: BF800000
	s_nop 0                                                    // 000000006C54: BF800000
	buffer_load_dword v81, off, s[0:3], 0 offset:8             // 000000006C58: E0500008 80005100
	s_nop 0                                                    // 000000006C60: BF800000
	s_waitcnt vmcnt(0)                                         // 000000006C64: BF8C0F70
	s_nop 0                                                    // 000000006C68: BF800000
	buffer_store_dwordx2 v[81:82], v53, s[16:19], 0 offen      // 000000006C6C: E0741000 80045135
	buffer_store_short v40, off, s[0:3], 0 offset:8            // 000000006C74: E0680008 80002800
	buffer_store_short v54, off, s[0:3], 0 offset:14           // 000000006C7C: E068000E 80003600
	buffer_store_short v46, off, s[0:3], 0 offset:12           // 000000006C84: E068000C 80002E00
	buffer_store_short v45, off, s[0:3], 0 offset:10           // 000000006C8C: E068000A 80002D00
	buffer_load_dword v46, off, s[0:3], 0 offset:12            // 000000006C94: E050000C 80002E00
	s_nop 0                                                    // 000000006C9C: BF800000
	s_nop 0                                                    // 000000006CA0: BF800000
	buffer_load_dword v45, off, s[0:3], 0 offset:8             // 000000006CA4: E0500008 80002D00
	v_accvgpr_read_b32 v53, a3                                 // 000000006CAC: D3D80035 08000103
	v_cvt_f16_f32_e32 v53, v53                                 // 000000006CB4: 7E6A1535
	v_accvgpr_read_b32 v40, a7                                 // 000000006CB8: D3D80028 08000107
	v_accvgpr_read_b32 v82, a6                                 // 000000006CC0: D3D80052 08000106
	v_cvt_f16_f32_e32 v40, v40                                 // 000000006CC8: 7E501528
	v_accvgpr_read_b32 v81, a5                                 // 000000006CCC: D3D80051 08000105
	v_cvt_f16_f32_e32 v82, v82                                 // 000000006CD4: 7EA41552
	v_cvt_f16_f32_e32 v81, v81                                 // 000000006CD8: 7EA21551
	v_accvgpr_read_b32 v54, a9                                 // 000000006CDC: D3D80036 08000109
	v_cvt_f16_f32_e32 v54, v54                                 // 000000006CE4: 7E6C1536
	s_nop 0                                                    // 000000006CE8: BF800000
	s_waitcnt vmcnt(0)                                         // 000000006CEC: BF8C0F70
	s_nop 0                                                    // 000000006CF0: BF800000
	buffer_store_dwordx2 v[45:46], v43, s[16:19], 0 offen      // 000000006CF4: E0741000 80042D2B
	v_cvt_f16_f32_e32 v43, v62                                 // 000000006CFC: 7E56153E
	v_accvgpr_read_b32 v46, a11                                // 000000006D00: D3D8002E 0800010B
	v_accvgpr_read_b32 v45, a10                                // 000000006D08: D3D8002D 0800010A
	v_cvt_f16_f32_e32 v46, v46                                 // 000000006D10: 7E5C152E
	v_cvt_f16_f32_e32 v45, v45                                 // 000000006D14: 7E5A152D
	v_accvgpr_read_b32 v62, a15                                // 000000006D18: D3D8003E 0800010F
	v_cvt_f16_f32_e32 v62, v62                                 // 000000006D20: 7E7C153E
	s_nop 0                                                    // 000000006D24: BF800000
	s_nop 0                                                    // 000000006D28: BF800000
	buffer_store_short v37, off, s[0:3], 0 offset:8            // 000000006D2C: E0680008 80002500
	buffer_store_short v43, off, s[0:3], 0 offset:14           // 000000006D34: E068000E 80002B00
	buffer_store_short v58, off, s[0:3], 0 offset:12           // 000000006D3C: E068000C 80003A00
	buffer_store_short v44, off, s[0:3], 0 offset:10           // 000000006D44: E068000A 80002C00
	buffer_load_dword v44, off, s[0:3], 0 offset:12            // 000000006D4C: E050000C 80002C00
	s_nop 0                                                    // 000000006D54: BF800000
	s_nop 0                                                    // 000000006D58: BF800000
	buffer_load_dword v43, off, s[0:3], 0 offset:8             // 000000006D5C: E0500008 80002B00
	v_accvgpr_read_b32 v37, a14                                // 000000006D64: D3D80025 0800010E
	v_cvt_f16_f32_e32 v37, v37                                 // 000000006D6C: 7E4A1525
	v_accvgpr_read_b32 v58, a18                                // 000000006D70: D3D8003A 08000112
	v_cvt_f16_f32_e32 v58, v58                                 // 000000006D78: 7E74153A
	s_nop 0                                                    // 000000006D7C: BF800000
	s_waitcnt vmcnt(0)                                         // 000000006D80: BF8C0F70
	s_nop 0                                                    // 000000006D84: BF800000
	buffer_store_dwordx2 v[43:44], v55, s[16:19], 0 offen      // 000000006D88: E0741000 80042B37
	v_cvt_f16_f32_e32 v43, v61                                 // 000000006D90: 7E56153D
	v_cvt_f16_f32_e32 v44, v51                                 // 000000006D94: 7E581533
	v_accvgpr_read_b32 v55, a17                                // 000000006D98: D3D80037 08000111
	v_cvt_f16_f32_e32 v55, v55                                 // 000000006DA0: 7E6E1537
	v_accvgpr_read_b32 v51, a22                                // 000000006DA4: D3D80033 08000116
	v_cvt_f16_f32_e32 v51, v51                                 // 000000006DAC: 7E661533
	v_accvgpr_read_b32 v61, a26                                // 000000006DB0: D3D8003D 0800011A
	v_cvt_f16_f32_e32 v61, v61                                 // 000000006DB8: 7E7A153D
	s_nop 0                                                    // 000000006DBC: BF800000
	s_nop 0                                                    // 000000006DC0: BF800000
	buffer_store_short v35, off, s[0:3], 0 offset:8            // 000000006DC4: E0680008 80002300
	buffer_store_short v43, off, s[0:3], 0 offset:14           // 000000006DCC: E068000E 80002B00
	buffer_store_short v44, off, s[0:3], 0 offset:12           // 000000006DD4: E068000C 80002C00
	buffer_store_short v48, off, s[0:3], 0 offset:10           // 000000006DDC: E068000A 80003000
	buffer_load_dword v44, off, s[0:3], 0 offset:12            // 000000006DE4: E050000C 80002C00
	s_nop 0                                                    // 000000006DEC: BF800000
	s_nop 0                                                    // 000000006DF0: BF800000
	buffer_load_dword v43, off, s[0:3], 0 offset:8             // 000000006DF4: E0500008 80002B00
	v_accvgpr_read_b32 v48, a23                                // 000000006DFC: D3D80030 08000117
	v_cvt_f16_f32_e32 v48, v48                                 // 000000006E04: 7E601530
	v_accvgpr_read_b32 v35, a21                                // 000000006E08: D3D80023 08000115
	v_cvt_f16_f32_e32 v35, v35                                 // 000000006E10: 7E461523
	s_nop 0                                                    // 000000006E14: BF800000
	s_waitcnt vmcnt(0)                                         // 000000006E18: BF8C0F70
	s_nop 0                                                    // 000000006E1C: BF800000
	buffer_store_dwordx2 v[43:44], v52, s[16:19], 0 offen      // 000000006E20: E0741000 80042B34
	v_cvt_f16_f32_e32 v43, v60                                 // 000000006E28: 7E56153C
	v_cvt_f16_f32_e32 v44, v49                                 // 000000006E2C: 7E581531
	v_cvt_f16_f32_e32 v60, v65                                 // 000000006E30: 7E781541
	v_cvt_f16_f32_e32 v65, v68                                 // 000000006E34: 7E821544
	v_cvt_f16_f32_e32 v68, v71                                 // 000000006E38: 7E881547
	v_cvt_f16_f32_e32 v71, v74                                 // 000000006E3C: 7E8E154A
	v_cvt_f16_f32_e32 v74, v77                                 // 000000006E40: 7E94154D
	v_cvt_f16_f32_e32 v77, v80                                 // 000000006E44: 7E9A1550
	v_cvt_f16_f32_e32 v80, v95                                 // 000000006E48: 7EA0155F
	v_cvt_f16_f32_e32 v95, v99                                 // 000000006E4C: 7EBE1563
	v_cvt_f16_f32_e32 v99, v103                                // 000000006E50: 7EC61567
	v_cvt_f16_f32_e32 v103, v107                               // 000000006E54: 7ECE156B
	v_cvt_f16_f32_e32 v107, v111                               // 000000006E58: 7ED6156F
	v_cvt_f16_f32_e32 v111, v114                               // 000000006E5C: 7EDE1572
	v_cvt_f16_f32_e32 v114, v118                               // 000000006E60: 7EE41576
	v_cvt_f16_f32_e32 v118, v121                               // 000000006E64: 7EEC1579
	v_cvt_f16_f32_e32 v121, v124                               // 000000006E68: 7EF2157C
	v_cvt_f16_f32_e32 v124, v7                                 // 000000006E6C: 7EF81507
	v_accvgpr_read_b32 v52, a25                                // 000000006E70: D3D80034 08000119
	v_cvt_f16_f32_e32 v52, v52                                 // 000000006E78: 7E681534
	v_accvgpr_read_b32 v49, a29                                // 000000006E7C: D3D80031 0800011D
	v_cvt_f16_f32_e32 v49, v49                                 // 000000006E84: 7E621531
	s_nop 0                                                    // 000000006E88: BF800000
	s_nop 0                                                    // 000000006E8C: BF800000
	buffer_store_short v33, off, s[0:3], 0 offset:8            // 000000006E90: E0680008 80002100
	buffer_store_short v43, off, s[0:3], 0 offset:14           // 000000006E98: E068000E 80002B00
	buffer_store_short v44, off, s[0:3], 0 offset:12           // 000000006EA0: E068000C 80002C00
	buffer_store_short v47, off, s[0:3], 0 offset:10           // 000000006EA8: E068000A 80002F00
	buffer_load_dword v44, off, s[0:3], 0 offset:12            // 000000006EB0: E050000C 80002C00
	s_nop 0                                                    // 000000006EB8: BF800000
	s_nop 0                                                    // 000000006EBC: BF800000
	buffer_load_dword v43, off, s[0:3], 0 offset:8             // 000000006EC0: E0500008 80002B00
	v_cvt_f16_f32_e32 v47, v56                                 // 000000006EC8: 7E5E1538
	v_cvt_f16_f32_e32 v56, v59                                 // 000000006ECC: 7E70153B
	v_cvt_f16_f32_e32 v59, v64                                 // 000000006ED0: 7E761540
	v_cvt_f16_f32_e32 v64, v67                                 // 000000006ED4: 7E801543
	v_cvt_f16_f32_e32 v67, v70                                 // 000000006ED8: 7E861546
	v_cvt_f16_f32_e32 v70, v73                                 // 000000006EDC: 7E8C1549
	v_cvt_f16_f32_e32 v73, v76                                 // 000000006EE0: 7E92154C
	v_cvt_f16_f32_e32 v76, v79                                 // 000000006EE4: 7E98154F
	v_cvt_f16_f32_e32 v79, v92                                 // 000000006EE8: 7E9E155C
	v_cvt_f16_f32_e32 v92, v98                                 // 000000006EEC: 7EB81562
	v_cvt_f16_f32_e32 v98, v102                                // 000000006EF0: 7EC41566
	v_cvt_f16_f32_e32 v102, v106                               // 000000006EF4: 7ECC156A
	v_cvt_f16_f32_e32 v106, v110                               // 000000006EF8: 7ED4156E
	v_cvt_f16_f32_e32 v110, v113                               // 000000006EFC: 7EDC1571
	v_cvt_f16_f32_e32 v113, v117                               // 000000006F00: 7EE21575
	v_cvt_f16_f32_e32 v117, v120                               // 000000006F04: 7EEA1578
	v_cvt_f16_f32_e32 v120, v123                               // 000000006F08: 7EF0157B
	v_cvt_f16_f32_e32 v123, v8                                 // 000000006F0C: 7EF61508
	v_accvgpr_read_b32 v33, a27                                // 000000006F10: D3D80021 0800011B
	v_cvt_f16_f32_e32 v33, v33                                 // 000000006F18: 7E421521
	s_nop 0                                                    // 000000006F1C: BF800000
	s_waitcnt vmcnt(0)                                         // 000000006F20: BF8C0F70
	s_nop 0                                                    // 000000006F24: BF800000
	buffer_store_dwordx2 v[43:44], v50, s[16:19], 0 offen      // 000000006F28: E0741000 80042B32
	v_cvt_f16_f32_e32 v50, v57                                 // 000000006F30: 7E641539
	v_cvt_f16_f32_e32 v57, v63                                 // 000000006F34: 7E72153F
	s_nop 0                                                    // 000000006F38: BF800000
	s_nop 0                                                    // 000000006F3C: BF800000
	buffer_store_short v29, off, s[0:3], 0 offset:8            // 000000006F40: E0680008 80001D00
	buffer_store_short v56, off, s[0:3], 0 offset:14           // 000000006F48: E068000E 80003800
	buffer_store_short v50, off, s[0:3], 0 offset:12           // 000000006F50: E068000C 80003200
	buffer_store_short v47, off, s[0:3], 0 offset:10           // 000000006F58: E068000A 80002F00
	buffer_load_dword v8, off, s[0:3], 0 offset:12             // 000000006F60: E050000C 80000800
	buffer_load_dword v7, off, s[0:3], 0 offset:8              // 000000006F68: E0500008 80000700
	v_cvt_f16_f32_e32 v63, v66                                 // 000000006F70: 7E7E1542
	v_cvt_f16_f32_e32 v66, v69                                 // 000000006F74: 7E841545
	v_cvt_f16_f32_e32 v69, v72                                 // 000000006F78: 7E8A1548
	v_cvt_f16_f32_e32 v72, v75                                 // 000000006F7C: 7E90154B
	v_cvt_f16_f32_e32 v75, v78                                 // 000000006F80: 7E96154E
	v_cvt_f16_f32_e32 v78, v91                                 // 000000006F84: 7E9C155B
	v_cvt_f16_f32_e32 v91, v97                                 // 000000006F88: 7EB61561
	v_cvt_f16_f32_e32 v97, v101                                // 000000006F8C: 7EC21565
	v_cvt_f16_f32_e32 v101, v105                               // 000000006F90: 7ECA1569
	v_cvt_f16_f32_e32 v105, v109                               // 000000006F94: 7ED2156D
	v_cvt_f16_f32_e32 v109, v112                               // 000000006F98: 7EDA1570
	v_cvt_f16_f32_e32 v112, v116                               // 000000006F9C: 7EE01574
	v_cvt_f16_f32_e32 v116, v119                               // 000000006FA0: 7EE81577
	v_cvt_f16_f32_e32 v119, v122                               // 000000006FA4: 7EEE157A
	v_cvt_f16_f32_e32 v122, v125                               // 000000006FA8: 7EF4157D
	v_accvgpr_read_b32 v44, a31                                // 000000006FAC: D3D8002C 0800011F
	v_accvgpr_read_b32 v43, a30                                // 000000006FB4: D3D8002B 0800011E
	v_cvt_f16_f32_e32 v44, v44                                 // 000000006FBC: 7E58152C
	v_cvt_f16_f32_e32 v43, v43                                 // 000000006FC0: 7E56152B
	s_nop 0                                                    // 000000006FC4: BF800000
	s_waitcnt vmcnt(0)                                         // 000000006FC8: BF8C0F70
	s_nop 0                                                    // 000000006FCC: BF800000
	buffer_store_dwordx2 v[7:8], v34, s[16:19], 0 offen        // 000000006FD0: E0741000 80040722
	buffer_store_short v32, off, s[0:3], 0 offset:8            // 000000006FD8: E0680008 80002000
	buffer_store_short v60, off, s[0:3], 0 offset:14           // 000000006FE0: E068000E 80003C00
	buffer_store_short v59, off, s[0:3], 0 offset:12           // 000000006FE8: E068000C 80003B00
	buffer_store_short v57, off, s[0:3], 0 offset:10           // 000000006FF0: E068000A 80003900
	buffer_load_dword v8, off, s[0:3], 0 offset:12             // 000000006FF8: E050000C 80000800
	s_nop 0                                                    // 000000007000: BF800000
	s_nop 0                                                    // 000000007004: BF800000
	buffer_load_dword v7, off, s[0:3], 0 offset:8              // 000000007008: E0500008 80000700
	s_nop 0                                                    // 000000007010: BF800000
	s_waitcnt vmcnt(0)                                         // 000000007014: BF8C0F70
	s_nop 0                                                    // 000000007018: BF800000
	buffer_store_dwordx2 v[7:8], v36, s[16:19], 0 offen        // 00000000701C: E0741000 80040724
	buffer_store_short v31, off, s[0:3], 0 offset:8            // 000000007024: E0680008 80001F00
	buffer_store_short v65, off, s[0:3], 0 offset:14           // 00000000702C: E068000E 80004100
	buffer_store_short v64, off, s[0:3], 0 offset:12           // 000000007034: E068000C 80004000
	buffer_store_short v63, off, s[0:3], 0 offset:10           // 00000000703C: E068000A 80003F00
	buffer_load_dword v8, off, s[0:3], 0 offset:12             // 000000007044: E050000C 80000800
	s_nop 0                                                    // 00000000704C: BF800000
	s_nop 0                                                    // 000000007050: BF800000
	buffer_load_dword v7, off, s[0:3], 0 offset:8              // 000000007054: E0500008 80000700
	s_nop 0                                                    // 00000000705C: BF800000
	s_waitcnt vmcnt(0)                                         // 000000007060: BF8C0F70
	s_nop 0                                                    // 000000007064: BF800000
	buffer_store_dwordx2 v[7:8], v38, s[16:19], 0 offen        // 000000007068: E0741000 80040726
	buffer_store_short v30, off, s[0:3], 0 offset:8            // 000000007070: E0680008 80001E00
	buffer_store_short v68, off, s[0:3], 0 offset:14           // 000000007078: E068000E 80004400
	buffer_store_short v67, off, s[0:3], 0 offset:12           // 000000007080: E068000C 80004300
	buffer_store_short v66, off, s[0:3], 0 offset:10           // 000000007088: E068000A 80004200
	buffer_load_dword v8, off, s[0:3], 0 offset:12             // 000000007090: E050000C 80000800
	s_nop 0                                                    // 000000007098: BF800000
	s_nop 0                                                    // 00000000709C: BF800000
	buffer_load_dword v7, off, s[0:3], 0 offset:8              // 0000000070A0: E0500008 80000700
	s_nop 0                                                    // 0000000070A8: BF800000
	s_waitcnt vmcnt(0)                                         // 0000000070AC: BF8C0F70
	s_nop 0                                                    // 0000000070B0: BF800000
	buffer_store_dwordx2 v[7:8], v39, s[16:19], 0 offen        // 0000000070B4: E0741000 80040727
	buffer_store_short v28, off, s[0:3], 0 offset:8            // 0000000070BC: E0680008 80001C00
	buffer_store_short v71, off, s[0:3], 0 offset:14           // 0000000070C4: E068000E 80004700
	buffer_store_short v70, off, s[0:3], 0 offset:12           // 0000000070CC: E068000C 80004600
	buffer_store_short v69, off, s[0:3], 0 offset:10           // 0000000070D4: E068000A 80004500
	buffer_load_dword v8, off, s[0:3], 0 offset:12             // 0000000070DC: E050000C 80000800
	s_nop 0                                                    // 0000000070E4: BF800000
	s_nop 0                                                    // 0000000070E8: BF800000
	buffer_load_dword v7, off, s[0:3], 0 offset:8              // 0000000070EC: E0500008 80000700
	s_nop 0                                                    // 0000000070F4: BF800000
	s_waitcnt vmcnt(0)                                         // 0000000070F8: BF8C0F70
	s_nop 0                                                    // 0000000070FC: BF800000
	buffer_store_dwordx2 v[7:8], v41, s[16:19], 0 offen        // 000000007100: E0741000 80040729
	buffer_store_short v27, off, s[0:3], 0 offset:8            // 000000007108: E0680008 80001B00
	buffer_store_short v74, off, s[0:3], 0 offset:14           // 000000007110: E068000E 80004A00
	buffer_store_short v73, off, s[0:3], 0 offset:12           // 000000007118: E068000C 80004900
	buffer_store_short v72, off, s[0:3], 0 offset:10           // 000000007120: E068000A 80004800
	buffer_load_dword v8, off, s[0:3], 0 offset:12             // 000000007128: E050000C 80000800
	s_nop 0                                                    // 000000007130: BF800000
	s_nop 0                                                    // 000000007134: BF800000
	buffer_load_dword v7, off, s[0:3], 0 offset:8              // 000000007138: E0500008 80000700
	s_nop 0                                                    // 000000007140: BF800000
	s_waitcnt vmcnt(0)                                         // 000000007144: BF8C0F70
	s_nop 0                                                    // 000000007148: BF800000
	buffer_store_dwordx2 v[7:8], v42, s[16:19], 0 offen        // 00000000714C: E0741000 8004072A
	buffer_store_short v25, off, s[0:3], 0 offset:8            // 000000007154: E0680008 80001900
	buffer_store_short v77, off, s[0:3], 0 offset:14           // 00000000715C: E068000E 80004D00
	buffer_store_short v76, off, s[0:3], 0 offset:12           // 000000007164: E068000C 80004C00
	buffer_store_short v75, off, s[0:3], 0 offset:10           // 00000000716C: E068000A 80004B00
	buffer_load_dword v8, off, s[0:3], 0 offset:12             // 000000007174: E050000C 80000800
	s_nop 0                                                    // 00000000717C: BF800000
	s_nop 0                                                    // 000000007180: BF800000
	buffer_load_dword v7, off, s[0:3], 0 offset:8              // 000000007184: E0500008 80000700
	s_nop 0                                                    // 00000000718C: BF800000
	s_waitcnt vmcnt(0)                                         // 000000007190: BF8C0F70
	s_nop 0                                                    // 000000007194: BF800000
	buffer_store_dwordx2 v[7:8], v90, s[16:19], 0 offen        // 000000007198: E0741000 8004075A
	buffer_store_short v23, off, s[0:3], 0 offset:8            // 0000000071A0: E0680008 80001700
	buffer_store_short v80, off, s[0:3], 0 offset:14           // 0000000071A8: E068000E 80005000
	buffer_store_short v79, off, s[0:3], 0 offset:12           // 0000000071B0: E068000C 80004F00
	buffer_store_short v78, off, s[0:3], 0 offset:10           // 0000000071B8: E068000A 80004E00
	buffer_load_dword v8, off, s[0:3], 0 offset:12             // 0000000071C0: E050000C 80000800
	s_nop 0                                                    // 0000000071C8: BF800000
	s_nop 0                                                    // 0000000071CC: BF800000
	buffer_load_dword v7, off, s[0:3], 0 offset:8              // 0000000071D0: E0500008 80000700
	s_nop 0                                                    // 0000000071D8: BF800000
	s_waitcnt vmcnt(0)                                         // 0000000071DC: BF8C0F70
	s_nop 0                                                    // 0000000071E0: BF800000
	buffer_store_dwordx2 v[7:8], v96, s[16:19], 0 offen        // 0000000071E4: E0741000 80040760
	buffer_store_short v21, off, s[0:3], 0 offset:8            // 0000000071EC: E0680008 80001500
	buffer_store_short v95, off, s[0:3], 0 offset:14           // 0000000071F4: E068000E 80005F00
	buffer_store_short v92, off, s[0:3], 0 offset:12           // 0000000071FC: E068000C 80005C00
	buffer_store_short v91, off, s[0:3], 0 offset:10           // 000000007204: E068000A 80005B00
	buffer_load_dword v8, off, s[0:3], 0 offset:12             // 00000000720C: E050000C 80000800
	s_nop 0                                                    // 000000007214: BF800000
	s_nop 0                                                    // 000000007218: BF800000
	buffer_load_dword v7, off, s[0:3], 0 offset:8              // 00000000721C: E0500008 80000700
	v_add_lshl_u32 v21, v100, v83, 10                          // 000000007224: D1FE0015 022AA764
	v_add3_u32 v21, v94, v89, v21                              // 00000000722C: D1FF0015 0456B35E
	v_add_lshl_u32 v23, v21, v2, 1                             // 000000007234: D1FE0017 02060515
	v_add_lshl_u32 v2, v104, v2, 1                             // 00000000723C: D1FE0002 02060568
	s_nop 0                                                    // 000000007244: BF800000
	s_waitcnt vmcnt(0)                                         // 000000007248: BF8C0F70
	s_nop 0                                                    // 00000000724C: BF800000
	buffer_store_dwordx2 v[7:8], v93, s[16:19], 0 offen        // 000000007250: E0741000 8004075D
	buffer_store_short v26, off, s[0:3], 0 offset:8            // 000000007258: E0680008 80001A00
	buffer_store_short v99, off, s[0:3], 0 offset:14           // 000000007260: E068000E 80006300
	buffer_store_short v98, off, s[0:3], 0 offset:12           // 000000007268: E068000C 80006200
	buffer_store_short v97, off, s[0:3], 0 offset:10           // 000000007270: E068000A 80006100
	buffer_load_dword v8, off, s[0:3], 0 offset:12             // 000000007278: E050000C 80000800
	s_nop 0                                                    // 000000007280: BF800000
	s_nop 0                                                    // 000000007284: BF800000
	buffer_load_dword v7, off, s[0:3], 0 offset:8              // 000000007288: E0500008 80000700
	s_nop 0                                                    // 000000007290: BF800000
	s_waitcnt vmcnt(0)                                         // 000000007294: BF8C0F70
	s_nop 0                                                    // 000000007298: BF800000
	buffer_store_dwordx2 v[7:8], v23, s[16:19], 0 offen        // 00000000729C: E0741000 80040717
	buffer_store_short v24, off, s[0:3], 0 offset:8            // 0000000072A4: E0680008 80001800
	buffer_store_short v103, off, s[0:3], 0 offset:14          // 0000000072AC: E068000E 80006700
	buffer_store_short v102, off, s[0:3], 0 offset:12          // 0000000072B4: E068000C 80006600
	buffer_store_short v101, off, s[0:3], 0 offset:10          // 0000000072BC: E068000A 80006500
	buffer_load_dword v8, off, s[0:3], 0 offset:12             // 0000000072C4: E050000C 80000800
	s_nop 0                                                    // 0000000072CC: BF800000
	s_nop 0                                                    // 0000000072D0: BF800000
	buffer_load_dword v7, off, s[0:3], 0 offset:8              // 0000000072D4: E0500008 80000700
	v_add_lshl_u32 v23, v21, v0, 1                             // 0000000072DC: D1FE0017 02060115
	v_add_lshl_u32 v0, v104, v0, 1                             // 0000000072E4: D1FE0000 02060168
	s_nop 0                                                    // 0000000072EC: BF800000
	s_waitcnt vmcnt(0)                                         // 0000000072F0: BF8C0F70
	s_nop 0                                                    // 0000000072F4: BF800000
	buffer_store_dwordx2 v[7:8], v23, s[16:19], 0 offen        // 0000000072F8: E0741000 80040717
	buffer_store_short v22, off, s[0:3], 0 offset:8            // 000000007300: E0680008 80001600
	buffer_store_short v107, off, s[0:3], 0 offset:14          // 000000007308: E068000E 80006B00
	buffer_store_short v106, off, s[0:3], 0 offset:12          // 000000007310: E068000C 80006A00
	buffer_store_short v105, off, s[0:3], 0 offset:10          // 000000007318: E068000A 80006900
	buffer_load_dword v8, off, s[0:3], 0 offset:12             // 000000007320: E050000C 80000800
	s_nop 0                                                    // 000000007328: BF800000
	s_nop 0                                                    // 00000000732C: BF800000
	buffer_load_dword v7, off, s[0:3], 0 offset:8              // 000000007330: E0500008 80000700
	v_add_lshl_u32 v22, v21, v1, 1                             // 000000007338: D1FE0016 02060315
	s_nop 0                                                    // 000000007340: BF800000
	s_waitcnt vmcnt(0)                                         // 000000007344: BF8C0F70
	s_nop 0                                                    // 000000007348: BF800000
	buffer_store_dwordx2 v[7:8], v22, s[16:19], 0 offen        // 00000000734C: E0741000 80040716
	buffer_store_short v20, off, s[0:3], 0 offset:8            // 000000007354: E0680008 80001400
	buffer_store_short v111, off, s[0:3], 0 offset:14          // 00000000735C: E068000E 80006F00
	buffer_store_short v110, off, s[0:3], 0 offset:12          // 000000007364: E068000C 80006E00
	buffer_store_short v109, off, s[0:3], 0 offset:10          // 00000000736C: E068000A 80006D00
	buffer_load_dword v8, off, s[0:3], 0 offset:12             // 000000007374: E050000C 80000800
	s_nop 0                                                    // 00000000737C: BF800000
	s_nop 0                                                    // 000000007380: BF800000
	buffer_load_dword v7, off, s[0:3], 0 offset:8              // 000000007384: E0500008 80000700
	v_add_lshl_u32 v20, v21, v3, 1                             // 00000000738C: D1FE0014 02060715
	s_nop 0                                                    // 000000007394: BF800000
	s_waitcnt vmcnt(0)                                         // 000000007398: BF8C0F70
	s_nop 0                                                    // 00000000739C: BF800000
	buffer_store_dwordx2 v[7:8], v20, s[16:19], 0 offen        // 0000000073A0: E0741000 80040714
	buffer_store_short v19, off, s[0:3], 0 offset:8            // 0000000073A8: E0680008 80001300
	buffer_store_short v114, off, s[0:3], 0 offset:14          // 0000000073B0: E068000E 80007200
	buffer_store_short v113, off, s[0:3], 0 offset:12          // 0000000073B8: E068000C 80007100
	buffer_store_short v112, off, s[0:3], 0 offset:10          // 0000000073C0: E068000A 80007000
	buffer_load_dword v8, off, s[0:3], 0 offset:12             // 0000000073C8: E050000C 80000800
	s_nop 0                                                    // 0000000073D0: BF800000
	s_nop 0                                                    // 0000000073D4: BF800000
	buffer_load_dword v7, off, s[0:3], 0 offset:8              // 0000000073D8: E0500008 80000700
	s_nop 0                                                    // 0000000073E0: BF800000
	s_waitcnt vmcnt(0)                                         // 0000000073E4: BF8C0F70
	s_nop 0                                                    // 0000000073E8: BF800000
	buffer_store_dwordx2 v[7:8], v2, s[16:19], 0 offen         // 0000000073EC: E0741000 80040702
	buffer_store_short v17, off, s[0:3], 0 offset:8            // 0000000073F4: E0680008 80001100
	buffer_store_short v116, off, s[0:3], 0 offset:14          // 0000000073FC: E068000E 80007400
	buffer_store_short v115, off, s[0:3], 0 offset:12          // 000000007404: E068000C 80007300
	buffer_store_short v108, off, s[0:3], 0 offset:10          // 00000000740C: E068000A 80006C00
	buffer_load_dword v8, off, s[0:3], 0 offset:12             // 000000007414: E050000C 80000800
	s_nop 0                                                    // 00000000741C: BF800000
	s_nop 0                                                    // 000000007420: BF800000
	buffer_load_dword v7, off, s[0:3], 0 offset:8              // 000000007424: E0500008 80000700
	v_add_lshl_u32 v2, v104, v3, 1                             // 00000000742C: D1FE0002 02060768
	s_nop 0                                                    // 000000007434: BF800000
	s_waitcnt vmcnt(0)                                         // 000000007438: BF8C0F70
	s_nop 0                                                    // 00000000743C: BF800000
	buffer_store_dwordx2 v[7:8], v0, s[16:19], 0 offen         // 000000007440: E0741000 80040700
	buffer_store_short v15, off, s[0:3], 0 offset:8            // 000000007448: E0680008 80000F00
	buffer_store_short v119, off, s[0:3], 0 offset:14          // 000000007450: E068000E 80007700
	buffer_store_short v118, off, s[0:3], 0 offset:12          // 000000007458: E068000C 80007600
	buffer_store_short v117, off, s[0:3], 0 offset:10          // 000000007460: E068000A 80007500
	buffer_load_dword v8, off, s[0:3], 0 offset:12             // 000000007468: E050000C 80000800
	s_nop 0                                                    // 000000007470: BF800000
	s_nop 0                                                    // 000000007474: BF800000
	buffer_load_dword v7, off, s[0:3], 0 offset:8              // 000000007478: E0500008 80000700
	v_add_lshl_u32 v0, v104, v1, 1                             // 000000007480: D1FE0000 02060368
	s_nop 0                                                    // 000000007488: BF800000
	s_waitcnt vmcnt(0)                                         // 00000000748C: BF8C0F70
	s_nop 0                                                    // 000000007490: BF800000
	buffer_store_dwordx2 v[7:8], v0, s[16:19], 0 offen         // 000000007494: E0741000 80040700
	buffer_store_short v13, off, s[0:3], 0 offset:8            // 00000000749C: E0680008 80000D00
	buffer_store_short v121, off, s[0:3], 0 offset:14          // 0000000074A4: E068000E 80007900
	buffer_store_short v84, off, s[0:3], 0 offset:12           // 0000000074AC: E068000C 80005400
	buffer_store_short v120, off, s[0:3], 0 offset:10          // 0000000074B4: E068000A 80007800
	buffer_load_dword v1, off, s[0:3], 0 offset:12             // 0000000074BC: E050000C 80000100
	s_nop 0                                                    // 0000000074C4: BF800000
	s_nop 0                                                    // 0000000074C8: BF800000
	buffer_load_dword v0, off, s[0:3], 0 offset:8              // 0000000074CC: E0500008 80000000
	s_nop 0                                                    // 0000000074D4: BF800000
	s_waitcnt vmcnt(0)                                         // 0000000074D8: BF8C0F70
	s_nop 0                                                    // 0000000074DC: BF800000
	buffer_store_dwordx2 v[0:1], v2, s[16:19], 0 offen         // 0000000074E0: E0741000 80040002
	buffer_store_short v18, off, s[0:3], 0 offset:8            // 0000000074E8: E0680008 80001200
	buffer_store_short v53, off, s[0:3], 0 offset:14           // 0000000074F0: E068000E 80003500
	buffer_store_short v87, off, s[0:3], 0 offset:12           // 0000000074F8: E068000C 80005700
	buffer_store_short v122, off, s[0:3], 0 offset:10          // 000000007500: E068000A 80007A00
	buffer_load_dword v1, off, s[0:3], 0 offset:12             // 000000007508: E050000C 80000100
	s_nop 0                                                    // 000000007510: BF800000
	s_nop 0                                                    // 000000007514: BF800000
	buffer_load_dword v0, off, s[0:3], 0 offset:8              // 000000007518: E0500008 80000000
	v_add_lshl_u32 v2, v21, v4, 1                              // 000000007520: D1FE0002 02060915
	s_nop 0                                                    // 000000007528: BF800000
	s_waitcnt vmcnt(0)                                         // 00000000752C: BF8C0F70
	s_nop 0                                                    // 000000007530: BF800000
	buffer_store_dwordx2 v[0:1], v2, s[16:19], 0 offen         // 000000007534: E0741000 80040002
	buffer_store_short v16, off, s[0:3], 0 offset:8            // 00000000753C: E0680008 80001000
	buffer_store_short v40, off, s[0:3], 0 offset:14           // 000000007544: E068000E 80002800
	buffer_store_short v82, off, s[0:3], 0 offset:12           // 00000000754C: E068000C 80005200
	buffer_store_short v81, off, s[0:3], 0 offset:10           // 000000007554: E068000A 80005100
	buffer_load_dword v1, off, s[0:3], 0 offset:12             // 00000000755C: E050000C 80000100
	s_nop 0                                                    // 000000007564: BF800000
	s_nop 0                                                    // 000000007568: BF800000
	buffer_load_dword v0, off, s[0:3], 0 offset:8              // 00000000756C: E0500008 80000000
	v_add_lshl_u32 v2, v21, v5, 1                              // 000000007574: D1FE0002 02060B15
	s_nop 0                                                    // 00000000757C: BF800000
	s_waitcnt vmcnt(0)                                         // 000000007580: BF8C0F70
	s_nop 0                                                    // 000000007584: BF800000
	buffer_store_dwordx2 v[0:1], v2, s[16:19], 0 offen         // 000000007588: E0741000 80040002
	buffer_store_short v14, off, s[0:3], 0 offset:8            // 000000007590: E0680008 80000E00
	buffer_store_short v46, off, s[0:3], 0 offset:14           // 000000007598: E068000E 80002E00
	buffer_store_short v45, off, s[0:3], 0 offset:12           // 0000000075A0: E068000C 80002D00
	buffer_store_short v54, off, s[0:3], 0 offset:10           // 0000000075A8: E068000A 80003600
	buffer_load_dword v1, off, s[0:3], 0 offset:12             // 0000000075B0: E050000C 80000100
	s_nop 0                                                    // 0000000075B8: BF800000
	s_nop 0                                                    // 0000000075BC: BF800000
	buffer_load_dword v0, off, s[0:3], 0 offset:8              // 0000000075C0: E0500008 80000000
	v_add_lshl_u32 v2, v21, v6, 1                              // 0000000075C8: D1FE0002 02060D15
	s_nop 0                                                    // 0000000075D0: BF800000
	s_waitcnt vmcnt(0)                                         // 0000000075D4: BF8C0F70
	s_nop 0                                                    // 0000000075D8: BF800000
	buffer_store_dwordx2 v[0:1], v2, s[16:19], 0 offen         // 0000000075DC: E0741000 80040002
	buffer_store_short v11, off, s[0:3], 0 offset:8            // 0000000075E4: E0680008 80000B00
	buffer_store_short v62, off, s[0:3], 0 offset:14           // 0000000075EC: E068000E 80003E00
	buffer_store_short v37, off, s[0:3], 0 offset:12           // 0000000075F4: E068000C 80002500
	buffer_store_short v86, off, s[0:3], 0 offset:10           // 0000000075FC: E068000A 80005600
	buffer_load_dword v1, off, s[0:3], 0 offset:12             // 000000007604: E050000C 80000100
	s_nop 0                                                    // 00000000760C: BF800000
	s_nop 0                                                    // 000000007610: BF800000
	buffer_load_dword v0, off, s[0:3], 0 offset:8              // 000000007614: E0500008 80000000
	v_add_lshl_u32 v2, v21, v12, 1                             // 00000000761C: D1FE0002 02061915
	s_nop 0                                                    // 000000007624: BF800000
	s_waitcnt vmcnt(0)                                         // 000000007628: BF8C0F70
	s_nop 0                                                    // 00000000762C: BF800000
	buffer_store_dwordx2 v[0:1], v2, s[16:19], 0 offen         // 000000007630: E0741000 80040002
	buffer_store_short v10, off, s[0:3], 0 offset:8            // 000000007638: E0680008 80000A00
	buffer_store_short v88, off, s[0:3], 0 offset:14           // 000000007640: E068000E 80005800
	buffer_store_short v58, off, s[0:3], 0 offset:12           // 000000007648: E068000C 80003A00
	buffer_store_short v55, off, s[0:3], 0 offset:10           // 000000007650: E068000A 80003700
	buffer_load_dword v1, off, s[0:3], 0 offset:12             // 000000007658: E050000C 80000100
	s_nop 0                                                    // 000000007660: BF800000
	s_nop 0                                                    // 000000007664: BF800000
	buffer_load_dword v0, off, s[0:3], 0 offset:8              // 000000007668: E0500008 80000000
	v_add_lshl_u32 v2, v104, v4, 1                             // 000000007670: D1FE0002 02060968
	s_nop 0                                                    // 000000007678: BF800000
	s_waitcnt vmcnt(0)                                         // 00000000767C: BF8C0F70
	s_nop 0                                                    // 000000007680: BF800000
	buffer_store_dwordx2 v[0:1], v2, s[16:19], 0 offen         // 000000007684: E0741000 80040002
	buffer_store_short v9, off, s[0:3], 0 offset:8             // 00000000768C: E0680008 80000900
	buffer_store_short v48, off, s[0:3], 0 offset:14           // 000000007694: E068000E 80003000
	buffer_store_short v51, off, s[0:3], 0 offset:12           // 00000000769C: E068000C 80003300
	buffer_store_short v35, off, s[0:3], 0 offset:10           // 0000000076A4: E068000A 80002300
	buffer_load_dword v1, off, s[0:3], 0 offset:12             // 0000000076AC: E050000C 80000100
	s_nop 0                                                    // 0000000076B4: BF800000
	s_nop 0                                                    // 0000000076B8: BF800000
	buffer_load_dword v0, off, s[0:3], 0 offset:8              // 0000000076BC: E0500008 80000000
	v_add_lshl_u32 v2, v104, v5, 1                             // 0000000076C4: D1FE0002 02060B68
	s_nop 0                                                    // 0000000076CC: BF800000
	s_waitcnt vmcnt(0)                                         // 0000000076D0: BF8C0F70
	s_nop 0                                                    // 0000000076D4: BF800000
	buffer_store_dwordx2 v[0:1], v2, s[16:19], 0 offen         // 0000000076D8: E0741000 80040002
	buffer_store_short v123, off, s[0:3], 0 offset:8           // 0000000076E0: E0680008 80007B00
	buffer_store_short v33, off, s[0:3], 0 offset:14           // 0000000076E8: E068000E 80002100
	buffer_store_short v61, off, s[0:3], 0 offset:12           // 0000000076F0: E068000C 80003D00
	buffer_store_short v52, off, s[0:3], 0 offset:10           // 0000000076F8: E068000A 80003400
	buffer_load_dword v1, off, s[0:3], 0 offset:12             // 000000007700: E050000C 80000100
	s_nop 0                                                    // 000000007708: BF800000
	s_nop 0                                                    // 00000000770C: BF800000
	buffer_load_dword v0, off, s[0:3], 0 offset:8              // 000000007710: E0500008 80000000
	v_add_lshl_u32 v2, v104, v6, 1                             // 000000007718: D1FE0002 02060D68
	s_nop 0                                                    // 000000007720: BF800000
	s_waitcnt vmcnt(0)                                         // 000000007724: BF8C0F70
	s_nop 0                                                    // 000000007728: BF800000
	buffer_store_dwordx2 v[0:1], v2, s[16:19], 0 offen         // 00000000772C: E0741000 80040002
	buffer_store_short v124, off, s[0:3], 0 offset:8           // 000000007734: E0680008 80007C00
	buffer_store_short v44, off, s[0:3], 0 offset:14           // 00000000773C: E068000E 80002C00
	buffer_store_short v43, off, s[0:3], 0 offset:12           // 000000007744: E068000C 80002B00
	buffer_store_short v49, off, s[0:3], 0 offset:10           // 00000000774C: E068000A 80003100
	buffer_load_dword v1, off, s[0:3], 0 offset:12             // 000000007754: E050000C 80000100
	s_nop 0                                                    // 00000000775C: BF800000
	s_nop 0                                                    // 000000007760: BF800000
	buffer_load_dword v0, off, s[0:3], 0 offset:8              // 000000007764: E0500008 80000000
	s_nop 0                                                    // 00000000776C: BF800000
	s_waitcnt vmcnt(0)                                         // 000000007770: BF8C0F70
	s_nop 0                                                    // 000000007774: BF800000
	buffer_store_dwordx2 v[0:1], v85, s[16:19], 0 offen        // 000000007778: E0741000 80040055





	s_endpgm
	.section	.rodata,#alloc
	.p2align	6
	.amdhsa_kernel gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw
		.amdhsa_group_segment_fixed_size 24576
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_user_sgpr_private_segment_buffer 1
		.amdhsa_user_sgpr_dispatch_ptr 0
		.amdhsa_user_sgpr_queue_ptr 0
		.amdhsa_user_sgpr_kernarg_segment_ptr 1
		.amdhsa_user_sgpr_dispatch_id 0
		.amdhsa_user_sgpr_flat_scratch_init 0
		.amdhsa_user_sgpr_private_segment_size 0
		.amdhsa_system_sgpr_private_segment_wavefront_offset 0
		.amdhsa_system_sgpr_workgroup_id_x 1
		.amdhsa_system_sgpr_workgroup_id_y 0
		.amdhsa_system_sgpr_workgroup_id_z 0
		.amdhsa_system_sgpr_workgroup_info 0
		.amdhsa_system_vgpr_workitem_id 0
		.amdhsa_next_free_vgpr 128
		.amdhsa_next_free_sgpr 33
		.amdhsa_reserve_flat_scratch 0
		.amdhsa_float_round_mode_32 0
		.amdhsa_float_round_mode_16_64 0
		.amdhsa_float_denorm_mode_32 0
		.amdhsa_float_denorm_mode_16_64 3
		.amdhsa_dx10_clamp 1
		.amdhsa_ieee_mode 1
		.amdhsa_fp16_overflow 0
		.amdhsa_exception_fp_ieee_invalid_op 0
		.amdhsa_exception_fp_denorm_src 0
		.amdhsa_exception_fp_ieee_div_zero 0
		.amdhsa_exception_fp_ieee_overflow 0
		.amdhsa_exception_fp_ieee_underflow 0
		.amdhsa_exception_fp_ieee_inexact 0
		.amdhsa_exception_int_div_zero 0
	.end_amdhsa_kernel
	.text
.Lfunc_end0:    
	.size	gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw, .Lfunc_end0-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw
                                        ; -- End function
	.section	.AMDGPU.csdata
	.ident	"HCC clang version 10.0.0 (/data/jenkins-workspace/compute-rocm-rel-3.1/external/hcc-tot/llvm-project/clang 6a70953f87a209f37ea7884abdbb6bcb2d6db732) (based on HCC 3.1.20023-6d267cfb-6a70953f87a )"
	.section	".note.GNU-stack"
	.amdgpu_metadata
---
amdhsa.kernels:
  - .args:
      - .address_space:  generic
        .name:           p_in_global
        .offset:         0
        .size:           8
        .value_kind:     global_buffer
        .value_type:     f16
      - .address_space:  generic
        .name:           p_wei_global
        .offset:         8
        .size:           8
        .value_kind:     global_buffer
        .value_type:     f16
      - .address_space:  generic
        .name:           p_out_global
        .offset:         16
        .size:           8
        .value_kind:     global_buffer
        .value_type:     f16
    .group_segment_fixed_size: 24576
    .kernarg_segment_align: 8
    .kernarg_segment_size: 24
    .language:       OpenCL C
    .language_version:
      - 2
      - 0
    .max_flat_workgroup_size: 256
    .name:           gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw
    .private_segment_fixed_size: 0
    .sgpr_count:     37
    .sgpr_spill_count: 0
    .symbol:         gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.kd
    .vgpr_count:     128
    .vgpr_spill_count: 0
    .wavefront_size: 64
amdhsa.version:
  - 1
  - 0
...

	.end_amdgpu_metadata
