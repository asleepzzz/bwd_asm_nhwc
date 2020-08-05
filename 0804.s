	.text
	;.amdgcn_target "amdgcn-amd-amdhsa--gfx908+sram-ecc"
	.hidden	bfloat16_to_float       ; -- Begin function bfloat16_to_float
	.globl	bfloat16_to_float
	.p2align	2
	.type	bfloat16_to_float,@function
bfloat16_to_float:                      ; @bfloat16_to_float
bfloat16_to_float$local:
.Lfunc_begin0:
	.file	1 "/nhwc_miopen/build/kevin/miopen-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp-500d-1bac-474f-b3b3/./bfloat16_dev.hpp"
	.loc	1 53 0                  ; ./bfloat16_dev.hpp:53:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp0:
	.file	2 "/opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_vector_types.h"
	.loc	2 585 40 prologue_end   ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_vector_types.h:585:40
	v_lshlrev_b32_e32 v0, 16, v0
.Ltmp1:
	.loc	1 62 5                  ; ./bfloat16_dev.hpp:62:5
	s_setpc_b64 s[30:31]
.Ltmp2:
.Lfunc_end0:
	.size	bfloat16_to_float, .Lfunc_end0-bfloat16_to_float
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 12
; NumSgprs: 36
; NumVgprs: 1
; NumAgprs: 0
; TotalNumVgprs: 1
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	float_to_bfloat16       ; -- Begin function float_to_bfloat16
	.globl	float_to_bfloat16
	.p2align	2
	.type	float_to_bfloat16,@function
float_to_bfloat16:                      ; @float_to_bfloat16
float_to_bfloat16$local:
.Lfunc_begin1:
	.loc	1 66 0                  ; ./bfloat16_dev.hpp:66:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	s_mov_b32 s4, 0x7f800000
.Ltmp3:
	.loc	1 71 25 prologue_end    ; ./bfloat16_dev.hpp:71:25
	v_and_b32_e32 v1, s4, v0
	.loc	1 71 39 is_stmt 0       ; ./bfloat16_dev.hpp:71:39
	v_cmp_ne_u32_e32 vcc, s4, v1
                                        ; implicit-def: $vgpr1
	s_and_saveexec_b64 s[4:5], vcc
	s_xor_b64 s[4:5], exec, s[4:5]
	s_cbranch_execnz BB1_3
; %bb.1:                                ; %Flow
	.loc	1 0 39                  ; ./bfloat16_dev.hpp:0:39
	s_or_saveexec_b64 s[6:7], s[4:5]
	s_xor_b64 exec, exec, s[6:7]
	s_cbranch_execnz BB1_4
BB1_2:
	s_or_b64 exec, exec, s[6:7]
	.loc	1 115 12 is_stmt 1      ; ./bfloat16_dev.hpp:115:12
	v_lshrrev_b32_e32 v0, 16, v1
	.loc	1 115 5 is_stmt 0       ; ./bfloat16_dev.hpp:115:5
	s_setpc_b64 s[30:31]
BB1_3:
	.loc	1 106 62 is_stmt 1      ; ./bfloat16_dev.hpp:106:62
	v_bfe_u32 v1, v0, 16, 1
	s_movk_i32 s6, 0x7fff
	.loc	1 106 24 is_stmt 0      ; ./bfloat16_dev.hpp:106:24
	v_add3_u32 v1, v0, v1, s6
	s_or_saveexec_b64 s[6:7], s[4:5]
	s_xor_b64 exec, exec, s[6:7]
	s_cbranch_execz BB1_2
BB1_4:
	.loc	1 81 38 is_stmt 1       ; ./bfloat16_dev.hpp:81:38
	v_mov_b32_e32 v1, 0
	.loc	1 83 28                 ; ./bfloat16_dev.hpp:83:28
	v_or_b32_e32 v2, 0x10000, v0
	.loc	1 81 38                 ; ./bfloat16_dev.hpp:81:38
	v_cmp_eq_u32_sdwa s[4:5], v0, v1 src0_sel:WORD_0 src1_sel:DWORD
	.loc	1 81 12 is_stmt 0       ; ./bfloat16_dev.hpp:81:12
	v_cndmask_b32_e64 v1, v2, v0, s[4:5]
	s_or_b64 exec, exec, s[6:7]
	.loc	1 115 12 is_stmt 1      ; ./bfloat16_dev.hpp:115:12
	v_lshrrev_b32_e32 v0, 16, v1
	.loc	1 115 5 is_stmt 0       ; ./bfloat16_dev.hpp:115:5
	s_setpc_b64 s[30:31]
.Ltmp4:
.Lfunc_end1:
	.size	float_to_bfloat16, .Lfunc_end1-float_to_bfloat16
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 128
; NumSgprs: 36
; NumVgprs: 3
; NumAgprs: 0
; TotalNumVgprs: 3
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck22get_thread_local_1d_idEv ; -- Begin function _ZN2ck22get_thread_local_1d_idEv
	.globl	_ZN2ck22get_thread_local_1d_idEv
	.p2align	2
	.type	_ZN2ck22get_thread_local_1d_idEv,@function
_ZN2ck22get_thread_local_1d_idEv:       ; @_ZN2ck22get_thread_local_1d_idEv
_ZN2ck22get_thread_local_1d_idEv$local:
.Lfunc_begin2:
	.file	3 "/nhwc_miopen/build/kevin/miopen-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp-500d-1bac-474f-b3b3/./utility.hpp"
	.loc	3 8 0 is_stmt 1         ; ./utility.hpp:8:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	v_and_b32_e32 v0, 0x3ff, v0
.Ltmp5:
	.loc	3 8 60 prologue_end     ; ./utility.hpp:8:60
	s_setpc_b64 s[30:31]
.Ltmp6:
.Lfunc_end2:
	.size	_ZN2ck22get_thread_local_1d_idEv, .Lfunc_end2-_ZN2ck22get_thread_local_1d_idEv
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 16
; NumSgprs: 36
; NumVgprs: 1
; NumAgprs: 0
; TotalNumVgprs: 1
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck15get_block_1d_idEv ; -- Begin function _ZN2ck15get_block_1d_idEv
	.globl	_ZN2ck15get_block_1d_idEv
	.p2align	2
	.type	_ZN2ck15get_block_1d_idEv,@function
_ZN2ck15get_block_1d_idEv:              ; @_ZN2ck15get_block_1d_idEv
_ZN2ck15get_block_1d_idEv$local:
.Lfunc_begin3:
	.loc	3 10 0                  ; ./utility.hpp:10:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp7:
	.loc	3 10 53 prologue_end    ; ./utility.hpp:10:53
	v_mov_b32_e32 v0, s4
	s_setpc_b64 s[30:31]
.Ltmp8:
.Lfunc_end3:
	.size	_ZN2ck15get_block_1d_idEv, .Lfunc_end3-_ZN2ck15get_block_1d_idEv
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 12
; NumSgprs: 36
; NumVgprs: 1
; NumAgprs: 0
; TotalNumVgprs: 1
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZNK2ck12type_convertIfEclItEEfT_ ; -- Begin function _ZNK2ck12type_convertIfEclItEEfT_
	.globl	_ZNK2ck12type_convertIfEclItEEfT_
	.p2align	2
	.type	_ZNK2ck12type_convertIfEclItEEfT_,@function
_ZNK2ck12type_convertIfEclItEEfT_:      ; @_ZNK2ck12type_convertIfEclItEEfT_
_ZNK2ck12type_convertIfEclItEEfT_$local:
.Lfunc_begin4:
	.file	4 "/nhwc_miopen/build/kevin/miopen-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp-500d-1bac-474f-b3b3/./float_type.hpp"
	.loc	4 278 0                 ; ./float_type.hpp:278:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp9:
	.loc	2 585 40 prologue_end   ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_vector_types.h:585:40
	v_lshlrev_b32_e32 v0, 16, v2
.Ltmp10:
	.loc	4 279 5                 ; ./float_type.hpp:279:5
	s_setpc_b64 s[30:31]
.Ltmp11:
.Lfunc_end4:
	.size	_ZNK2ck12type_convertIfEclItEEfT_, .Lfunc_end4-_ZNK2ck12type_convertIfEclItEEfT_
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 12
; NumSgprs: 36
; NumVgprs: 3
; NumAgprs: 0
; TotalNumVgprs: 3
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZNK2ck12type_convertItEclIfEEtT_ ; -- Begin function _ZNK2ck12type_convertItEclIfEEtT_
	.globl	_ZNK2ck12type_convertItEclIfEEtT_
	.p2align	2
	.type	_ZNK2ck12type_convertItEclIfEEtT_,@function
_ZNK2ck12type_convertItEclIfEEtT_:      ; @_ZNK2ck12type_convertItEclIfEEtT_
_ZNK2ck12type_convertItEclIfEEtT_$local:
.Lfunc_begin5:
	.loc	4 285 0                 ; ./float_type.hpp:285:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	s_mov_b32 s4, 0x7f800000
.Ltmp12:
	.loc	1 71 25 prologue_end    ; ./bfloat16_dev.hpp:71:25
	v_and_b32_e32 v0, s4, v2
	.loc	1 71 39 is_stmt 0       ; ./bfloat16_dev.hpp:71:39
	v_cmp_ne_u32_e32 vcc, s4, v0
                                        ; implicit-def: $vgpr0
	s_and_saveexec_b64 s[4:5], vcc
	s_xor_b64 s[4:5], exec, s[4:5]
	s_cbranch_execnz BB5_3
; %bb.1:                                ; %Flow
	.loc	1 0 39                  ; ./bfloat16_dev.hpp:0:39
	s_or_saveexec_b64 s[6:7], s[4:5]
	s_xor_b64 exec, exec, s[6:7]
	s_cbranch_execnz BB5_4
BB5_2:                                  ; %float_to_bfloat16.exit
	s_or_b64 exec, exec, s[6:7]
	.loc	1 115 12 is_stmt 1      ; ./bfloat16_dev.hpp:115:12
	v_lshrrev_b32_e32 v0, 16, v0
.Ltmp13:
	.loc	4 286 5                 ; ./float_type.hpp:286:5
	s_setpc_b64 s[30:31]
BB5_3:
.Ltmp14:
	.loc	1 106 62                ; ./bfloat16_dev.hpp:106:62
	v_bfe_u32 v0, v2, 16, 1
	s_movk_i32 s6, 0x7fff
	.loc	1 106 24 is_stmt 0      ; ./bfloat16_dev.hpp:106:24
	v_add3_u32 v0, v2, v0, s6
	s_or_saveexec_b64 s[6:7], s[4:5]
	s_xor_b64 exec, exec, s[6:7]
	s_cbranch_execz BB5_2
BB5_4:
	.loc	1 81 38 is_stmt 1       ; ./bfloat16_dev.hpp:81:38
	v_mov_b32_e32 v0, 0
	.loc	1 83 28                 ; ./bfloat16_dev.hpp:83:28
	v_or_b32_e32 v1, 0x10000, v2
	.loc	1 81 38                 ; ./bfloat16_dev.hpp:81:38
	v_cmp_eq_u32_sdwa s[4:5], v2, v0 src0_sel:WORD_0 src1_sel:DWORD
	.loc	1 81 12 is_stmt 0       ; ./bfloat16_dev.hpp:81:12
	v_cndmask_b32_e64 v0, v1, v2, s[4:5]
	s_or_b64 exec, exec, s[6:7]
	.loc	1 115 12 is_stmt 1      ; ./bfloat16_dev.hpp:115:12
	v_lshrrev_b32_e32 v0, 16, v0
.Ltmp15:
	.loc	4 286 5                 ; ./float_type.hpp:286:5
	s_setpc_b64 s[30:31]
.Ltmp16:
.Lfunc_end5:
	.size	_ZNK2ck12type_convertItEclIfEEtT_, .Lfunc_end5-_ZNK2ck12type_convertItEclIfEEtT_
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 128
; NumSgprs: 36
; NumVgprs: 3
; NumAgprs: 0
; TotalNumVgprs: 3
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck15amd_buffer_loadIfLi1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii ; -- Begin function _ZN2ck15amd_buffer_loadIfLi1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
	.globl	_ZN2ck15amd_buffer_loadIfLi1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
	.p2align	2
	.type	_ZN2ck15amd_buffer_loadIfLi1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii,@function
_ZN2ck15amd_buffer_loadIfLi1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii: ; @_ZN2ck15amd_buffer_loadIfLi1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
_ZN2ck15amd_buffer_loadIfLi1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii$local:
.Lfunc_begin6:
	.file	5 "/nhwc_miopen/build/kevin/miopen-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp-500d-1bac-474f-b3b3/./amd_buffer_addressing.hpp"
	.loc	5 176 0                 ; ./amd_buffer_addressing.hpp:176:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp17:
	.loc	5 184 31 prologue_end   ; ./amd_buffer_addressing.hpp:184:31
	v_mov_b32_e32 v4, -1
	v_mov_b32_e32 v5, 0x27000
	.loc	5 190 58                ; ./amd_buffer_addressing.hpp:190:58
	v_add_lshl_u32 v3, v3, v2, 2
	.loc	5 189 12                ; ./amd_buffer_addressing.hpp:189:12
	s_mov_b64 s[6:7], exec
BB6_1:                                  ; =>This Inner Loop Header: Depth=1
	v_readfirstlane_b32 s8, v0
	v_readfirstlane_b32 s9, v1
	v_readfirstlane_b32 s10, v4
	v_readfirstlane_b32 s11, v5
	v_cmp_eq_u64_e32 vcc, s[8:9], v[0:1]
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[4:5]
	s_and_b64 s[4:5], vcc, s[4:5]
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_load_dword v2, v3, s[8:11], 0 offen
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB6_1
; %bb.2:
	s_mov_b64 exec, s[6:7]
	.loc	5 189 5 is_stmt 0       ; ./amd_buffer_addressing.hpp:189:5
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v0, v2
	s_setpc_b64 s[30:31]
.Ltmp18:
.Lfunc_end6:
	.size	_ZN2ck15amd_buffer_loadIfLi1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii, .Lfunc_end6-_ZN2ck15amd_buffer_loadIfLi1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 108
; NumSgprs: 36
; NumVgprs: 6
; NumAgprs: 0
; TotalNumVgprs: 6
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck15amd_buffer_loadIfLi2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii ; -- Begin function _ZN2ck15amd_buffer_loadIfLi2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
	.globl	_ZN2ck15amd_buffer_loadIfLi2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
	.p2align	2
	.type	_ZN2ck15amd_buffer_loadIfLi2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii,@function
_ZN2ck15amd_buffer_loadIfLi2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii: ; @_ZN2ck15amd_buffer_loadIfLi2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
_ZN2ck15amd_buffer_loadIfLi2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii$local:
.Lfunc_begin7:
	.loc	5 197 0 is_stmt 1       ; ./amd_buffer_addressing.hpp:197:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp19:
	.loc	5 205 31 prologue_end   ; ./amd_buffer_addressing.hpp:205:31
	v_mov_b32_e32 v4, -1
	v_mov_b32_e32 v5, 0x27000
	.loc	5 211 58                ; ./amd_buffer_addressing.hpp:211:58
	v_add_lshl_u32 v6, v3, v2, 2
	.loc	5 210 12                ; ./amd_buffer_addressing.hpp:210:12
	s_mov_b64 s[6:7], exec
BB7_1:                                  ; =>This Inner Loop Header: Depth=1
	v_readfirstlane_b32 s8, v0
	v_readfirstlane_b32 s9, v1
	v_readfirstlane_b32 s10, v4
	v_readfirstlane_b32 s11, v5
	v_cmp_eq_u64_e32 vcc, s[8:9], v[0:1]
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[4:5]
	s_and_b64 s[4:5], vcc, s[4:5]
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_load_dwordx2 v[2:3], v6, s[8:11], 0 offen
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB7_1
; %bb.2:
	s_mov_b64 exec, s[6:7]
	.loc	5 210 5 is_stmt 0       ; ./amd_buffer_addressing.hpp:210:5
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v0, v2
	v_mov_b32_e32 v1, v3
	s_setpc_b64 s[30:31]
.Ltmp20:
.Lfunc_end7:
	.size	_ZN2ck15amd_buffer_loadIfLi2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii, .Lfunc_end7-_ZN2ck15amd_buffer_loadIfLi2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 112
; NumSgprs: 36
; NumVgprs: 7
; NumAgprs: 0
; TotalNumVgprs: 7
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck15amd_buffer_loadIfLi4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii ; -- Begin function _ZN2ck15amd_buffer_loadIfLi4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
	.globl	_ZN2ck15amd_buffer_loadIfLi4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
	.p2align	2
	.type	_ZN2ck15amd_buffer_loadIfLi4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii,@function
_ZN2ck15amd_buffer_loadIfLi4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii: ; @_ZN2ck15amd_buffer_loadIfLi4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
_ZN2ck15amd_buffer_loadIfLi4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii$local:
.Lfunc_begin8:
	.loc	5 218 0 is_stmt 1       ; ./amd_buffer_addressing.hpp:218:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp21:
	.loc	5 226 31 prologue_end   ; ./amd_buffer_addressing.hpp:226:31
	v_mov_b32_e32 v6, -1
	v_mov_b32_e32 v7, 0x27000
	.loc	5 232 58                ; ./amd_buffer_addressing.hpp:232:58
	v_add_lshl_u32 v8, v3, v2, 2
	.loc	5 231 12                ; ./amd_buffer_addressing.hpp:231:12
	s_mov_b64 s[6:7], exec
BB8_1:                                  ; =>This Inner Loop Header: Depth=1
	v_readfirstlane_b32 s8, v0
	v_readfirstlane_b32 s9, v1
	v_readfirstlane_b32 s10, v6
	v_readfirstlane_b32 s11, v7
	v_cmp_eq_u64_e32 vcc, s[8:9], v[0:1]
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]
	s_and_b64 s[4:5], vcc, s[4:5]
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_load_dwordx4 v[2:5], v8, s[8:11], 0 offen
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB8_1
; %bb.2:
	s_mov_b64 exec, s[6:7]
	.loc	5 231 5 is_stmt 0       ; ./amd_buffer_addressing.hpp:231:5
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v0, v2
	v_mov_b32_e32 v1, v3
	v_mov_b32_e32 v2, v4
	v_mov_b32_e32 v3, v5
	s_setpc_b64 s[30:31]
.Ltmp22:
.Lfunc_end8:
	.size	_ZN2ck15amd_buffer_loadIfLi4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii, .Lfunc_end8-_ZN2ck15amd_buffer_loadIfLi4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 120
; NumSgprs: 36
; NumVgprs: 9
; NumAgprs: 0
; TotalNumVgprs: 9
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck15amd_buffer_loadIDF16_Li1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii ; -- Begin function _ZN2ck15amd_buffer_loadIDF16_Li1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
	.globl	_ZN2ck15amd_buffer_loadIDF16_Li1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
	.p2align	2
	.type	_ZN2ck15amd_buffer_loadIDF16_Li1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii,@function
_ZN2ck15amd_buffer_loadIDF16_Li1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii: ; @_ZN2ck15amd_buffer_loadIDF16_Li1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
_ZN2ck15amd_buffer_loadIDF16_Li1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii$local:
.Lfunc_begin9:
	.loc	5 239 0 is_stmt 1       ; ./amd_buffer_addressing.hpp:239:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp23:
	.loc	5 256 47 prologue_end   ; ./amd_buffer_addressing.hpp:256:47
	v_add_u32_e32 v2, v3, v2
	.loc	5 256 12 is_stmt 0      ; ./amd_buffer_addressing.hpp:256:12
	v_ashrrev_i32_e32 v3, 31, v2
	v_lshlrev_b64 v[2:3], 1, v[2:3]
	v_add_co_u32_e32 v0, vcc, v0, v2
	v_addc_co_u32_e32 v1, vcc, v1, v3, vcc
	.loc	5 256 5                 ; ./amd_buffer_addressing.hpp:256:5
	s_nop 0
	.loc	5 256 12                ; ./amd_buffer_addressing.hpp:256:12
	s_nop 0
	flat_load_ushort v0, v[0:1]
	.loc	5 256 5                 ; ./amd_buffer_addressing.hpp:256:5
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp24:
.Lfunc_end9:
	.size	_ZN2ck15amd_buffer_loadIDF16_Li1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii, .Lfunc_end9-_ZN2ck15amd_buffer_loadIDF16_Li1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 52
; NumSgprs: 36
; NumVgprs: 4
; NumAgprs: 0
; TotalNumVgprs: 4
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck15amd_buffer_loadIDF16_Li2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii ; -- Begin function _ZN2ck15amd_buffer_loadIDF16_Li2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
	.globl	_ZN2ck15amd_buffer_loadIDF16_Li2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
	.p2align	2
	.type	_ZN2ck15amd_buffer_loadIDF16_Li2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii,@function
_ZN2ck15amd_buffer_loadIDF16_Li2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii: ; @_ZN2ck15amd_buffer_loadIDF16_Li2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
_ZN2ck15amd_buffer_loadIDF16_Li2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii$local:
.Lfunc_begin10:
	.loc	5 264 0 is_stmt 1       ; ./amd_buffer_addressing.hpp:264:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp25:
	.loc	5 272 31 prologue_end   ; ./amd_buffer_addressing.hpp:272:31
	v_mov_b32_e32 v4, -1
	v_mov_b32_e32 v5, 0x27000
	.loc	5 282 58                ; ./amd_buffer_addressing.hpp:282:58
	v_add_lshl_u32 v3, v3, v2, 1
	.loc	5 281 25                ; ./amd_buffer_addressing.hpp:281:25
	s_mov_b64 s[6:7], exec
BB10_1:                                 ; =>This Inner Loop Header: Depth=1
	v_readfirstlane_b32 s8, v0
	v_readfirstlane_b32 s9, v1
	v_readfirstlane_b32 s10, v4
	v_readfirstlane_b32 s11, v5
	v_cmp_eq_u64_e32 vcc, s[8:9], v[0:1]
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[4:5]
	s_and_b64 s[4:5], vcc, s[4:5]
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_load_dword v2, v3, s[8:11], 0 offen
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB10_1
; %bb.2:
	s_mov_b64 exec, s[6:7]
	.loc	5 284 5                 ; ./amd_buffer_addressing.hpp:284:5
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v0, v2
	s_setpc_b64 s[30:31]
.Ltmp26:
.Lfunc_end10:
	.size	_ZN2ck15amd_buffer_loadIDF16_Li2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii, .Lfunc_end10-_ZN2ck15amd_buffer_loadIDF16_Li2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 108
; NumSgprs: 36
; NumVgprs: 6
; NumAgprs: 0
; TotalNumVgprs: 6
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck15amd_buffer_loadIDF16_Li4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii ; -- Begin function _ZN2ck15amd_buffer_loadIDF16_Li4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
	.globl	_ZN2ck15amd_buffer_loadIDF16_Li4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
	.p2align	2
	.type	_ZN2ck15amd_buffer_loadIDF16_Li4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii,@function
_ZN2ck15amd_buffer_loadIDF16_Li4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii: ; @_ZN2ck15amd_buffer_loadIDF16_Li4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
_ZN2ck15amd_buffer_loadIDF16_Li4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii$local:
.Lfunc_begin11:
	.loc	5 292 0                 ; ./amd_buffer_addressing.hpp:292:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp27:
	.loc	5 300 31 prologue_end   ; ./amd_buffer_addressing.hpp:300:31
	v_mov_b32_e32 v4, -1
	v_mov_b32_e32 v5, 0x27000
	.loc	5 310 58                ; ./amd_buffer_addressing.hpp:310:58
	v_add_lshl_u32 v6, v3, v2, 1
	.loc	5 309 28                ; ./amd_buffer_addressing.hpp:309:28
	s_mov_b64 s[6:7], exec
BB11_1:                                 ; =>This Inner Loop Header: Depth=1
	v_readfirstlane_b32 s8, v0
	v_readfirstlane_b32 s9, v1
	v_readfirstlane_b32 s10, v4
	v_readfirstlane_b32 s11, v5
	v_cmp_eq_u64_e32 vcc, s[8:9], v[0:1]
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[4:5]
	s_and_b64 s[4:5], vcc, s[4:5]
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_load_dwordx2 v[2:3], v6, s[8:11], 0 offen
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB11_1
; %bb.2:
	s_mov_b64 exec, s[6:7]
	.loc	5 312 5                 ; ./amd_buffer_addressing.hpp:312:5
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v0, v2
	v_mov_b32_e32 v1, v3
	s_setpc_b64 s[30:31]
.Ltmp28:
.Lfunc_end11:
	.size	_ZN2ck15amd_buffer_loadIDF16_Li4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii, .Lfunc_end11-_ZN2ck15amd_buffer_loadIDF16_Li4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 112
; NumSgprs: 36
; NumVgprs: 7
; NumAgprs: 0
; TotalNumVgprs: 7
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck15amd_buffer_loadIDF16_Li8EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii ; -- Begin function _ZN2ck15amd_buffer_loadIDF16_Li8EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
	.globl	_ZN2ck15amd_buffer_loadIDF16_Li8EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
	.p2align	2
	.type	_ZN2ck15amd_buffer_loadIDF16_Li8EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii,@function
_ZN2ck15amd_buffer_loadIDF16_Li8EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii: ; @_ZN2ck15amd_buffer_loadIDF16_Li8EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
_ZN2ck15amd_buffer_loadIDF16_Li8EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii$local:
.Lfunc_begin12:
	.loc	5 320 0                 ; ./amd_buffer_addressing.hpp:320:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp29:
	.loc	5 328 31 prologue_end   ; ./amd_buffer_addressing.hpp:328:31
	v_mov_b32_e32 v6, -1
	v_mov_b32_e32 v7, 0x27000
	.loc	5 337 58                ; ./amd_buffer_addressing.hpp:337:58
	v_add_lshl_u32 v8, v3, v2, 1
	.loc	5 336 28                ; ./amd_buffer_addressing.hpp:336:28
	s_mov_b64 s[6:7], exec
BB12_1:                                 ; =>This Inner Loop Header: Depth=1
	v_readfirstlane_b32 s8, v0
	v_readfirstlane_b32 s9, v1
	v_readfirstlane_b32 s10, v6
	v_readfirstlane_b32 s11, v7
	v_cmp_eq_u64_e32 vcc, s[8:9], v[0:1]
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]
	s_and_b64 s[4:5], vcc, s[4:5]
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_load_dwordx4 v[2:5], v8, s[8:11], 0 offen
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB12_1
; %bb.2:
	s_mov_b64 exec, s[6:7]
	.loc	5 339 5                 ; ./amd_buffer_addressing.hpp:339:5
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v0, v2
	v_mov_b32_e32 v1, v3
	v_mov_b32_e32 v2, v4
	v_mov_b32_e32 v3, v5
	s_setpc_b64 s[30:31]
.Ltmp30:
.Lfunc_end12:
	.size	_ZN2ck15amd_buffer_loadIDF16_Li8EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii, .Lfunc_end12-_ZN2ck15amd_buffer_loadIDF16_Li8EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 120
; NumSgprs: 36
; NumVgprs: 9
; NumAgprs: 0
; TotalNumVgprs: 9
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck15amd_buffer_loadItLi1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii ; -- Begin function _ZN2ck15amd_buffer_loadItLi1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
	.globl	_ZN2ck15amd_buffer_loadItLi1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
	.p2align	2
	.type	_ZN2ck15amd_buffer_loadItLi1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii,@function
_ZN2ck15amd_buffer_loadItLi1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii: ; @_ZN2ck15amd_buffer_loadItLi1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
_ZN2ck15amd_buffer_loadItLi1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii$local:
.Lfunc_begin13:
	.loc	5 347 0                 ; ./amd_buffer_addressing.hpp:347:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp31:
	.loc	5 364 47 prologue_end   ; ./amd_buffer_addressing.hpp:364:47
	v_add_u32_e32 v2, v3, v2
	.loc	5 364 12 is_stmt 0      ; ./amd_buffer_addressing.hpp:364:12
	v_ashrrev_i32_e32 v3, 31, v2
	v_lshlrev_b64 v[2:3], 1, v[2:3]
	v_add_co_u32_e32 v0, vcc, v0, v2
	v_addc_co_u32_e32 v1, vcc, v1, v3, vcc
	.loc	5 364 5                 ; ./amd_buffer_addressing.hpp:364:5
	s_nop 0
	.loc	5 364 12                ; ./amd_buffer_addressing.hpp:364:12
	s_nop 0
	flat_load_ushort v0, v[0:1]
	.loc	5 364 5                 ; ./amd_buffer_addressing.hpp:364:5
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp32:
.Lfunc_end13:
	.size	_ZN2ck15amd_buffer_loadItLi1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii, .Lfunc_end13-_ZN2ck15amd_buffer_loadItLi1EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 52
; NumSgprs: 36
; NumVgprs: 4
; NumAgprs: 0
; TotalNumVgprs: 4
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck15amd_buffer_loadItLi2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii ; -- Begin function _ZN2ck15amd_buffer_loadItLi2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
	.globl	_ZN2ck15amd_buffer_loadItLi2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
	.p2align	2
	.type	_ZN2ck15amd_buffer_loadItLi2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii,@function
_ZN2ck15amd_buffer_loadItLi2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii: ; @_ZN2ck15amd_buffer_loadItLi2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
_ZN2ck15amd_buffer_loadItLi2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii$local:
.Lfunc_begin14:
	.loc	5 372 0 is_stmt 1       ; ./amd_buffer_addressing.hpp:372:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp33:
	.loc	5 380 31 prologue_end   ; ./amd_buffer_addressing.hpp:380:31
	v_mov_b32_e32 v4, -1
	v_mov_b32_e32 v5, 0x27000
	.loc	5 390 58                ; ./amd_buffer_addressing.hpp:390:58
	v_add_lshl_u32 v3, v3, v2, 1
	.loc	5 389 25                ; ./amd_buffer_addressing.hpp:389:25
	s_mov_b64 s[6:7], exec
BB14_1:                                 ; =>This Inner Loop Header: Depth=1
	v_readfirstlane_b32 s8, v0
	v_readfirstlane_b32 s9, v1
	v_readfirstlane_b32 s10, v4
	v_readfirstlane_b32 s11, v5
	v_cmp_eq_u64_e32 vcc, s[8:9], v[0:1]
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[4:5]
	s_and_b64 s[4:5], vcc, s[4:5]
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_load_dword v2, v3, s[8:11], 0 offen
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB14_1
; %bb.2:
	s_mov_b64 exec, s[6:7]
	.loc	5 392 5                 ; ./amd_buffer_addressing.hpp:392:5
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v0, v2
	s_setpc_b64 s[30:31]
.Ltmp34:
.Lfunc_end14:
	.size	_ZN2ck15amd_buffer_loadItLi2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii, .Lfunc_end14-_ZN2ck15amd_buffer_loadItLi2EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 108
; NumSgprs: 36
; NumVgprs: 6
; NumAgprs: 0
; TotalNumVgprs: 6
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck15amd_buffer_loadItLi4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii ; -- Begin function _ZN2ck15amd_buffer_loadItLi4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
	.globl	_ZN2ck15amd_buffer_loadItLi4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
	.p2align	2
	.type	_ZN2ck15amd_buffer_loadItLi4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii,@function
_ZN2ck15amd_buffer_loadItLi4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii: ; @_ZN2ck15amd_buffer_loadItLi4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
_ZN2ck15amd_buffer_loadItLi4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii$local:
.Lfunc_begin15:
	.loc	5 400 0                 ; ./amd_buffer_addressing.hpp:400:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp35:
	.loc	5 408 31 prologue_end   ; ./amd_buffer_addressing.hpp:408:31
	v_mov_b32_e32 v4, -1
	v_mov_b32_e32 v5, 0x27000
	.loc	5 418 58                ; ./amd_buffer_addressing.hpp:418:58
	v_add_lshl_u32 v6, v3, v2, 1
	.loc	5 417 28                ; ./amd_buffer_addressing.hpp:417:28
	s_mov_b64 s[6:7], exec
BB15_1:                                 ; =>This Inner Loop Header: Depth=1
	v_readfirstlane_b32 s8, v0
	v_readfirstlane_b32 s9, v1
	v_readfirstlane_b32 s10, v4
	v_readfirstlane_b32 s11, v5
	v_cmp_eq_u64_e32 vcc, s[8:9], v[0:1]
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[4:5]
	s_and_b64 s[4:5], vcc, s[4:5]
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_load_dwordx2 v[2:3], v6, s[8:11], 0 offen
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB15_1
; %bb.2:
	s_mov_b64 exec, s[6:7]
	.loc	5 420 5                 ; ./amd_buffer_addressing.hpp:420:5
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v0, v2
	v_mov_b32_e32 v1, v3
	s_setpc_b64 s[30:31]
.Ltmp36:
.Lfunc_end15:
	.size	_ZN2ck15amd_buffer_loadItLi4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii, .Lfunc_end15-_ZN2ck15amd_buffer_loadItLi4EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 112
; NumSgprs: 36
; NumVgprs: 7
; NumAgprs: 0
; TotalNumVgprs: 7
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck15amd_buffer_loadItLi8EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii ; -- Begin function _ZN2ck15amd_buffer_loadItLi8EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
	.globl	_ZN2ck15amd_buffer_loadItLi8EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
	.p2align	2
	.type	_ZN2ck15amd_buffer_loadItLi8EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii,@function
_ZN2ck15amd_buffer_loadItLi8EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii: ; @_ZN2ck15amd_buffer_loadItLi8EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
_ZN2ck15amd_buffer_loadItLi8EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii$local:
.Lfunc_begin16:
	.loc	5 428 0                 ; ./amd_buffer_addressing.hpp:428:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp37:
	.loc	5 436 31 prologue_end   ; ./amd_buffer_addressing.hpp:436:31
	v_mov_b32_e32 v6, -1
	v_mov_b32_e32 v7, 0x27000
	.loc	5 445 58                ; ./amd_buffer_addressing.hpp:445:58
	v_add_lshl_u32 v8, v3, v2, 1
	.loc	5 444 28                ; ./amd_buffer_addressing.hpp:444:28
	s_mov_b64 s[6:7], exec
BB16_1:                                 ; =>This Inner Loop Header: Depth=1
	v_readfirstlane_b32 s8, v0
	v_readfirstlane_b32 s9, v1
	v_readfirstlane_b32 s10, v6
	v_readfirstlane_b32 s11, v7
	v_cmp_eq_u64_e32 vcc, s[8:9], v[0:1]
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]
	s_and_b64 s[4:5], vcc, s[4:5]
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_load_dwordx4 v[2:5], v8, s[8:11], 0 offen
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB16_1
; %bb.2:
	s_mov_b64 exec, s[6:7]
	.loc	5 447 5                 ; ./amd_buffer_addressing.hpp:447:5
	s_waitcnt vmcnt(0)
	v_mov_b32_e32 v0, v2
	v_mov_b32_e32 v1, v3
	v_mov_b32_e32 v2, v4
	v_mov_b32_e32 v3, v5
	s_setpc_b64 s[30:31]
.Ltmp38:
.Lfunc_end16:
	.size	_ZN2ck15amd_buffer_loadItLi8EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii, .Lfunc_end16-_ZN2ck15amd_buffer_loadItLi8EEENS_11vector_typeIT_XT0_EE10MemoryTypeEPKS2_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 120
; NumSgprs: 36
; NumVgprs: 9
; NumAgprs: 0
; TotalNumVgprs: 9
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck16amd_buffer_storeIfLi1EEEvPKT_PS1_ii ; -- Begin function _ZN2ck16amd_buffer_storeIfLi1EEEvPKT_PS1_ii
	.globl	_ZN2ck16amd_buffer_storeIfLi1EEEvPKT_PS1_ii
	.p2align	2
	.type	_ZN2ck16amd_buffer_storeIfLi1EEEvPKT_PS1_ii,@function
_ZN2ck16amd_buffer_storeIfLi1EEEvPKT_PS1_ii: ; @_ZN2ck16amd_buffer_storeIfLi1EEEvPKT_PS1_ii
_ZN2ck16amd_buffer_storeIfLi1EEEvPKT_PS1_ii$local:
.Lfunc_begin17:
	.loc	5 456 0                 ; ./amd_buffer_addressing.hpp:456:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp39:
	.loc	5 469 36 prologue_end   ; ./amd_buffer_addressing.hpp:469:36
	flat_load_dword v0, v[0:1]
	.loc	5 464 31                ; ./amd_buffer_addressing.hpp:464:31
	v_mov_b32_e32 v6, -1
	v_mov_b32_e32 v7, 0x27000
	.loc	5 472 59                ; ./amd_buffer_addressing.hpp:472:59
	v_add_lshl_u32 v1, v5, v4, 2
	.loc	5 469 5                 ; ./amd_buffer_addressing.hpp:469:5
	s_mov_b64 s[6:7], exec
BB17_1:                                 ; =>This Inner Loop Header: Depth=1
	v_readfirstlane_b32 s8, v2
	v_readfirstlane_b32 s9, v3
	v_readfirstlane_b32 s10, v6
	v_readfirstlane_b32 s11, v7
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]
	s_and_b64 s[4:5], vcc, s[4:5]
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_nop 0
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_nop 0
	buffer_store_dword v0, v1, s[8:11], 0 offen
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB17_1
; %bb.2:
	s_mov_b64 exec, s[6:7]
	.loc	5 475 1                 ; ./amd_buffer_addressing.hpp:475:1
	s_waitcnt vmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp40:
.Lfunc_end17:
	.size	_ZN2ck16amd_buffer_storeIfLi1EEEvPKT_PS1_ii, .Lfunc_end17-_ZN2ck16amd_buffer_storeIfLi1EEEvPKT_PS1_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 112
; NumSgprs: 36
; NumVgprs: 8
; NumAgprs: 0
; TotalNumVgprs: 8
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck16amd_buffer_storeIfLi2EEEvPKT_PS1_ii ; -- Begin function _ZN2ck16amd_buffer_storeIfLi2EEEvPKT_PS1_ii
	.globl	_ZN2ck16amd_buffer_storeIfLi2EEEvPKT_PS1_ii
	.p2align	2
	.type	_ZN2ck16amd_buffer_storeIfLi2EEEvPKT_PS1_ii,@function
_ZN2ck16amd_buffer_storeIfLi2EEEvPKT_PS1_ii: ; @_ZN2ck16amd_buffer_storeIfLi2EEEvPKT_PS1_ii
_ZN2ck16amd_buffer_storeIfLi2EEEvPKT_PS1_ii$local:
.Lfunc_begin18:
	.loc	5 482 0                 ; ./amd_buffer_addressing.hpp:482:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp41:
	.loc	5 495 38 prologue_end   ; ./amd_buffer_addressing.hpp:495:38
	flat_load_dwordx2 v[0:1], v[0:1]
	.loc	5 490 31                ; ./amd_buffer_addressing.hpp:490:31
	v_mov_b32_e32 v6, -1
	v_mov_b32_e32 v7, 0x27000
	.loc	5 498 61                ; ./amd_buffer_addressing.hpp:498:61
	v_add_lshl_u32 v4, v5, v4, 2
	.loc	5 495 5                 ; ./amd_buffer_addressing.hpp:495:5
	s_mov_b64 s[6:7], exec
BB18_1:                                 ; =>This Inner Loop Header: Depth=1
	v_readfirstlane_b32 s8, v2
	v_readfirstlane_b32 s9, v3
	v_readfirstlane_b32 s10, v6
	v_readfirstlane_b32 s11, v7
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]
	s_and_b64 s[4:5], vcc, s[4:5]
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_nop 0
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[0:1], v4, s[8:11], 0 offen
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB18_1
; %bb.2:
	s_mov_b64 exec, s[6:7]
	.loc	5 501 1                 ; ./amd_buffer_addressing.hpp:501:1
	s_waitcnt vmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp42:
.Lfunc_end18:
	.size	_ZN2ck16amd_buffer_storeIfLi2EEEvPKT_PS1_ii, .Lfunc_end18-_ZN2ck16amd_buffer_storeIfLi2EEEvPKT_PS1_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 112
; NumSgprs: 36
; NumVgprs: 8
; NumAgprs: 0
; TotalNumVgprs: 8
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck16amd_buffer_storeIfLi4EEEvPKT_PS1_ii ; -- Begin function _ZN2ck16amd_buffer_storeIfLi4EEEvPKT_PS1_ii
	.globl	_ZN2ck16amd_buffer_storeIfLi4EEEvPKT_PS1_ii
	.p2align	2
	.type	_ZN2ck16amd_buffer_storeIfLi4EEEvPKT_PS1_ii,@function
_ZN2ck16amd_buffer_storeIfLi4EEEvPKT_PS1_ii: ; @_ZN2ck16amd_buffer_storeIfLi4EEEvPKT_PS1_ii
_ZN2ck16amd_buffer_storeIfLi4EEEvPKT_PS1_ii$local:
.Lfunc_begin19:
	.loc	5 508 0                 ; ./amd_buffer_addressing.hpp:508:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp43:
	.loc	5 521 38 prologue_end   ; ./amd_buffer_addressing.hpp:521:38
	flat_load_dwordx4 v[8:11], v[0:1]
	.loc	5 516 31                ; ./amd_buffer_addressing.hpp:516:31
	v_mov_b32_e32 v6, -1
	v_mov_b32_e32 v7, 0x27000
	.loc	5 524 61                ; ./amd_buffer_addressing.hpp:524:61
	v_add_lshl_u32 v0, v5, v4, 2
	.loc	5 521 5                 ; ./amd_buffer_addressing.hpp:521:5
	s_mov_b64 s[6:7], exec
BB19_1:                                 ; =>This Inner Loop Header: Depth=1
	v_readfirstlane_b32 s8, v2
	v_readfirstlane_b32 s9, v3
	v_readfirstlane_b32 s10, v6
	v_readfirstlane_b32 s11, v7
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]
	s_and_b64 s[4:5], vcc, s[4:5]
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_nop 0
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_nop 0
	buffer_store_dwordx4 v[8:11], v0, s[8:11], 0 offen
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB19_1
; %bb.2:
	s_mov_b64 exec, s[6:7]
	.loc	5 527 1                 ; ./amd_buffer_addressing.hpp:527:1
	s_waitcnt vmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp44:
.Lfunc_end19:
	.size	_ZN2ck16amd_buffer_storeIfLi4EEEvPKT_PS1_ii, .Lfunc_end19-_ZN2ck16amd_buffer_storeIfLi4EEEvPKT_PS1_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 112
; NumSgprs: 36
; NumVgprs: 12
; NumAgprs: 0
; TotalNumVgprs: 12
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck16amd_buffer_storeIDF16_Li1EEEvPKT_PS1_ii ; -- Begin function _ZN2ck16amd_buffer_storeIDF16_Li1EEEvPKT_PS1_ii
	.globl	_ZN2ck16amd_buffer_storeIDF16_Li1EEEvPKT_PS1_ii
	.p2align	2
	.type	_ZN2ck16amd_buffer_storeIDF16_Li1EEEvPKT_PS1_ii,@function
_ZN2ck16amd_buffer_storeIDF16_Li1EEEvPKT_PS1_ii: ; @_ZN2ck16amd_buffer_storeIDF16_Li1EEEvPKT_PS1_ii
_ZN2ck16amd_buffer_storeIDF16_Li1EEEvPKT_PS1_ii$local:
.Lfunc_begin20:
	.loc	5 534 0                 ; ./amd_buffer_addressing.hpp:534:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp45:
	.loc	5 555 67 prologue_end   ; ./amd_buffer_addressing.hpp:555:67
	flat_load_ushort v6, v[0:1]
	.loc	5 555 40 is_stmt 0      ; ./amd_buffer_addressing.hpp:555:40
	v_add_u32_e32 v0, v5, v4
	.loc	5 555 5                 ; ./amd_buffer_addressing.hpp:555:5
	v_ashrrev_i32_e32 v1, 31, v0
	v_lshlrev_b64 v[0:1], 1, v[0:1]
	v_add_co_u32_e32 v0, vcc, v2, v0
	v_addc_co_u32_e32 v1, vcc, v3, v1, vcc
	.loc	5 557 1 is_stmt 1       ; ./amd_buffer_addressing.hpp:557:1
	s_nop 0
	.loc	5 555 65                ; ./amd_buffer_addressing.hpp:555:65
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_nop 0
	flat_store_short v[0:1], v6
	.loc	5 557 1                 ; ./amd_buffer_addressing.hpp:557:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp46:
.Lfunc_end20:
	.size	_ZN2ck16amd_buffer_storeIDF16_Li1EEEvPKT_PS1_ii, .Lfunc_end20-_ZN2ck16amd_buffer_storeIDF16_Li1EEEvPKT_PS1_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 64
; NumSgprs: 36
; NumVgprs: 7
; NumAgprs: 0
; TotalNumVgprs: 7
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck16amd_buffer_storeIDF16_Li2EEEvPKT_PS1_ii ; -- Begin function _ZN2ck16amd_buffer_storeIDF16_Li2EEEvPKT_PS1_ii
	.globl	_ZN2ck16amd_buffer_storeIDF16_Li2EEEvPKT_PS1_ii
	.p2align	2
	.type	_ZN2ck16amd_buffer_storeIDF16_Li2EEEvPKT_PS1_ii,@function
_ZN2ck16amd_buffer_storeIDF16_Li2EEEvPKT_PS1_ii: ; @_ZN2ck16amd_buffer_storeIDF16_Li2EEEvPKT_PS1_ii
_ZN2ck16amd_buffer_storeIDF16_Li2EEEvPKT_PS1_ii$local:
.Lfunc_begin21:
	.loc	5 564 0                 ; ./amd_buffer_addressing.hpp:564:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp47:
	.loc	5 587 36 prologue_end   ; ./amd_buffer_addressing.hpp:587:36
	flat_load_dword v0, v[0:1]
	.loc	5 572 31                ; ./amd_buffer_addressing.hpp:572:31
	v_mov_b32_e32 v6, -1
	v_mov_b32_e32 v7, 0x27000
	.loc	5 590 59                ; ./amd_buffer_addressing.hpp:590:59
	v_add_lshl_u32 v1, v5, v4, 1
	.loc	5 587 5                 ; ./amd_buffer_addressing.hpp:587:5
	s_mov_b64 s[6:7], exec
BB21_1:                                 ; =>This Inner Loop Header: Depth=1
	v_readfirstlane_b32 s8, v2
	v_readfirstlane_b32 s9, v3
	v_readfirstlane_b32 s10, v6
	v_readfirstlane_b32 s11, v7
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]
	s_and_b64 s[4:5], vcc, s[4:5]
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_nop 0
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_nop 0
	buffer_store_dword v0, v1, s[8:11], 0 offen
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB21_1
; %bb.2:
	s_mov_b64 exec, s[6:7]
	.loc	5 594 1                 ; ./amd_buffer_addressing.hpp:594:1
	s_waitcnt vmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp48:
.Lfunc_end21:
	.size	_ZN2ck16amd_buffer_storeIDF16_Li2EEEvPKT_PS1_ii, .Lfunc_end21-_ZN2ck16amd_buffer_storeIDF16_Li2EEEvPKT_PS1_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 112
; NumSgprs: 36
; NumVgprs: 8
; NumAgprs: 0
; TotalNumVgprs: 8
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck16amd_buffer_storeIDF16_Li4EEEvPKT_PS1_ii ; -- Begin function _ZN2ck16amd_buffer_storeIDF16_Li4EEEvPKT_PS1_ii
	.globl	_ZN2ck16amd_buffer_storeIDF16_Li4EEEvPKT_PS1_ii
	.p2align	2
	.type	_ZN2ck16amd_buffer_storeIDF16_Li4EEEvPKT_PS1_ii,@function
_ZN2ck16amd_buffer_storeIDF16_Li4EEEvPKT_PS1_ii: ; @_ZN2ck16amd_buffer_storeIDF16_Li4EEEvPKT_PS1_ii
_ZN2ck16amd_buffer_storeIDF16_Li4EEEvPKT_PS1_ii$local:
.Lfunc_begin22:
	.loc	5 601 0                 ; ./amd_buffer_addressing.hpp:601:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp49:
	.loc	5 624 38 prologue_end   ; ./amd_buffer_addressing.hpp:624:38
	flat_load_dwordx2 v[0:1], v[0:1]
	.loc	5 612 31                ; ./amd_buffer_addressing.hpp:612:31
	v_mov_b32_e32 v6, -1
	v_mov_b32_e32 v7, 0x27000
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v4, v5, v4, 1
	.loc	5 624 5                 ; ./amd_buffer_addressing.hpp:624:5
	s_mov_b64 s[6:7], exec
BB22_1:                                 ; =>This Inner Loop Header: Depth=1
	v_readfirstlane_b32 s8, v2
	v_readfirstlane_b32 s9, v3
	v_readfirstlane_b32 s10, v6
	v_readfirstlane_b32 s11, v7
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]
	s_and_b64 s[4:5], vcc, s[4:5]
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_nop 0
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[0:1], v4, s[8:11], 0 offen
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB22_1
; %bb.2:
	s_mov_b64 exec, s[6:7]
	.loc	5 631 1                 ; ./amd_buffer_addressing.hpp:631:1
	s_waitcnt vmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp50:
.Lfunc_end22:
	.size	_ZN2ck16amd_buffer_storeIDF16_Li4EEEvPKT_PS1_ii, .Lfunc_end22-_ZN2ck16amd_buffer_storeIDF16_Li4EEEvPKT_PS1_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 112
; NumSgprs: 36
; NumVgprs: 8
; NumAgprs: 0
; TotalNumVgprs: 8
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck16amd_buffer_storeItLi1EEEvPKT_PS1_ii ; -- Begin function _ZN2ck16amd_buffer_storeItLi1EEEvPKT_PS1_ii
	.globl	_ZN2ck16amd_buffer_storeItLi1EEEvPKT_PS1_ii
	.p2align	2
	.type	_ZN2ck16amd_buffer_storeItLi1EEEvPKT_PS1_ii,@function
_ZN2ck16amd_buffer_storeItLi1EEEvPKT_PS1_ii: ; @_ZN2ck16amd_buffer_storeItLi1EEEvPKT_PS1_ii
_ZN2ck16amd_buffer_storeItLi1EEEvPKT_PS1_ii$local:
.Lfunc_begin23:
	.loc	5 638 0                 ; ./amd_buffer_addressing.hpp:638:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp51:
	.loc	5 659 67 prologue_end   ; ./amd_buffer_addressing.hpp:659:67
	flat_load_ushort v6, v[0:1]
	.loc	5 659 40 is_stmt 0      ; ./amd_buffer_addressing.hpp:659:40
	v_add_u32_e32 v0, v5, v4
	.loc	5 659 5                 ; ./amd_buffer_addressing.hpp:659:5
	v_ashrrev_i32_e32 v1, 31, v0
	v_lshlrev_b64 v[0:1], 1, v[0:1]
	v_add_co_u32_e32 v0, vcc, v2, v0
	v_addc_co_u32_e32 v1, vcc, v3, v1, vcc
	.loc	5 661 1 is_stmt 1       ; ./amd_buffer_addressing.hpp:661:1
	s_nop 0
	.loc	5 659 65                ; ./amd_buffer_addressing.hpp:659:65
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_nop 0
	flat_store_short v[0:1], v6
	.loc	5 661 1                 ; ./amd_buffer_addressing.hpp:661:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp52:
.Lfunc_end23:
	.size	_ZN2ck16amd_buffer_storeItLi1EEEvPKT_PS1_ii, .Lfunc_end23-_ZN2ck16amd_buffer_storeItLi1EEEvPKT_PS1_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 64
; NumSgprs: 36
; NumVgprs: 7
; NumAgprs: 0
; TotalNumVgprs: 7
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck16amd_buffer_storeItLi2EEEvPKT_PS1_ii ; -- Begin function _ZN2ck16amd_buffer_storeItLi2EEEvPKT_PS1_ii
	.globl	_ZN2ck16amd_buffer_storeItLi2EEEvPKT_PS1_ii
	.p2align	2
	.type	_ZN2ck16amd_buffer_storeItLi2EEEvPKT_PS1_ii,@function
_ZN2ck16amd_buffer_storeItLi2EEEvPKT_PS1_ii: ; @_ZN2ck16amd_buffer_storeItLi2EEEvPKT_PS1_ii
_ZN2ck16amd_buffer_storeItLi2EEEvPKT_PS1_ii$local:
.Lfunc_begin24:
	.loc	5 668 0                 ; ./amd_buffer_addressing.hpp:668:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp53:
	.loc	5 691 36 prologue_end   ; ./amd_buffer_addressing.hpp:691:36
	flat_load_dword v0, v[0:1]
	.loc	5 676 31                ; ./amd_buffer_addressing.hpp:676:31
	v_mov_b32_e32 v6, -1
	v_mov_b32_e32 v7, 0x27000
	.loc	5 694 59                ; ./amd_buffer_addressing.hpp:694:59
	v_add_lshl_u32 v1, v5, v4, 1
	.loc	5 691 5                 ; ./amd_buffer_addressing.hpp:691:5
	s_mov_b64 s[6:7], exec
BB24_1:                                 ; =>This Inner Loop Header: Depth=1
	v_readfirstlane_b32 s8, v2
	v_readfirstlane_b32 s9, v3
	v_readfirstlane_b32 s10, v6
	v_readfirstlane_b32 s11, v7
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]
	s_and_b64 s[4:5], vcc, s[4:5]
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_nop 0
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_nop 0
	buffer_store_dword v0, v1, s[8:11], 0 offen
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB24_1
; %bb.2:
	s_mov_b64 exec, s[6:7]
	.loc	5 698 1                 ; ./amd_buffer_addressing.hpp:698:1
	s_waitcnt vmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp54:
.Lfunc_end24:
	.size	_ZN2ck16amd_buffer_storeItLi2EEEvPKT_PS1_ii, .Lfunc_end24-_ZN2ck16amd_buffer_storeItLi2EEEvPKT_PS1_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 112
; NumSgprs: 36
; NumVgprs: 8
; NumAgprs: 0
; TotalNumVgprs: 8
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck16amd_buffer_storeItLi4EEEvPKT_PS1_ii ; -- Begin function _ZN2ck16amd_buffer_storeItLi4EEEvPKT_PS1_ii
	.globl	_ZN2ck16amd_buffer_storeItLi4EEEvPKT_PS1_ii
	.p2align	2
	.type	_ZN2ck16amd_buffer_storeItLi4EEEvPKT_PS1_ii,@function
_ZN2ck16amd_buffer_storeItLi4EEEvPKT_PS1_ii: ; @_ZN2ck16amd_buffer_storeItLi4EEEvPKT_PS1_ii
_ZN2ck16amd_buffer_storeItLi4EEEvPKT_PS1_ii$local:
.Lfunc_begin25:
	.loc	5 705 0                 ; ./amd_buffer_addressing.hpp:705:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp55:
	.loc	5 728 38 prologue_end   ; ./amd_buffer_addressing.hpp:728:38
	flat_load_dwordx2 v[0:1], v[0:1]
	.loc	5 713 31                ; ./amd_buffer_addressing.hpp:713:31
	v_mov_b32_e32 v6, -1
	v_mov_b32_e32 v7, 0x27000
	.loc	5 731 61                ; ./amd_buffer_addressing.hpp:731:61
	v_add_lshl_u32 v4, v5, v4, 1
	.loc	5 728 5                 ; ./amd_buffer_addressing.hpp:728:5
	s_mov_b64 s[6:7], exec
BB25_1:                                 ; =>This Inner Loop Header: Depth=1
	v_readfirstlane_b32 s8, v2
	v_readfirstlane_b32 s9, v3
	v_readfirstlane_b32 s10, v6
	v_readfirstlane_b32 s11, v7
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]
	s_and_b64 s[4:5], vcc, s[4:5]
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_nop 0
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[0:1], v4, s[8:11], 0 offen
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB25_1
; %bb.2:
	s_mov_b64 exec, s[6:7]
	.loc	5 735 1                 ; ./amd_buffer_addressing.hpp:735:1
	s_waitcnt vmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp56:
.Lfunc_end25:
	.size	_ZN2ck16amd_buffer_storeItLi4EEEvPKT_PS1_ii, .Lfunc_end25-_ZN2ck16amd_buffer_storeItLi4EEEvPKT_PS1_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 112
; NumSgprs: 36
; NumVgprs: 8
; NumAgprs: 0
; TotalNumVgprs: 8
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck21amd_buffer_atomic_addIfLi1EEEvPKT_PS1_ii ; -- Begin function _ZN2ck21amd_buffer_atomic_addIfLi1EEEvPKT_PS1_ii
	.globl	_ZN2ck21amd_buffer_atomic_addIfLi1EEEvPKT_PS1_ii
	.p2align	2
	.type	_ZN2ck21amd_buffer_atomic_addIfLi1EEEvPKT_PS1_ii,@function
_ZN2ck21amd_buffer_atomic_addIfLi1EEEvPKT_PS1_ii: ; @_ZN2ck21amd_buffer_atomic_addIfLi1EEEvPKT_PS1_ii
_ZN2ck21amd_buffer_atomic_addIfLi1EEEvPKT_PS1_ii$local:
.Lfunc_begin26:
	.loc	5 742 0                 ; ./amd_buffer_addressing.hpp:742:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp57:
	.loc	5 756 9 prologue_end    ; ./amd_buffer_addressing.hpp:756:9
	flat_load_dword v0, v[0:1]
	.loc	5 750 31                ; ./amd_buffer_addressing.hpp:750:31
	v_mov_b32_e32 v6, -1
	v_mov_b32_e32 v7, 0x27000
	.loc	5 756 66                ; ./amd_buffer_addressing.hpp:756:66
	v_add_lshl_u32 v1, v5, v4, 2
	.loc	5 755 5                 ; ./amd_buffer_addressing.hpp:755:5
	s_mov_b64 s[6:7], exec
BB26_1:                                 ; =>This Inner Loop Header: Depth=1
	v_readfirstlane_b32 s8, v2
	v_readfirstlane_b32 s9, v3
	v_readfirstlane_b32 s10, v6
	v_readfirstlane_b32 s11, v7
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]
	s_and_b64 s[4:5], vcc, s[4:5]
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_nop 0
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_nop 0
	buffer_atomic_add_f32 v0, v1, s[8:11], 0 offen
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB26_1
; %bb.2:
	s_mov_b64 exec, s[6:7]
	.loc	5 757 1                 ; ./amd_buffer_addressing.hpp:757:1
	s_waitcnt vmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp58:
.Lfunc_end26:
	.size	_ZN2ck21amd_buffer_atomic_addIfLi1EEEvPKT_PS1_ii, .Lfunc_end26-_ZN2ck21amd_buffer_atomic_addIfLi1EEEvPKT_PS1_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 112
; NumSgprs: 36
; NumVgprs: 8
; NumAgprs: 0
; TotalNumVgprs: 8
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck21amd_buffer_atomic_addIfLi2EEEvPKT_PS1_ii ; -- Begin function _ZN2ck21amd_buffer_atomic_addIfLi2EEEvPKT_PS1_ii
	.globl	_ZN2ck21amd_buffer_atomic_addIfLi2EEEvPKT_PS1_ii
	.p2align	2
	.type	_ZN2ck21amd_buffer_atomic_addIfLi2EEEvPKT_PS1_ii,@function
_ZN2ck21amd_buffer_atomic_addIfLi2EEEvPKT_PS1_ii: ; @_ZN2ck21amd_buffer_atomic_addIfLi2EEEvPKT_PS1_ii
_ZN2ck21amd_buffer_atomic_addIfLi2EEEvPKT_PS1_ii$local:
.Lfunc_begin27:
	.loc	5 764 0                 ; ./amd_buffer_addressing.hpp:764:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp59:
	.loc	5 756 9 prologue_end    ; ./amd_buffer_addressing.hpp:756:9
	flat_load_dword v8, v[0:1]
	.loc	5 0 0 is_stmt 0         ; ./amd_buffer_addressing.hpp:0:0
	v_mov_b32_e32 v6, -1
	v_mov_b32_e32 v7, 0x27000
	.loc	5 756 66                ; ./amd_buffer_addressing.hpp:756:66
	v_add_lshl_u32 v4, v5, v4, 2
	.loc	5 755 5 is_stmt 1       ; ./amd_buffer_addressing.hpp:755:5
	s_mov_b64 s[6:7], exec
BB27_1:                                 ; =>This Inner Loop Header: Depth=1
	v_readfirstlane_b32 s8, v2
	v_readfirstlane_b32 s9, v3
	v_readfirstlane_b32 s10, v6
	v_readfirstlane_b32 s11, v7
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]
	s_and_b64 s[4:5], vcc, s[4:5]
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_nop 0
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_nop 0
	buffer_atomic_add_f32 v8, v4, s[8:11], 0 offen
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB27_1
; %bb.2:
	s_mov_b64 exec, s[6:7]
	s_mov_b64 s[6:7], exec
	s_nop 0
	.loc	5 756 9                 ; ./amd_buffer_addressing.hpp:756:9
	s_nop 0
	flat_load_dword v0, v[0:1] offset:4
BB27_3:                                 ; =>This Inner Loop Header: Depth=1
	.loc	5 755 5                 ; ./amd_buffer_addressing.hpp:755:5
	v_readfirstlane_b32 s8, v2
	v_readfirstlane_b32 s9, v3
	v_readfirstlane_b32 s10, v6
	v_readfirstlane_b32 s11, v7
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]
	s_and_b64 s[4:5], vcc, s[4:5]
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_nop 0
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_nop 0
	buffer_atomic_add_f32 v0, v4, s[8:11], 0 offen offset:4
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB27_3
; %bb.4:
	s_mov_b64 exec, s[6:7]
.Ltmp60:
	.loc	5 770 1                 ; ./amd_buffer_addressing.hpp:770:1
	s_waitcnt vmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp61:
.Lfunc_end27:
	.size	_ZN2ck21amd_buffer_atomic_addIfLi2EEEvPKT_PS1_ii, .Lfunc_end27-_ZN2ck21amd_buffer_atomic_addIfLi2EEEvPKT_PS1_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 200
; NumSgprs: 36
; NumVgprs: 9
; NumAgprs: 0
; TotalNumVgprs: 9
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck21amd_buffer_atomic_addIfLi4EEEvPKT_PS1_ii ; -- Begin function _ZN2ck21amd_buffer_atomic_addIfLi4EEEvPKT_PS1_ii
	.globl	_ZN2ck21amd_buffer_atomic_addIfLi4EEEvPKT_PS1_ii
	.p2align	2
	.type	_ZN2ck21amd_buffer_atomic_addIfLi4EEEvPKT_PS1_ii,@function
_ZN2ck21amd_buffer_atomic_addIfLi4EEEvPKT_PS1_ii: ; @_ZN2ck21amd_buffer_atomic_addIfLi4EEEvPKT_PS1_ii
_ZN2ck21amd_buffer_atomic_addIfLi4EEEvPKT_PS1_ii$local:
.Lfunc_begin28:
	.loc	5 777 0                 ; ./amd_buffer_addressing.hpp:777:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp62:
	.loc	5 756 9 prologue_end    ; ./amd_buffer_addressing.hpp:756:9
	flat_load_dword v8, v[0:1]
	.loc	5 0 0 is_stmt 0         ; ./amd_buffer_addressing.hpp:0:0
	v_mov_b32_e32 v6, -1
	v_mov_b32_e32 v7, 0x27000
	.loc	5 756 66                ; ./amd_buffer_addressing.hpp:756:66
	v_add_lshl_u32 v4, v5, v4, 2
	.loc	5 755 5 is_stmt 1       ; ./amd_buffer_addressing.hpp:755:5
	s_mov_b64 s[6:7], exec
BB28_1:                                 ; =>This Inner Loop Header: Depth=1
	v_readfirstlane_b32 s8, v2
	v_readfirstlane_b32 s9, v3
	v_readfirstlane_b32 s10, v6
	v_readfirstlane_b32 s11, v7
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]
	s_and_b64 s[4:5], vcc, s[4:5]
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_nop 0
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_nop 0
	buffer_atomic_add_f32 v8, v4, s[8:11], 0 offen
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB28_1
; %bb.2:
	s_mov_b64 exec, s[6:7]
	s_mov_b64 s[6:7], exec
	s_nop 0
	.loc	5 756 9                 ; ./amd_buffer_addressing.hpp:756:9
	s_nop 0
	flat_load_dword v5, v[0:1] offset:4
BB28_3:                                 ; =>This Inner Loop Header: Depth=1
	.loc	5 755 5                 ; ./amd_buffer_addressing.hpp:755:5
	v_readfirstlane_b32 s8, v2
	v_readfirstlane_b32 s9, v3
	v_readfirstlane_b32 s10, v6
	v_readfirstlane_b32 s11, v7
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]
	s_and_b64 s[4:5], vcc, s[4:5]
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_nop 0
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_nop 0
	buffer_atomic_add_f32 v5, v4, s[8:11], 0 offen offset:4
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB28_3
; %bb.4:
	s_mov_b64 exec, s[6:7]
	s_mov_b64 s[6:7], exec
	s_nop 0
	.loc	5 756 9                 ; ./amd_buffer_addressing.hpp:756:9
	s_nop 0
	flat_load_dword v5, v[0:1] offset:8
BB28_5:                                 ; =>This Inner Loop Header: Depth=1
	.loc	5 755 5                 ; ./amd_buffer_addressing.hpp:755:5
	v_readfirstlane_b32 s8, v2
	v_readfirstlane_b32 s9, v3
	v_readfirstlane_b32 s10, v6
	v_readfirstlane_b32 s11, v7
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]
	s_and_b64 s[4:5], vcc, s[4:5]
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_nop 0
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_nop 0
	buffer_atomic_add_f32 v5, v4, s[8:11], 0 offen offset:8
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB28_5
; %bb.6:
	s_mov_b64 exec, s[6:7]
	s_mov_b64 s[6:7], exec
	s_nop 0
	.loc	5 756 9                 ; ./amd_buffer_addressing.hpp:756:9
	s_nop 0
	flat_load_dword v0, v[0:1] offset:12
BB28_7:                                 ; =>This Inner Loop Header: Depth=1
	.loc	5 755 5                 ; ./amd_buffer_addressing.hpp:755:5
	v_readfirstlane_b32 s8, v2
	v_readfirstlane_b32 s9, v3
	v_readfirstlane_b32 s10, v6
	v_readfirstlane_b32 s11, v7
	v_cmp_eq_u64_e32 vcc, s[8:9], v[2:3]
	v_cmp_eq_u64_e64 s[4:5], s[10:11], v[6:7]
	s_and_b64 s[4:5], vcc, s[4:5]
	s_and_saveexec_b64 s[4:5], s[4:5]
	s_nop 0
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_nop 0
	buffer_atomic_add_f32 v0, v4, s[8:11], 0 offen offset:12
	s_xor_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB28_7
; %bb.8:
	s_mov_b64 exec, s[6:7]
.Ltmp63:
	.loc	5 783 1                 ; ./amd_buffer_addressing.hpp:783:1
	s_waitcnt vmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp64:
.Lfunc_end28:
	.size	_ZN2ck21amd_buffer_atomic_addIfLi4EEEvPKT_PS1_ii, .Lfunc_end28-_ZN2ck21amd_buffer_atomic_addIfLi4EEEvPKT_PS1_ii
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 376
; NumSgprs: 36
; NumVgprs: 9
; NumAgprs: 0
; TotalNumVgprs: 9
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck15atomic_add_implIDv2_fEEvPT_S2_ ; -- Begin function _ZN2ck15atomic_add_implIDv2_fEEvPT_S2_
	.globl	_ZN2ck15atomic_add_implIDv2_fEEvPT_S2_
	.p2align	2
	.type	_ZN2ck15atomic_add_implIDv2_fEEvPT_S2_,@function
_ZN2ck15atomic_add_implIDv2_fEEvPT_S2_: ; @_ZN2ck15atomic_add_implIDv2_fEEvPT_S2_
_ZN2ck15atomic_add_implIDv2_fEEvPT_S2_$local:
.Lfunc_begin29:
	.file	6 "/nhwc_miopen/build/kevin/miopen-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp-500d-1bac-474f-b3b3/./in_memory_operation.hpp"
	.loc	6 21 0                  ; ./in_memory_operation.hpp:21:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp65:
	.file	7 "/opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h"
	.loc	7 61 20 prologue_end    ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:61:20
	flat_load_dword v4, v[0:1] glc
	s_mov_b64 s[4:5], 0
	s_mov_b64 s[6:7], 0
BB29_1:                                 ; =>This Inner Loop Header: Depth=1
	.loc	7 65 15                 ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:65:15
	flat_load_dword v6, v[0:1] glc
	.loc	7 0 0 is_stmt 0         ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:0:0
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_mov_b32_e32 v5, v4
	.loc	7 67 15 is_stmt 1       ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:67:15
	v_cmp_eq_u32_e32 vcc, v5, v6
	.loc	7 0 0 is_stmt 0         ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:0:0
	v_mov_b32_e32 v4, v6
	s_or_b64 s[6:7], vcc, s[6:7]
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz BB29_1
; %bb.2:                                ;   in Loop: Header=BB29_1 Depth=1
	s_or_b64 exec, exec, s[6:7]
	.loc	7 69 53 is_stmt 1       ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:69:53
	v_add_f32_e32 v4, v2, v5
	s_mov_b64 s[6:7], 0
	s_nop 0
.Ltmp66:
	.loc	7 19 5                  ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:19:5
	s_nop 0
	flat_atomic_cmpswap v4, v[0:1], v[4:5] glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_eq_u32_e32 vcc, v4, v5
	s_or_b64 s[4:5], vcc, s[4:5]
	s_andn2_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB29_1
.Ltmp67:
; %bb.3:                                ; %_Z9atomicAddPff.exit
	.loc	7 0 5 is_stmt 0         ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:0:5
	s_or_b64 exec, exec, s[4:5]
	s_mov_b64 s[4:5], 0
	s_mov_b64 s[6:7], 0
	s_nop 0
	.loc	7 61 20 is_stmt 1       ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:61:20
	s_nop 0
	flat_load_dword v2, v[0:1] offset:4 glc
BB29_4:                                 ; =>This Inner Loop Header: Depth=1
	.loc	7 65 15                 ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:65:15
	flat_load_dword v4, v[0:1] offset:4 glc
	.loc	7 0 0 is_stmt 0         ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:0:0
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_mov_b32_e32 v5, v2
	.loc	7 67 15 is_stmt 1       ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:67:15
	v_cmp_eq_u32_e32 vcc, v5, v4
	.loc	7 0 0 is_stmt 0         ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:0:0
	v_mov_b32_e32 v2, v4
	s_or_b64 s[6:7], vcc, s[6:7]
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz BB29_4
; %bb.5:                                ;   in Loop: Header=BB29_4 Depth=1
	s_or_b64 exec, exec, s[6:7]
	.loc	7 69 53 is_stmt 1       ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:69:53
	v_add_f32_e32 v4, v3, v5
	s_mov_b64 s[6:7], 0
	s_nop 0
.Ltmp68:
	.loc	7 19 5                  ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:19:5
	s_nop 0
	flat_atomic_cmpswap v2, v[0:1], v[4:5] offset:4 glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_eq_u32_e32 vcc, v2, v5
	s_or_b64 s[4:5], vcc, s[4:5]
	s_andn2_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB29_4
.Ltmp69:
; %bb.6:                                ; %_Z9atomicAddPff.exit.1
	.loc	7 0 5 is_stmt 0         ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:0:5
	s_or_b64 exec, exec, s[4:5]
	.loc	6 29 1 is_stmt 1        ; ./in_memory_operation.hpp:29:1
	s_setpc_b64 s[30:31]
.Ltmp70:
.Lfunc_end29:
	.size	_ZN2ck15atomic_add_implIDv2_fEEvPT_S2_, .Lfunc_end29-_ZN2ck15atomic_add_implIDv2_fEEvPT_S2_
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 224
; NumSgprs: 36
; NumVgprs: 7
; NumAgprs: 0
; TotalNumVgprs: 7
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck15atomic_add_implIDv4_fEEvPT_S2_ ; -- Begin function _ZN2ck15atomic_add_implIDv4_fEEvPT_S2_
	.globl	_ZN2ck15atomic_add_implIDv4_fEEvPT_S2_
	.p2align	2
	.type	_ZN2ck15atomic_add_implIDv4_fEEvPT_S2_,@function
_ZN2ck15atomic_add_implIDv4_fEEvPT_S2_: ; @_ZN2ck15atomic_add_implIDv4_fEEvPT_S2_
_ZN2ck15atomic_add_implIDv4_fEEvPT_S2_$local:
.Lfunc_begin30:
	.loc	6 33 0                  ; ./in_memory_operation.hpp:33:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp71:
	.loc	7 61 20 prologue_end    ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:61:20
	flat_load_dword v6, v[0:1] glc
	s_mov_b64 s[4:5], 0
	s_mov_b64 s[6:7], 0
BB30_1:                                 ; =>This Inner Loop Header: Depth=1
	.loc	7 65 15                 ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:65:15
	flat_load_dword v8, v[0:1] glc
	.loc	7 0 0 is_stmt 0         ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:0:0
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_mov_b32_e32 v7, v6
	.loc	7 67 15 is_stmt 1       ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:67:15
	v_cmp_eq_u32_e32 vcc, v7, v8
	.loc	7 0 0 is_stmt 0         ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:0:0
	v_mov_b32_e32 v6, v8
	s_or_b64 s[6:7], vcc, s[6:7]
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz BB30_1
; %bb.2:                                ;   in Loop: Header=BB30_1 Depth=1
	s_or_b64 exec, exec, s[6:7]
	.loc	7 69 53 is_stmt 1       ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:69:53
	v_add_f32_e32 v6, v2, v7
	s_mov_b64 s[6:7], 0
	s_nop 0
.Ltmp72:
	.loc	7 19 5                  ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:19:5
	s_nop 0
	flat_atomic_cmpswap v6, v[0:1], v[6:7] glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_eq_u32_e32 vcc, v6, v7
	s_or_b64 s[4:5], vcc, s[4:5]
	s_andn2_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB30_1
.Ltmp73:
; %bb.3:                                ; %_Z9atomicAddPff.exit
	.loc	7 0 5 is_stmt 0         ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:0:5
	s_or_b64 exec, exec, s[4:5]
	s_mov_b64 s[4:5], 0
	s_mov_b64 s[6:7], 0
	s_nop 0
	.loc	7 61 20 is_stmt 1       ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:61:20
	s_nop 0
	flat_load_dword v2, v[0:1] offset:4 glc
BB30_4:                                 ; =>This Inner Loop Header: Depth=1
	.loc	7 65 15                 ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:65:15
	flat_load_dword v6, v[0:1] offset:4 glc
	.loc	7 0 0 is_stmt 0         ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:0:0
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_mov_b32_e32 v7, v2
	.loc	7 67 15 is_stmt 1       ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:67:15
	v_cmp_eq_u32_e32 vcc, v7, v6
	.loc	7 0 0 is_stmt 0         ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:0:0
	v_mov_b32_e32 v2, v6
	s_or_b64 s[6:7], vcc, s[6:7]
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz BB30_4
; %bb.5:                                ;   in Loop: Header=BB30_4 Depth=1
	s_or_b64 exec, exec, s[6:7]
	.loc	7 69 53 is_stmt 1       ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:69:53
	v_add_f32_e32 v6, v3, v7
	s_mov_b64 s[6:7], 0
	s_nop 0
.Ltmp74:
	.loc	7 19 5                  ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:19:5
	s_nop 0
	flat_atomic_cmpswap v2, v[0:1], v[6:7] offset:4 glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_eq_u32_e32 vcc, v2, v7
	s_or_b64 s[4:5], vcc, s[4:5]
	s_andn2_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB30_4
.Ltmp75:
; %bb.6:                                ; %_Z9atomicAddPff.exit.1
	.loc	7 0 5 is_stmt 0         ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:0:5
	s_or_b64 exec, exec, s[4:5]
	s_mov_b64 s[4:5], 0
	s_mov_b64 s[6:7], 0
	s_nop 0
	.loc	7 61 20 is_stmt 1       ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:61:20
	s_nop 0
	flat_load_dword v2, v[0:1] offset:8 glc
BB30_7:                                 ; =>This Inner Loop Header: Depth=1
	.loc	7 65 15                 ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:65:15
	flat_load_dword v6, v[0:1] offset:8 glc
	.loc	7 0 0 is_stmt 0         ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:0:0
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_mov_b32_e32 v3, v2
	.loc	7 67 15 is_stmt 1       ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:67:15
	v_cmp_eq_u32_e32 vcc, v3, v6
	.loc	7 0 0 is_stmt 0         ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:0:0
	v_mov_b32_e32 v2, v6
	s_or_b64 s[6:7], vcc, s[6:7]
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz BB30_7
; %bb.8:                                ;   in Loop: Header=BB30_7 Depth=1
	s_or_b64 exec, exec, s[6:7]
	.loc	7 69 53 is_stmt 1       ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:69:53
	v_add_f32_e32 v2, v4, v3
	s_mov_b64 s[6:7], 0
	s_nop 0
.Ltmp76:
	.loc	7 19 5                  ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:19:5
	s_nop 0
	flat_atomic_cmpswap v2, v[0:1], v[2:3] offset:8 glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_eq_u32_e32 vcc, v2, v3
	s_or_b64 s[4:5], vcc, s[4:5]
	s_andn2_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB30_7
.Ltmp77:
; %bb.9:                                ; %_Z9atomicAddPff.exit.2
	.loc	7 0 5 is_stmt 0         ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:0:5
	s_or_b64 exec, exec, s[4:5]
	s_mov_b64 s[4:5], 0
	s_mov_b64 s[6:7], 0
	s_nop 0
	.loc	7 61 20 is_stmt 1       ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:61:20
	s_nop 0
	flat_load_dword v2, v[0:1] offset:12 glc
BB30_10:                                ; =>This Inner Loop Header: Depth=1
	.loc	7 65 15                 ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:65:15
	flat_load_dword v4, v[0:1] offset:12 glc
	.loc	7 0 0 is_stmt 0         ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:0:0
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_mov_b32_e32 v3, v2
	.loc	7 67 15 is_stmt 1       ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:67:15
	v_cmp_eq_u32_e32 vcc, v3, v4
	.loc	7 0 0 is_stmt 0         ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:0:0
	v_mov_b32_e32 v2, v4
	s_or_b64 s[6:7], vcc, s[6:7]
	s_andn2_b64 exec, exec, s[6:7]
	s_cbranch_execnz BB30_10
; %bb.11:                               ;   in Loop: Header=BB30_10 Depth=1
	s_or_b64 exec, exec, s[6:7]
	.loc	7 69 53 is_stmt 1       ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:69:53
	v_add_f32_e32 v2, v5, v3
	s_mov_b64 s[6:7], 0
	s_nop 0
.Ltmp78:
	.loc	7 19 5                  ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:19:5
	s_nop 0
	flat_atomic_cmpswap v2, v[0:1], v[2:3] offset:12 glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_eq_u32_e32 vcc, v2, v3
	s_or_b64 s[4:5], vcc, s[4:5]
	s_andn2_b64 exec, exec, s[4:5]
	s_cbranch_execnz BB30_10
.Ltmp79:
; %bb.12:                               ; %_Z9atomicAddPff.exit.3
	.loc	7 0 5 is_stmt 0         ; /opt/rocm-3.5.0/hip/../include/hip/hcc_detail/hip_atomic.h:0:5
	s_or_b64 exec, exec, s[4:5]
	.loc	6 41 1 is_stmt 1        ; ./in_memory_operation.hpp:41:1
	s_setpc_b64 s[30:31]
.Ltmp80:
.Lfunc_end30:
	.size	_ZN2ck15atomic_add_implIDv4_fEEvPT_S2_, .Lfunc_end30-_ZN2ck15atomic_add_implIDv4_fEEvPT_S2_
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 448
; NumSgprs: 36
; NumVgprs: 9
; NumAgprs: 0
; TotalNumVgprs: 9
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck14block_sync_ldsEv ; -- Begin function _ZN2ck14block_sync_ldsEv
	.globl	_ZN2ck14block_sync_ldsEv
	.p2align	2
	.type	_ZN2ck14block_sync_ldsEv,@function
_ZN2ck14block_sync_ldsEv:               ; @_ZN2ck14block_sync_ldsEv
_ZN2ck14block_sync_ldsEv$local:
.Lfunc_begin31:
	.file	8 "/nhwc_miopen/build/kevin/miopen-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp-500d-1bac-474f-b3b3/./synchronization.hpp"
	.loc	8 11 0                  ; ./synchronization.hpp:11:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp81:
	.loc	8 13 5 prologue_end     ; ./synchronization.hpp:13:5
	;;#ASMSTART
	    s_waitcnt lgkmcnt(0) 
     s_barrier     
	;;#ASMEND
	.loc	8 20 1                  ; ./synchronization.hpp:20:1
	s_setpc_b64 s[30:31]
.Ltmp82:
.Lfunc_end31:
	.size	_ZN2ck14block_sync_ldsEv, .Lfunc_end31-_ZN2ck14block_sync_ldsEv
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 24
; NumSgprs: 36
; NumVgprs: 0
; NumAgprs: 0
; TotalNumVgprs: 0
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck19block_sync_lds_vmemEv ; -- Begin function _ZN2ck19block_sync_lds_vmemEv
	.globl	_ZN2ck19block_sync_lds_vmemEv
	.p2align	2
	.type	_ZN2ck19block_sync_lds_vmemEv,@function
_ZN2ck19block_sync_lds_vmemEv:          ; @_ZN2ck19block_sync_lds_vmemEv
_ZN2ck19block_sync_lds_vmemEv$local:
.Lfunc_begin32:
	.loc	8 22 0                  ; ./synchronization.hpp:22:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp83:
	.loc	8 22 54 prologue_end    ; ./synchronization.hpp:22:54
	s_barrier
	.loc	8 22 81 is_stmt 0       ; ./synchronization.hpp:22:81
	s_setpc_b64 s[30:31]
.Ltmp84:
.Lfunc_end32:
	.size	_ZN2ck19block_sync_lds_vmemEv, .Lfunc_end32-_ZN2ck19block_sync_lds_vmemEv
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 12
; NumSgprs: 36
; NumVgprs: 0
; NumAgprs: 0
; TotalNumVgprs: 0
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck30amd_assembly_outer_product_1x2EDv2_DF16_S0_S0_RfS1_ ; -- Begin function _ZN2ck30amd_assembly_outer_product_1x2EDv2_DF16_S0_S0_RfS1_
	.globl	_ZN2ck30amd_assembly_outer_product_1x2EDv2_DF16_S0_S0_RfS1_
	.p2align	2
	.type	_ZN2ck30amd_assembly_outer_product_1x2EDv2_DF16_S0_S0_RfS1_,@function
_ZN2ck30amd_assembly_outer_product_1x2EDv2_DF16_S0_S0_RfS1_: ; @_ZN2ck30amd_assembly_outer_product_1x2EDv2_DF16_S0_S0_RfS1_
_ZN2ck30amd_assembly_outer_product_1x2EDv2_DF16_S0_S0_RfS1_$local:
.Lfunc_begin33:
	.file	9 "/nhwc_miopen/build/kevin/miopen-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp-500d-1bac-474f-b3b3/./amd_inline_asm.hpp"
	.loc	9 39 0 is_stmt 1        ; ./amd_inline_asm.hpp:39:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp85:
	.loc	9 40 5 prologue_end     ; ./amd_inline_asm.hpp:40:5
	flat_load_dword v8, v[5:6]
	flat_load_dword v7, v[3:4]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	;;#ASMSTART
	
             v_dot2_f32_f16 v7, v0, v1, v7
             v_dot2_f32_f16 v8, v0, v2, v8
             
	;;#ASMEND
	s_nop 0
	s_nop 0
	flat_store_dword v[3:4], v7
	flat_store_dword v[5:6], v8
	.loc	9 50 1                  ; ./amd_inline_asm.hpp:50:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp86:
.Lfunc_end33:
	.size	_ZN2ck30amd_assembly_outer_product_1x2EDv2_DF16_S0_S0_RfS1_, .Lfunc_end33-_ZN2ck30amd_assembly_outer_product_1x2EDv2_DF16_S0_S0_RfS1_
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 72
; NumSgprs: 36
; NumVgprs: 9
; NumAgprs: 0
; TotalNumVgprs: 9
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck30amd_assembly_outer_product_1x2EDv4_DF16_S0_S0_RfS1_ ; -- Begin function _ZN2ck30amd_assembly_outer_product_1x2EDv4_DF16_S0_S0_RfS1_
	.globl	_ZN2ck30amd_assembly_outer_product_1x2EDv4_DF16_S0_S0_RfS1_
	.p2align	2
	.type	_ZN2ck30amd_assembly_outer_product_1x2EDv4_DF16_S0_S0_RfS1_,@function
_ZN2ck30amd_assembly_outer_product_1x2EDv4_DF16_S0_S0_RfS1_: ; @_ZN2ck30amd_assembly_outer_product_1x2EDv4_DF16_S0_S0_RfS1_
_ZN2ck30amd_assembly_outer_product_1x2EDv4_DF16_S0_S0_RfS1_$local:
.Lfunc_begin34:
	.loc	9 55 0                  ; ./amd_inline_asm.hpp:55:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp87:
	.loc	9 61 5 prologue_end     ; ./amd_inline_asm.hpp:61:5
	flat_load_dword v11, v[8:9]
	flat_load_dword v10, v[6:7]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	;;#ASMSTART
	
             v_dot2_f32_f16 v10, v0, v2, v10
             v_dot2_f32_f16 v11, v0, v4, v11
             v_dot2_f32_f16 v10, v1, v3, v10
             v_dot2_f32_f16 v11, v1, v5, v11
             
	;;#ASMEND
	s_nop 0
	s_nop 0
	flat_store_dword v[6:7], v10
	flat_store_dword v[8:9], v11
	.loc	9 76 1                  ; ./amd_inline_asm.hpp:76:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp88:
.Lfunc_end34:
	.size	_ZN2ck30amd_assembly_outer_product_1x2EDv4_DF16_S0_S0_RfS1_, .Lfunc_end34-_ZN2ck30amd_assembly_outer_product_1x2EDv4_DF16_S0_S0_RfS1_
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 88
; NumSgprs: 36
; NumVgprs: 12
; NumAgprs: 0
; TotalNumVgprs: 12
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck30amd_assembly_outer_product_1x4EDv2_DF16_S0_S0_S0_S0_RfS1_S1_S1_ ; -- Begin function _ZN2ck30amd_assembly_outer_product_1x4EDv2_DF16_S0_S0_S0_S0_RfS1_S1_S1_
	.globl	_ZN2ck30amd_assembly_outer_product_1x4EDv2_DF16_S0_S0_S0_S0_RfS1_S1_S1_
	.p2align	2
	.type	_ZN2ck30amd_assembly_outer_product_1x4EDv2_DF16_S0_S0_S0_S0_RfS1_S1_S1_,@function
_ZN2ck30amd_assembly_outer_product_1x4EDv2_DF16_S0_S0_S0_S0_RfS1_S1_S1_: ; @_ZN2ck30amd_assembly_outer_product_1x4EDv2_DF16_S0_S0_S0_S0_RfS1_S1_S1_
_ZN2ck30amd_assembly_outer_product_1x4EDv2_DF16_S0_S0_S0_S0_RfS1_S1_S1_$local:
.Lfunc_begin35:
	.loc	9 88 0                  ; ./amd_inline_asm.hpp:88:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp89:
	.loc	9 89 5 prologue_end     ; ./amd_inline_asm.hpp:89:5
	flat_load_dword v16, v[11:12]
	flat_load_dword v15, v[9:10]
	flat_load_dword v14, v[7:8]
	flat_load_dword v13, v[5:6]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	;;#ASMSTART
	
             v_dot2_f32_f16 v13, v0, v1, v13
             v_dot2_f32_f16 v14, v0, v2, v14
             v_dot2_f32_f16 v15, v0, v3, v15
             v_dot2_f32_f16 v16, v0, v4, v16
             
	;;#ASMEND
	s_nop 0
	s_nop 0
	flat_store_dword v[5:6], v13
	flat_store_dword v[7:8], v14
	flat_store_dword v[9:10], v15
	flat_store_dword v[11:12], v16
	.loc	9 105 1                 ; ./amd_inline_asm.hpp:105:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp90:
.Lfunc_end35:
	.size	_ZN2ck30amd_assembly_outer_product_1x4EDv2_DF16_S0_S0_S0_S0_RfS1_S1_S1_, .Lfunc_end35-_ZN2ck30amd_assembly_outer_product_1x4EDv2_DF16_S0_S0_S0_S0_RfS1_S1_S1_
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 120
; NumSgprs: 36
; NumVgprs: 17
; NumAgprs: 0
; TotalNumVgprs: 17
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck30amd_assembly_outer_product_1x4EDv4_DF16_S0_S0_S0_S0_RfS1_S1_S1_ ; -- Begin function _ZN2ck30amd_assembly_outer_product_1x4EDv4_DF16_S0_S0_S0_S0_RfS1_S1_S1_
	.globl	_ZN2ck30amd_assembly_outer_product_1x4EDv4_DF16_S0_S0_S0_S0_RfS1_S1_S1_
	.p2align	2
	.type	_ZN2ck30amd_assembly_outer_product_1x4EDv4_DF16_S0_S0_S0_S0_RfS1_S1_S1_,@function
_ZN2ck30amd_assembly_outer_product_1x4EDv4_DF16_S0_S0_S0_S0_RfS1_S1_S1_: ; @_ZN2ck30amd_assembly_outer_product_1x4EDv4_DF16_S0_S0_S0_S0_RfS1_S1_S1_
_ZN2ck30amd_assembly_outer_product_1x4EDv4_DF16_S0_S0_S0_S0_RfS1_S1_S1_$local:
.Lfunc_begin36:
	.loc	9 117 0                 ; ./amd_inline_asm.hpp:117:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp91:
	.loc	9 125 5 prologue_end    ; ./amd_inline_asm.hpp:125:5
	flat_load_dword v21, v[16:17]
	flat_load_dword v20, v[14:15]
	flat_load_dword v19, v[12:13]
	flat_load_dword v18, v[10:11]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	;;#ASMSTART
	
             v_dot2_f32_f16 v18, v0, v2,  v18
             v_dot2_f32_f16 v19, v0, v4,  v19
             v_dot2_f32_f16 v20, v0, v6, v20
             v_dot2_f32_f16 v21, v0, v8, v21
             v_dot2_f32_f16 v18, v1, v3,  v18
             v_dot2_f32_f16 v19, v1, v5,  v19
             v_dot2_f32_f16 v20, v1, v7, v20
             v_dot2_f32_f16 v21, v1, v9, v21
             
	;;#ASMEND
	s_nop 0
	s_nop 0
	flat_store_dword v[10:11], v18
	flat_store_dword v[12:13], v19
	flat_store_dword v[14:15], v20
	flat_store_dword v[16:17], v21
	.loc	9 150 1                 ; ./amd_inline_asm.hpp:150:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp92:
.Lfunc_end36:
	.size	_ZN2ck30amd_assembly_outer_product_1x4EDv4_DF16_S0_S0_S0_S0_RfS1_S1_S1_, .Lfunc_end36-_ZN2ck30amd_assembly_outer_product_1x4EDv4_DF16_S0_S0_S0_S0_RfS1_S1_S1_
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 152
; NumSgprs: 36
; NumVgprs: 22
; NumAgprs: 0
; TotalNumVgprs: 22
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck19gcnasm_accvgpr_readILi4EEEvPf ; -- Begin function _ZN2ck19gcnasm_accvgpr_readILi4EEEvPf
	.globl	_ZN2ck19gcnasm_accvgpr_readILi4EEEvPf
	.p2align	2
	.type	_ZN2ck19gcnasm_accvgpr_readILi4EEEvPf,@function
_ZN2ck19gcnasm_accvgpr_readILi4EEEvPf:  ; @_ZN2ck19gcnasm_accvgpr_readILi4EEEvPf
_ZN2ck19gcnasm_accvgpr_readILi4EEEvPf$local:
.Lfunc_begin37:
	.file	10 "/nhwc_miopen/build/kevin/miopen-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp-500d-1bac-474f-b3b3/./amd_xdlops.hpp"
	.loc	10 184 0                ; ./amd_xdlops.hpp:184:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp93:
	.loc	10 190 1 prologue_end   ; ./amd_xdlops.hpp:190:1
	s_setpc_b64 s[30:31]
.Ltmp94:
.Lfunc_end37:
	.size	_ZN2ck19gcnasm_accvgpr_readILi4EEEvPf, .Lfunc_end37-_ZN2ck19gcnasm_accvgpr_readILi4EEEvPf
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 8
; NumSgprs: 36
; NumVgprs: 0
; NumAgprs: 0
; TotalNumVgprs: 0
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck19gcnasm_accvgpr_readILi8EEEvPf ; -- Begin function _ZN2ck19gcnasm_accvgpr_readILi8EEEvPf
	.globl	_ZN2ck19gcnasm_accvgpr_readILi8EEEvPf
	.p2align	2
	.type	_ZN2ck19gcnasm_accvgpr_readILi8EEEvPf,@function
_ZN2ck19gcnasm_accvgpr_readILi8EEEvPf:  ; @_ZN2ck19gcnasm_accvgpr_readILi8EEEvPf
_ZN2ck19gcnasm_accvgpr_readILi8EEEvPf$local:
.Lfunc_begin38:
	.loc	10 194 0                ; ./amd_xdlops.hpp:194:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp95:
	.loc	10 220 1 prologue_end   ; ./amd_xdlops.hpp:220:1
	s_setpc_b64 s[30:31]
.Ltmp96:
.Lfunc_end38:
	.size	_ZN2ck19gcnasm_accvgpr_readILi8EEEvPf, .Lfunc_end38-_ZN2ck19gcnasm_accvgpr_readILi8EEEvPf
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 8
; NumSgprs: 36
; NumVgprs: 0
; NumAgprs: 0
; TotalNumVgprs: 0
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck19gcnasm_accvgpr_readILi16EEEvPf ; -- Begin function _ZN2ck19gcnasm_accvgpr_readILi16EEEvPf
	.globl	_ZN2ck19gcnasm_accvgpr_readILi16EEEvPf
	.p2align	2
	.type	_ZN2ck19gcnasm_accvgpr_readILi16EEEvPf,@function
_ZN2ck19gcnasm_accvgpr_readILi16EEEvPf: ; @_ZN2ck19gcnasm_accvgpr_readILi16EEEvPf
_ZN2ck19gcnasm_accvgpr_readILi16EEEvPf$local:
.Lfunc_begin39:
	.loc	10 224 0                ; ./amd_xdlops.hpp:224:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp97:
	.loc	10 266 1 prologue_end   ; ./amd_xdlops.hpp:266:1
	s_setpc_b64 s[30:31]
.Ltmp98:
.Lfunc_end39:
	.size	_ZN2ck19gcnasm_accvgpr_readILi16EEEvPf, .Lfunc_end39-_ZN2ck19gcnasm_accvgpr_readILi16EEEvPf
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 8
; NumSgprs: 36
; NumVgprs: 0
; NumAgprs: 0
; TotalNumVgprs: 0
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck19gcnasm_accvgpr_readILi32EEEvPf ; -- Begin function _ZN2ck19gcnasm_accvgpr_readILi32EEEvPf
	.globl	_ZN2ck19gcnasm_accvgpr_readILi32EEEvPf
	.p2align	2
	.type	_ZN2ck19gcnasm_accvgpr_readILi32EEEvPf,@function
_ZN2ck19gcnasm_accvgpr_readILi32EEEvPf: ; @_ZN2ck19gcnasm_accvgpr_readILi32EEEvPf
_ZN2ck19gcnasm_accvgpr_readILi32EEEvPf$local:
.Lfunc_begin40:
	.loc	10 270 0                ; ./amd_xdlops.hpp:270:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp99:
	.loc	10 343 1 prologue_end   ; ./amd_xdlops.hpp:343:1
	s_setpc_b64 s[30:31]
.Ltmp100:
.Lfunc_end40:
	.size	_ZN2ck19gcnasm_accvgpr_readILi32EEEvPf, .Lfunc_end40-_ZN2ck19gcnasm_accvgpr_readILi32EEEvPf
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 8
; NumSgprs: 36
; NumVgprs: 0
; NumAgprs: 0
; TotalNumVgprs: 0
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck19gcnasm_accvgpr_readILi64EEEvPf ; -- Begin function _ZN2ck19gcnasm_accvgpr_readILi64EEEvPf
	.globl	_ZN2ck19gcnasm_accvgpr_readILi64EEEvPf
	.p2align	2
	.type	_ZN2ck19gcnasm_accvgpr_readILi64EEEvPf,@function
_ZN2ck19gcnasm_accvgpr_readILi64EEEvPf: ; @_ZN2ck19gcnasm_accvgpr_readILi64EEEvPf
_ZN2ck19gcnasm_accvgpr_readILi64EEEvPf$local:
.Lfunc_begin41:
	.loc	10 347 0                ; ./amd_xdlops.hpp:347:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp101:
	.loc	10 484 1 prologue_end   ; ./amd_xdlops.hpp:484:1
	s_setpc_b64 s[30:31]
.Ltmp102:
.Lfunc_end41:
	.size	_ZN2ck19gcnasm_accvgpr_readILi64EEEvPf, .Lfunc_end41-_ZN2ck19gcnasm_accvgpr_readILi64EEEvPf
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 8
; NumSgprs: 36
; NumVgprs: 0
; NumAgprs: 0
; TotalNumVgprs: 0
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck19gcnasm_accvgpr_zeroILi4EEEvv ; -- Begin function _ZN2ck19gcnasm_accvgpr_zeroILi4EEEvv
	.globl	_ZN2ck19gcnasm_accvgpr_zeroILi4EEEvv
	.p2align	2
	.type	_ZN2ck19gcnasm_accvgpr_zeroILi4EEEvv,@function
_ZN2ck19gcnasm_accvgpr_zeroILi4EEEvv:   ; @_ZN2ck19gcnasm_accvgpr_zeroILi4EEEvv
_ZN2ck19gcnasm_accvgpr_zeroILi4EEEvv$local:
.Lfunc_begin42:
	.loc	10 491 0                ; ./amd_xdlops.hpp:491:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp103:
	.loc	10 496 1 prologue_end   ; ./amd_xdlops.hpp:496:1
	s_setpc_b64 s[30:31]
.Ltmp104:
.Lfunc_end42:
	.size	_ZN2ck19gcnasm_accvgpr_zeroILi4EEEvv, .Lfunc_end42-_ZN2ck19gcnasm_accvgpr_zeroILi4EEEvv
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 8
; NumSgprs: 36
; NumVgprs: 0
; NumAgprs: 0
; TotalNumVgprs: 0
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck19gcnasm_accvgpr_zeroILi8EEEvv ; -- Begin function _ZN2ck19gcnasm_accvgpr_zeroILi8EEEvv
	.globl	_ZN2ck19gcnasm_accvgpr_zeroILi8EEEvv
	.p2align	2
	.type	_ZN2ck19gcnasm_accvgpr_zeroILi8EEEvv,@function
_ZN2ck19gcnasm_accvgpr_zeroILi8EEEvv:   ; @_ZN2ck19gcnasm_accvgpr_zeroILi8EEEvv
_ZN2ck19gcnasm_accvgpr_zeroILi8EEEvv$local:
.Lfunc_begin43:
	.loc	10 500 0                ; ./amd_xdlops.hpp:500:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp105:
	.loc	10 506 1 prologue_end   ; ./amd_xdlops.hpp:506:1
	s_setpc_b64 s[30:31]
.Ltmp106:
.Lfunc_end43:
	.size	_ZN2ck19gcnasm_accvgpr_zeroILi8EEEvv, .Lfunc_end43-_ZN2ck19gcnasm_accvgpr_zeroILi8EEEvv
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 8
; NumSgprs: 36
; NumVgprs: 0
; NumAgprs: 0
; TotalNumVgprs: 0
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck19gcnasm_accvgpr_zeroILi16EEEvv ; -- Begin function _ZN2ck19gcnasm_accvgpr_zeroILi16EEEvv
	.globl	_ZN2ck19gcnasm_accvgpr_zeroILi16EEEvv
	.p2align	2
	.type	_ZN2ck19gcnasm_accvgpr_zeroILi16EEEvv,@function
_ZN2ck19gcnasm_accvgpr_zeroILi16EEEvv:  ; @_ZN2ck19gcnasm_accvgpr_zeroILi16EEEvv
_ZN2ck19gcnasm_accvgpr_zeroILi16EEEvv$local:
.Lfunc_begin44:
	.loc	10 510 0                ; ./amd_xdlops.hpp:510:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp107:
	.loc	10 515 1 prologue_end   ; ./amd_xdlops.hpp:515:1
	s_setpc_b64 s[30:31]
.Ltmp108:
.Lfunc_end44:
	.size	_ZN2ck19gcnasm_accvgpr_zeroILi16EEEvv, .Lfunc_end44-_ZN2ck19gcnasm_accvgpr_zeroILi16EEEvv
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 8
; NumSgprs: 36
; NumVgprs: 0
; NumAgprs: 0
; TotalNumVgprs: 0
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck19gcnasm_accvgpr_zeroILi32EEEvv ; -- Begin function _ZN2ck19gcnasm_accvgpr_zeroILi32EEEvv
	.globl	_ZN2ck19gcnasm_accvgpr_zeroILi32EEEvv
	.p2align	2
	.type	_ZN2ck19gcnasm_accvgpr_zeroILi32EEEvv,@function
_ZN2ck19gcnasm_accvgpr_zeroILi32EEEvv:  ; @_ZN2ck19gcnasm_accvgpr_zeroILi32EEEvv
_ZN2ck19gcnasm_accvgpr_zeroILi32EEEvv$local:
.Lfunc_begin45:
	.loc	10 519 0                ; ./amd_xdlops.hpp:519:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp109:
	.loc	10 525 1 prologue_end   ; ./amd_xdlops.hpp:525:1
	s_setpc_b64 s[30:31]
.Ltmp110:
.Lfunc_end45:
	.size	_ZN2ck19gcnasm_accvgpr_zeroILi32EEEvv, .Lfunc_end45-_ZN2ck19gcnasm_accvgpr_zeroILi32EEEvv
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 8
; NumSgprs: 36
; NumVgprs: 0
; NumAgprs: 0
; TotalNumVgprs: 0
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck19gcnasm_accvgpr_zeroILi64EEEvv ; -- Begin function _ZN2ck19gcnasm_accvgpr_zeroILi64EEEvv
	.globl	_ZN2ck19gcnasm_accvgpr_zeroILi64EEEvv
	.p2align	2
	.type	_ZN2ck19gcnasm_accvgpr_zeroILi64EEEvv,@function
_ZN2ck19gcnasm_accvgpr_zeroILi64EEEvv:  ; @_ZN2ck19gcnasm_accvgpr_zeroILi64EEEvv
_ZN2ck19gcnasm_accvgpr_zeroILi64EEEvv$local:
.Lfunc_begin46:
	.loc	10 529 0                ; ./amd_xdlops.hpp:529:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp111:
	.loc	10 534 1 prologue_end   ; ./amd_xdlops.hpp:534:1
	s_setpc_b64 s[30:31]
.Ltmp112:
.Lfunc_end46:
	.size	_ZN2ck19gcnasm_accvgpr_zeroILi64EEEvv, .Lfunc_end46-_ZN2ck19gcnasm_accvgpr_zeroILi64EEEvv
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 8
; NumSgprs: 36
; NumVgprs: 0
; NumAgprs: 0
; TotalNumVgprs: 0
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck10gcnasm_nopILi8EEEvv ; -- Begin function _ZN2ck10gcnasm_nopILi8EEEvv
	.globl	_ZN2ck10gcnasm_nopILi8EEEvv
	.p2align	2
	.type	_ZN2ck10gcnasm_nopILi8EEEvv,@function
_ZN2ck10gcnasm_nopILi8EEEvv:            ; @_ZN2ck10gcnasm_nopILi8EEEvv
_ZN2ck10gcnasm_nopILi8EEEvv$local:
.Lfunc_begin47:
	.loc	10 541 0                ; ./amd_xdlops.hpp:541:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp113:
	.loc	10 545 1 prologue_end   ; ./amd_xdlops.hpp:545:1
	s_setpc_b64 s[30:31]
.Ltmp114:
.Lfunc_end47:
	.size	_ZN2ck10gcnasm_nopILi8EEEvv, .Lfunc_end47-_ZN2ck10gcnasm_nopILi8EEEvv
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 8
; NumSgprs: 36
; NumVgprs: 0
; NumAgprs: 0
; TotalNumVgprs: 0
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck10gcnasm_nopILi32EEEvv ; -- Begin function _ZN2ck10gcnasm_nopILi32EEEvv
	.globl	_ZN2ck10gcnasm_nopILi32EEEvv
	.p2align	2
	.type	_ZN2ck10gcnasm_nopILi32EEEvv,@function
_ZN2ck10gcnasm_nopILi32EEEvv:           ; @_ZN2ck10gcnasm_nopILi32EEEvv
_ZN2ck10gcnasm_nopILi32EEEvv$local:
.Lfunc_begin48:
	.loc	10 549 0                ; ./amd_xdlops.hpp:549:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp115:
	.loc	10 553 1 prologue_end   ; ./amd_xdlops.hpp:553:1
	s_setpc_b64 s[30:31]
.Ltmp116:
.Lfunc_end48:
	.size	_ZN2ck10gcnasm_nopILi32EEEvv, .Lfunc_end48-_ZN2ck10gcnasm_nopILi32EEEvv
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 8
; NumSgprs: 36
; NumVgprs: 0
; NumAgprs: 0
; TotalNumVgprs: 0
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck10gcnasm_nopILi64EEEvv ; -- Begin function _ZN2ck10gcnasm_nopILi64EEEvv
	.globl	_ZN2ck10gcnasm_nopILi64EEEvv
	.p2align	2
	.type	_ZN2ck10gcnasm_nopILi64EEEvv,@function
_ZN2ck10gcnasm_nopILi64EEEvv:           ; @_ZN2ck10gcnasm_nopILi64EEEvv
_ZN2ck10gcnasm_nopILi64EEEvv$local:
.Lfunc_begin49:
	.loc	10 557 0                ; ./amd_xdlops.hpp:557:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp117:
	.loc	10 562 1 prologue_end   ; ./amd_xdlops.hpp:562:1
	s_setpc_b64 s[30:31]
.Ltmp118:
.Lfunc_end49:
	.size	_ZN2ck10gcnasm_nopILi64EEEvv, .Lfunc_end49-_ZN2ck10gcnasm_nopILi64EEEvv
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 8
; NumSgprs: 36
; NumVgprs: 0
; NumAgprs: 0
; TotalNumVgprs: 0
; ScratchSize: 0
; MemoryBound: 0
	.text
	.hidden	_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi64ELi64EEEvRKfS2_PDv32_f ; -- Begin function _ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi64ELi64EEEvRKfS2_PDv32_f
	.globl	_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi64ELi64EEEvRKfS2_PDv32_f
	.p2align	2
	.type	_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi64ELi64EEEvRKfS2_PDv32_f,@function
_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi64ELi64EEEvRKfS2_PDv32_f: ; @_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi64ELi64EEEvRKfS2_PDv32_f
_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi64ELi64EEEvRKfS2_PDv32_f$local:
.Lfunc_begin50:
	.loc	10 569 0                ; ./amd_xdlops.hpp:569:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp119:
	.loc	10 575 55 prologue_end  ; ./amd_xdlops.hpp:575:55
	flat_load_dword v38, v[0:1]
	.loc	10 575 62 is_stmt 0     ; ./amd_xdlops.hpp:575:62
	flat_load_dword v39, v[2:3]
	.loc	10 575 69               ; ./amd_xdlops.hpp:575:69
	flat_load_dwordx4 v[34:37], v[4:5] offset:112
	flat_load_dwordx4 v[30:33], v[4:5] offset:96
	flat_load_dwordx4 v[26:29], v[4:5] offset:80
	flat_load_dwordx4 v[22:25], v[4:5] offset:64
	flat_load_dwordx4 v[18:21], v[4:5] offset:48
	flat_load_dwordx4 v[14:17], v[4:5] offset:32
	flat_load_dwordx4 v[10:13], v[4:5] offset:16
	flat_load_dwordx4 v[6:9], v[4:5]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	v_accvgpr_write_b32 a4, v10
	v_accvgpr_write_b32 a5, v11
	v_accvgpr_write_b32 a6, v12
	v_accvgpr_write_b32 a7, v13
	v_accvgpr_write_b32 a8, v14
	v_accvgpr_write_b32 a9, v15
	v_accvgpr_write_b32 a10, v16
	v_accvgpr_write_b32 a11, v17
	v_accvgpr_write_b32 a12, v18
	v_accvgpr_write_b32 a13, v19
	v_accvgpr_write_b32 a14, v20
	v_accvgpr_write_b32 a15, v21
	v_accvgpr_write_b32 a16, v22
	v_accvgpr_write_b32 a17, v23
	v_accvgpr_write_b32 a18, v24
	v_accvgpr_write_b32 a19, v25
	v_accvgpr_write_b32 a20, v26
	v_accvgpr_write_b32 a21, v27
	v_accvgpr_write_b32 a22, v28
	v_accvgpr_write_b32 a23, v29
	v_accvgpr_write_b32 a24, v30
	v_accvgpr_write_b32 a25, v31
	v_accvgpr_write_b32 a26, v32
	v_accvgpr_write_b32 a27, v33
	v_accvgpr_write_b32 a28, v34
	v_accvgpr_write_b32 a29, v35
	v_accvgpr_write_b32 a30, v36
	v_accvgpr_write_b32 a31, v37
	.loc	10 576 69 is_stmt 1     ; ./amd_xdlops.hpp:576:69
	s_nop 0
	s_nop 0
	flat_load_dwordx4 v[34:37], v[4:5] offset:240
	flat_load_dwordx4 v[30:33], v[4:5] offset:224
	flat_load_dwordx4 v[26:29], v[4:5] offset:208
	flat_load_dwordx4 v[22:25], v[4:5] offset:192
	flat_load_dwordx4 v[18:21], v[4:5] offset:176
	flat_load_dwordx4 v[14:17], v[4:5] offset:160
	flat_load_dwordx4 v[10:13], v[4:5] offset:144
	flat_load_dwordx4 v[6:9], v[4:5] offset:128
	.loc	10 575 16               ; ./amd_xdlops.hpp:575:16
	v_mfma_f32_32x32x1f32 a[0:31], v38, v39, a[0:31] cbsz:1
	.loc	10 576 69               ; ./amd_xdlops.hpp:576:69
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a63, v37
	v_accvgpr_write_b32 a62, v36
	v_accvgpr_write_b32 a61, v35
	v_accvgpr_write_b32 a60, v34
	v_accvgpr_write_b32 a59, v33
	v_accvgpr_write_b32 a58, v32
	v_accvgpr_write_b32 a57, v31
	v_accvgpr_write_b32 a56, v30
	v_accvgpr_write_b32 a55, v29
	v_accvgpr_write_b32 a54, v28
	v_accvgpr_write_b32 a53, v27
	v_accvgpr_write_b32 a52, v26
	v_accvgpr_write_b32 a51, v25
	v_accvgpr_write_b32 a50, v24
	v_accvgpr_write_b32 a49, v23
	v_accvgpr_write_b32 a48, v22
	v_accvgpr_write_b32 a47, v21
	v_accvgpr_write_b32 a46, v20
	v_accvgpr_write_b32 a45, v19
	v_accvgpr_write_b32 a44, v18
	v_accvgpr_write_b32 a43, v17
	v_accvgpr_write_b32 a42, v16
	v_accvgpr_write_b32 a41, v15
	v_accvgpr_write_b32 a40, v14
	v_accvgpr_write_b32 a39, v13
	v_accvgpr_write_b32 a38, v12
	v_accvgpr_write_b32 a37, v11
	v_accvgpr_write_b32 a36, v10
	v_accvgpr_write_b32 a35, v9
	v_accvgpr_write_b32 a34, v8
	v_accvgpr_write_b32 a33, v7
	v_accvgpr_write_b32 a32, v6
	.loc	10 575 14               ; ./amd_xdlops.hpp:575:14
	v_accvgpr_read_b32 v9, a27
	v_accvgpr_read_b32 v8, a26
	v_accvgpr_read_b32 v7, a25
	v_accvgpr_read_b32 v6, a24
	v_accvgpr_read_b32 v13, a31
	v_accvgpr_read_b32 v12, a30
	v_accvgpr_read_b32 v11, a29
	v_accvgpr_read_b32 v10, a28
	v_accvgpr_read_b32 v17, a19
	v_accvgpr_read_b32 v16, a18
	v_accvgpr_read_b32 v15, a17
	v_accvgpr_read_b32 v14, a16
	v_accvgpr_read_b32 v21, a23
	v_accvgpr_read_b32 v20, a22
	v_accvgpr_read_b32 v19, a21
	v_accvgpr_read_b32 v18, a20
	v_accvgpr_read_b32 v25, a11
	v_accvgpr_read_b32 v24, a10
	v_accvgpr_read_b32 v23, a9
	v_accvgpr_read_b32 v22, a8
	v_accvgpr_read_b32 v29, a15
	v_accvgpr_read_b32 v28, a14
	v_accvgpr_read_b32 v27, a13
	v_accvgpr_read_b32 v26, a12
	v_accvgpr_read_b32 v33, a3
	v_accvgpr_read_b32 v32, a2
	v_accvgpr_read_b32 v31, a1
	v_accvgpr_read_b32 v30, a0
	v_accvgpr_read_b32 v37, a7
	v_accvgpr_read_b32 v36, a6
	v_accvgpr_read_b32 v35, a5
	v_accvgpr_read_b32 v34, a4
	s_nop 0
	s_nop 0
	flat_store_dwordx4 v[4:5], v[6:9] offset:96
	flat_store_dwordx4 v[4:5], v[10:13] offset:112
	flat_store_dwordx4 v[4:5], v[14:17] offset:64
	flat_store_dwordx4 v[4:5], v[18:21] offset:80
	flat_store_dwordx4 v[4:5], v[22:25] offset:32
	flat_store_dwordx4 v[4:5], v[26:29] offset:48
	flat_store_dwordx4 v[4:5], v[30:33]
	flat_store_dwordx4 v[4:5], v[34:37] offset:16
	.loc	10 576 55               ; ./amd_xdlops.hpp:576:55
	flat_load_dword v6, v[0:1]
	.loc	10 576 62 is_stmt 0     ; ./amd_xdlops.hpp:576:62
	s_nop 0
	s_nop 0
	flat_load_dword v7, v[2:3]
	.loc	10 576 16               ; ./amd_xdlops.hpp:576:16
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_mfma_f32_32x32x1f32 a[0:31], v6, v7, a[32:63] cbsz:1 abid:1
	.loc	10 578 1 is_stmt 1      ; ./amd_xdlops.hpp:578:1
	s_nop 7
	s_nop 7
	s_nop 1
	.loc	10 576 14               ; ./amd_xdlops.hpp:576:14
	v_accvgpr_read_b32 v3, a27
	v_accvgpr_read_b32 v2, a26
	v_accvgpr_read_b32 v1, a25
	v_accvgpr_read_b32 v0, a24
	v_accvgpr_read_b32 v9, a31
	v_accvgpr_read_b32 v8, a30
	v_accvgpr_read_b32 v7, a29
	v_accvgpr_read_b32 v6, a28
	v_accvgpr_read_b32 v13, a19
	v_accvgpr_read_b32 v12, a18
	v_accvgpr_read_b32 v11, a17
	v_accvgpr_read_b32 v10, a16
	v_accvgpr_read_b32 v17, a23
	v_accvgpr_read_b32 v16, a22
	v_accvgpr_read_b32 v15, a21
	v_accvgpr_read_b32 v14, a20
	v_accvgpr_read_b32 v21, a11
	v_accvgpr_read_b32 v20, a10
	v_accvgpr_read_b32 v19, a9
	v_accvgpr_read_b32 v18, a8
	v_accvgpr_read_b32 v25, a15
	v_accvgpr_read_b32 v24, a14
	v_accvgpr_read_b32 v23, a13
	v_accvgpr_read_b32 v22, a12
	v_accvgpr_read_b32 v29, a3
	v_accvgpr_read_b32 v28, a2
	v_accvgpr_read_b32 v27, a1
	v_accvgpr_read_b32 v26, a0
	v_accvgpr_read_b32 v33, a7
	v_accvgpr_read_b32 v32, a6
	v_accvgpr_read_b32 v31, a5
	v_accvgpr_read_b32 v30, a4
	s_nop 0
	s_nop 0
	flat_store_dwordx4 v[4:5], v[0:3] offset:224
	flat_store_dwordx4 v[4:5], v[6:9] offset:240
	flat_store_dwordx4 v[4:5], v[10:13] offset:192
	flat_store_dwordx4 v[4:5], v[14:17] offset:208
	flat_store_dwordx4 v[4:5], v[18:21] offset:160
	flat_store_dwordx4 v[4:5], v[22:25] offset:176
	flat_store_dwordx4 v[4:5], v[26:29] offset:128
	flat_store_dwordx4 v[4:5], v[30:33] offset:144
	.loc	10 578 1                ; ./amd_xdlops.hpp:578:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp120:
.Lfunc_end50:
	.size	_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi64ELi64EEEvRKfS2_PDv32_f, .Lfunc_end50-_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi64ELi64EEEvRKfS2_PDv32_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 1396
; NumSgprs: 36
; NumVgprs: 40
; NumAgprs: 64
; TotalNumVgprs: 64
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi32ELi64EEEvRKfS2_PDv32_f ; -- Begin function _ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi32ELi64EEEvRKfS2_PDv32_f
	.globl	_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi32ELi64EEEvRKfS2_PDv32_f
	.p2align	2
	.type	_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi32ELi64EEEvRKfS2_PDv32_f,@function
_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi32ELi64EEEvRKfS2_PDv32_f: ; @_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi32ELi64EEEvRKfS2_PDv32_f
_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi32ELi64EEEvRKfS2_PDv32_f$local:
.Lfunc_begin51:
	.loc	10 582 0                ; ./amd_xdlops.hpp:582:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp121:
	.loc	10 587 69 prologue_end  ; ./amd_xdlops.hpp:587:69
	flat_load_dwordx4 v[34:37], v[4:5] offset:112
	flat_load_dwordx4 v[30:33], v[4:5] offset:96
	flat_load_dwordx4 v[26:29], v[4:5] offset:80
	flat_load_dwordx4 v[22:25], v[4:5] offset:64
	flat_load_dwordx4 v[18:21], v[4:5] offset:48
	flat_load_dwordx4 v[14:17], v[4:5] offset:32
	flat_load_dwordx4 v[10:13], v[4:5] offset:16
	flat_load_dwordx4 v[6:9], v[4:5]
	.loc	10 587 55 is_stmt 0     ; ./amd_xdlops.hpp:587:55
	flat_load_dword v38, v[0:1]
	.loc	10 589 1 is_stmt 1      ; ./amd_xdlops.hpp:589:1
	s_nop 0
	.loc	10 587 62               ; ./amd_xdlops.hpp:587:62
	s_nop 0
	flat_load_dword v0, v[2:3]
	.loc	10 587 69 is_stmt 0     ; ./amd_xdlops.hpp:587:69
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	v_accvgpr_write_b32 a4, v10
	v_accvgpr_write_b32 a5, v11
	v_accvgpr_write_b32 a6, v12
	v_accvgpr_write_b32 a7, v13
	v_accvgpr_write_b32 a8, v14
	v_accvgpr_write_b32 a9, v15
	v_accvgpr_write_b32 a10, v16
	v_accvgpr_write_b32 a11, v17
	v_accvgpr_write_b32 a12, v18
	v_accvgpr_write_b32 a13, v19
	v_accvgpr_write_b32 a14, v20
	v_accvgpr_write_b32 a15, v21
	v_accvgpr_write_b32 a16, v22
	v_accvgpr_write_b32 a17, v23
	v_accvgpr_write_b32 a18, v24
	v_accvgpr_write_b32 a19, v25
	v_accvgpr_write_b32 a20, v26
	v_accvgpr_write_b32 a21, v27
	v_accvgpr_write_b32 a22, v28
	v_accvgpr_write_b32 a23, v29
	v_accvgpr_write_b32 a24, v30
	v_accvgpr_write_b32 a25, v31
	v_accvgpr_write_b32 a26, v32
	v_accvgpr_write_b32 a27, v33
	v_accvgpr_write_b32 a28, v34
	v_accvgpr_write_b32 a29, v35
	v_accvgpr_write_b32 a30, v36
	v_accvgpr_write_b32 a31, v37
	.loc	10 589 1 is_stmt 1      ; ./amd_xdlops.hpp:589:1
	s_nop 0
	.loc	10 587 16               ; ./amd_xdlops.hpp:587:16
	v_mfma_f32_32x32x1f32 a[0:31], v38, v0, a[0:31] cbsz:1
	.loc	10 589 1                ; ./amd_xdlops.hpp:589:1
	s_nop 7
	s_nop 7
	s_nop 1
	.loc	10 587 14               ; ./amd_xdlops.hpp:587:14
	v_accvgpr_read_b32 v3, a27
	v_accvgpr_read_b32 v2, a26
	v_accvgpr_read_b32 v1, a25
	v_accvgpr_read_b32 v0, a24
	v_accvgpr_read_b32 v9, a31
	v_accvgpr_read_b32 v8, a30
	v_accvgpr_read_b32 v7, a29
	v_accvgpr_read_b32 v6, a28
	v_accvgpr_read_b32 v13, a19
	v_accvgpr_read_b32 v12, a18
	v_accvgpr_read_b32 v11, a17
	v_accvgpr_read_b32 v10, a16
	v_accvgpr_read_b32 v17, a23
	v_accvgpr_read_b32 v16, a22
	v_accvgpr_read_b32 v15, a21
	v_accvgpr_read_b32 v14, a20
	v_accvgpr_read_b32 v21, a11
	v_accvgpr_read_b32 v20, a10
	v_accvgpr_read_b32 v19, a9
	v_accvgpr_read_b32 v18, a8
	v_accvgpr_read_b32 v25, a15
	v_accvgpr_read_b32 v24, a14
	v_accvgpr_read_b32 v23, a13
	v_accvgpr_read_b32 v22, a12
	v_accvgpr_read_b32 v29, a3
	v_accvgpr_read_b32 v28, a2
	v_accvgpr_read_b32 v27, a1
	v_accvgpr_read_b32 v26, a0
	v_accvgpr_read_b32 v33, a7
	v_accvgpr_read_b32 v32, a6
	v_accvgpr_read_b32 v31, a5
	v_accvgpr_read_b32 v30, a4
	s_nop 0
	s_nop 0
	flat_store_dwordx4 v[4:5], v[0:3] offset:96
	flat_store_dwordx4 v[4:5], v[6:9] offset:112
	flat_store_dwordx4 v[4:5], v[10:13] offset:64
	flat_store_dwordx4 v[4:5], v[14:17] offset:80
	flat_store_dwordx4 v[4:5], v[18:21] offset:32
	flat_store_dwordx4 v[4:5], v[22:25] offset:48
	flat_store_dwordx4 v[4:5], v[26:29]
	flat_store_dwordx4 v[4:5], v[30:33] offset:16
	.loc	10 589 1                ; ./amd_xdlops.hpp:589:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp122:
.Lfunc_end51:
	.size	_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi32ELi64EEEvRKfS2_PDv32_f, .Lfunc_end51-_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi32ELi64EEEvRKfS2_PDv32_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 712
; NumSgprs: 36
; NumVgprs: 39
; NumAgprs: 32
; TotalNumVgprs: 39
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi64ELi32EEEvRKfS2_PDv32_f ; -- Begin function _ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi64ELi32EEEvRKfS2_PDv32_f
	.globl	_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi64ELi32EEEvRKfS2_PDv32_f
	.p2align	2
	.type	_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi64ELi32EEEvRKfS2_PDv32_f,@function
_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi64ELi32EEEvRKfS2_PDv32_f: ; @_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi64ELi32EEEvRKfS2_PDv32_f
_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi64ELi32EEEvRKfS2_PDv32_f$local:
.Lfunc_begin52:
	.loc	10 593 0                ; ./amd_xdlops.hpp:593:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp123:
	.loc	10 598 69 prologue_end  ; ./amd_xdlops.hpp:598:69
	flat_load_dwordx4 v[34:37], v[4:5] offset:112
	flat_load_dwordx4 v[30:33], v[4:5] offset:96
	flat_load_dwordx4 v[26:29], v[4:5] offset:80
	flat_load_dwordx4 v[22:25], v[4:5] offset:64
	flat_load_dwordx4 v[18:21], v[4:5] offset:48
	flat_load_dwordx4 v[14:17], v[4:5] offset:32
	flat_load_dwordx4 v[10:13], v[4:5] offset:16
	flat_load_dwordx4 v[6:9], v[4:5]
	.loc	10 598 55 is_stmt 0     ; ./amd_xdlops.hpp:598:55
	flat_load_dword v38, v[0:1]
	.loc	10 600 1 is_stmt 1      ; ./amd_xdlops.hpp:600:1
	s_nop 0
	.loc	10 598 62               ; ./amd_xdlops.hpp:598:62
	s_nop 0
	flat_load_dword v0, v[2:3]
	.loc	10 598 69 is_stmt 0     ; ./amd_xdlops.hpp:598:69
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	v_accvgpr_write_b32 a4, v10
	v_accvgpr_write_b32 a5, v11
	v_accvgpr_write_b32 a6, v12
	v_accvgpr_write_b32 a7, v13
	v_accvgpr_write_b32 a8, v14
	v_accvgpr_write_b32 a9, v15
	v_accvgpr_write_b32 a10, v16
	v_accvgpr_write_b32 a11, v17
	v_accvgpr_write_b32 a12, v18
	v_accvgpr_write_b32 a13, v19
	v_accvgpr_write_b32 a14, v20
	v_accvgpr_write_b32 a15, v21
	v_accvgpr_write_b32 a16, v22
	v_accvgpr_write_b32 a17, v23
	v_accvgpr_write_b32 a18, v24
	v_accvgpr_write_b32 a19, v25
	v_accvgpr_write_b32 a20, v26
	v_accvgpr_write_b32 a21, v27
	v_accvgpr_write_b32 a22, v28
	v_accvgpr_write_b32 a23, v29
	v_accvgpr_write_b32 a24, v30
	v_accvgpr_write_b32 a25, v31
	v_accvgpr_write_b32 a26, v32
	v_accvgpr_write_b32 a27, v33
	v_accvgpr_write_b32 a28, v34
	v_accvgpr_write_b32 a29, v35
	v_accvgpr_write_b32 a30, v36
	v_accvgpr_write_b32 a31, v37
	.loc	10 600 1 is_stmt 1      ; ./amd_xdlops.hpp:600:1
	s_nop 0
	.loc	10 598 16               ; ./amd_xdlops.hpp:598:16
	v_mfma_f32_32x32x1f32 a[0:31], v38, v0, a[0:31] blgp:1
	.loc	10 600 1                ; ./amd_xdlops.hpp:600:1
	s_nop 7
	s_nop 7
	s_nop 1
	.loc	10 598 14               ; ./amd_xdlops.hpp:598:14
	v_accvgpr_read_b32 v3, a27
	v_accvgpr_read_b32 v2, a26
	v_accvgpr_read_b32 v1, a25
	v_accvgpr_read_b32 v0, a24
	v_accvgpr_read_b32 v9, a31
	v_accvgpr_read_b32 v8, a30
	v_accvgpr_read_b32 v7, a29
	v_accvgpr_read_b32 v6, a28
	v_accvgpr_read_b32 v13, a19
	v_accvgpr_read_b32 v12, a18
	v_accvgpr_read_b32 v11, a17
	v_accvgpr_read_b32 v10, a16
	v_accvgpr_read_b32 v17, a23
	v_accvgpr_read_b32 v16, a22
	v_accvgpr_read_b32 v15, a21
	v_accvgpr_read_b32 v14, a20
	v_accvgpr_read_b32 v21, a11
	v_accvgpr_read_b32 v20, a10
	v_accvgpr_read_b32 v19, a9
	v_accvgpr_read_b32 v18, a8
	v_accvgpr_read_b32 v25, a15
	v_accvgpr_read_b32 v24, a14
	v_accvgpr_read_b32 v23, a13
	v_accvgpr_read_b32 v22, a12
	v_accvgpr_read_b32 v29, a3
	v_accvgpr_read_b32 v28, a2
	v_accvgpr_read_b32 v27, a1
	v_accvgpr_read_b32 v26, a0
	v_accvgpr_read_b32 v33, a7
	v_accvgpr_read_b32 v32, a6
	v_accvgpr_read_b32 v31, a5
	v_accvgpr_read_b32 v30, a4
	s_nop 0
	s_nop 0
	flat_store_dwordx4 v[4:5], v[0:3] offset:96
	flat_store_dwordx4 v[4:5], v[6:9] offset:112
	flat_store_dwordx4 v[4:5], v[10:13] offset:64
	flat_store_dwordx4 v[4:5], v[14:17] offset:80
	flat_store_dwordx4 v[4:5], v[18:21] offset:32
	flat_store_dwordx4 v[4:5], v[22:25] offset:48
	flat_store_dwordx4 v[4:5], v[26:29]
	flat_store_dwordx4 v[4:5], v[30:33] offset:16
	.loc	10 600 1                ; ./amd_xdlops.hpp:600:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp124:
.Lfunc_end52:
	.size	_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi64ELi32EEEvRKfS2_PDv32_f, .Lfunc_end52-_ZN2ck26gcnasm_mfma_f32_32x32x1f32ILi64ELi32EEEvRKfS2_PDv32_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 712
; NumSgprs: 36
; NumVgprs: 39
; NumAgprs: 32
; TotalNumVgprs: 39
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck26gcnasm_mfma_f32_32x32x2f32ERKfS1_PDv16_f ; -- Begin function _ZN2ck26gcnasm_mfma_f32_32x32x2f32ERKfS1_PDv16_f
	.globl	_ZN2ck26gcnasm_mfma_f32_32x32x2f32ERKfS1_PDv16_f
	.p2align	2
	.type	_ZN2ck26gcnasm_mfma_f32_32x32x2f32ERKfS1_PDv16_f,@function
_ZN2ck26gcnasm_mfma_f32_32x32x2f32ERKfS1_PDv16_f: ; @_ZN2ck26gcnasm_mfma_f32_32x32x2f32ERKfS1_PDv16_f
_ZN2ck26gcnasm_mfma_f32_32x32x2f32ERKfS1_PDv16_f$local:
.Lfunc_begin53:
	.loc	10 603 0                ; ./amd_xdlops.hpp:603:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp125:
	.loc	10 608 69 prologue_end  ; ./amd_xdlops.hpp:608:69
	flat_load_dwordx4 v[18:21], v[4:5] offset:48
	flat_load_dwordx4 v[14:17], v[4:5] offset:32
	flat_load_dwordx4 v[10:13], v[4:5] offset:16
	flat_load_dwordx4 v[6:9], v[4:5]
	.loc	10 608 55 is_stmt 0     ; ./amd_xdlops.hpp:608:55
	flat_load_dword v22, v[0:1]
	.loc	10 610 1 is_stmt 1      ; ./amd_xdlops.hpp:610:1
	s_nop 0
	.loc	10 608 62               ; ./amd_xdlops.hpp:608:62
	s_nop 0
	flat_load_dword v0, v[2:3]
	.loc	10 608 69 is_stmt 0     ; ./amd_xdlops.hpp:608:69
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	v_accvgpr_write_b32 a4, v10
	v_accvgpr_write_b32 a5, v11
	v_accvgpr_write_b32 a6, v12
	v_accvgpr_write_b32 a7, v13
	v_accvgpr_write_b32 a8, v14
	v_accvgpr_write_b32 a9, v15
	v_accvgpr_write_b32 a10, v16
	v_accvgpr_write_b32 a11, v17
	v_accvgpr_write_b32 a12, v18
	v_accvgpr_write_b32 a13, v19
	v_accvgpr_write_b32 a14, v20
	v_accvgpr_write_b32 a15, v21
	.loc	10 610 1 is_stmt 1      ; ./amd_xdlops.hpp:610:1
	s_nop 0
	.loc	10 608 16               ; ./amd_xdlops.hpp:608:16
	v_mfma_f32_32x32x2f32 a[0:15], v22, v0, a[0:15]
	.loc	10 610 1                ; ./amd_xdlops.hpp:610:1
	s_nop 7
	s_nop 7
	s_nop 1
	.loc	10 608 14               ; ./amd_xdlops.hpp:608:14
	v_accvgpr_read_b32 v3, a11
	v_accvgpr_read_b32 v2, a10
	v_accvgpr_read_b32 v1, a9
	v_accvgpr_read_b32 v0, a8
	v_accvgpr_read_b32 v9, a15
	v_accvgpr_read_b32 v8, a14
	v_accvgpr_read_b32 v7, a13
	v_accvgpr_read_b32 v6, a12
	v_accvgpr_read_b32 v13, a3
	v_accvgpr_read_b32 v12, a2
	v_accvgpr_read_b32 v11, a1
	v_accvgpr_read_b32 v10, a0
	v_accvgpr_read_b32 v17, a7
	v_accvgpr_read_b32 v16, a6
	v_accvgpr_read_b32 v15, a5
	v_accvgpr_read_b32 v14, a4
	s_nop 0
	s_nop 0
	flat_store_dwordx4 v[4:5], v[0:3] offset:32
	flat_store_dwordx4 v[4:5], v[6:9] offset:48
	flat_store_dwordx4 v[4:5], v[10:13]
	flat_store_dwordx4 v[4:5], v[14:17] offset:16
	.loc	10 610 1                ; ./amd_xdlops.hpp:610:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp126:
.Lfunc_end53:
	.size	_ZN2ck26gcnasm_mfma_f32_32x32x2f32ERKfS1_PDv16_f, .Lfunc_end53-_ZN2ck26gcnasm_mfma_f32_32x32x2f32ERKfS1_PDv16_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 392
; NumSgprs: 36
; NumVgprs: 23
; NumAgprs: 16
; TotalNumVgprs: 23
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck26gcnasm_mfma_f32_16x16x4f32ERKfS1_PDv4_f ; -- Begin function _ZN2ck26gcnasm_mfma_f32_16x16x4f32ERKfS1_PDv4_f
	.globl	_ZN2ck26gcnasm_mfma_f32_16x16x4f32ERKfS1_PDv4_f
	.p2align	2
	.type	_ZN2ck26gcnasm_mfma_f32_16x16x4f32ERKfS1_PDv4_f,@function
_ZN2ck26gcnasm_mfma_f32_16x16x4f32ERKfS1_PDv4_f: ; @_ZN2ck26gcnasm_mfma_f32_16x16x4f32ERKfS1_PDv4_f
_ZN2ck26gcnasm_mfma_f32_16x16x4f32ERKfS1_PDv4_f$local:
.Lfunc_begin54:
	.loc	10 613 0                ; ./amd_xdlops.hpp:613:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp127:
	.loc	10 618 55 prologue_end  ; ./amd_xdlops.hpp:618:55
	flat_load_dword v10, v[0:1]
	.loc	10 618 62 is_stmt 0     ; ./amd_xdlops.hpp:618:62
	flat_load_dword v11, v[2:3]
	.loc	10 618 69               ; ./amd_xdlops.hpp:618:69
	flat_load_dwordx4 v[6:9], v[4:5]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	.loc	10 620 1 is_stmt 1      ; ./amd_xdlops.hpp:620:1
	s_nop 0
	.loc	10 618 16               ; ./amd_xdlops.hpp:618:16
	v_mfma_f32_16x16x4f32 a[0:3], v10, v11, a[0:3]
	.loc	10 620 1                ; ./amd_xdlops.hpp:620:1
	s_nop 7
	s_nop 1
	.loc	10 618 16               ; ./amd_xdlops.hpp:618:16
	v_accvgpr_read_b32 v0, a0
	v_accvgpr_read_b32 v1, a1
	v_accvgpr_read_b32 v2, a2
	v_accvgpr_read_b32 v3, a3
	.loc	10 620 1                ; ./amd_xdlops.hpp:620:1
	s_nop 1
	.loc	10 618 14               ; ./amd_xdlops.hpp:618:14
	flat_store_dwordx4 v[4:5], v[0:3]
	.loc	10 620 1                ; ./amd_xdlops.hpp:620:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp128:
.Lfunc_end54:
	.size	_ZN2ck26gcnasm_mfma_f32_16x16x4f32ERKfS1_PDv4_f, .Lfunc_end54-_ZN2ck26gcnasm_mfma_f32_16x16x4f32ERKfS1_PDv4_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 136
; NumSgprs: 36
; NumVgprs: 12
; NumAgprs: 4
; TotalNumVgprs: 12
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck26gcnasm_mfma_f32_16x16x1f32ILi16ELi64EEEvRKfS2_PDv16_f ; -- Begin function _ZN2ck26gcnasm_mfma_f32_16x16x1f32ILi16ELi64EEEvRKfS2_PDv16_f
	.globl	_ZN2ck26gcnasm_mfma_f32_16x16x1f32ILi16ELi64EEEvRKfS2_PDv16_f
	.p2align	2
	.type	_ZN2ck26gcnasm_mfma_f32_16x16x1f32ILi16ELi64EEEvRKfS2_PDv16_f,@function
_ZN2ck26gcnasm_mfma_f32_16x16x1f32ILi16ELi64EEEvRKfS2_PDv16_f: ; @_ZN2ck26gcnasm_mfma_f32_16x16x1f32ILi16ELi64EEEvRKfS2_PDv16_f
_ZN2ck26gcnasm_mfma_f32_16x16x1f32ILi16ELi64EEEvRKfS2_PDv16_f$local:
.Lfunc_begin55:
	.loc	10 627 0                ; ./amd_xdlops.hpp:627:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp129:
	.loc	10 632 69 prologue_end  ; ./amd_xdlops.hpp:632:69
	flat_load_dwordx4 v[18:21], v[4:5] offset:48
	flat_load_dwordx4 v[14:17], v[4:5] offset:32
	flat_load_dwordx4 v[10:13], v[4:5] offset:16
	flat_load_dwordx4 v[6:9], v[4:5]
	.loc	10 632 55 is_stmt 0     ; ./amd_xdlops.hpp:632:55
	flat_load_dword v22, v[0:1]
	.loc	10 634 1 is_stmt 1      ; ./amd_xdlops.hpp:634:1
	s_nop 0
	.loc	10 632 62               ; ./amd_xdlops.hpp:632:62
	s_nop 0
	flat_load_dword v0, v[2:3]
	.loc	10 632 69 is_stmt 0     ; ./amd_xdlops.hpp:632:69
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	v_accvgpr_write_b32 a4, v10
	v_accvgpr_write_b32 a5, v11
	v_accvgpr_write_b32 a6, v12
	v_accvgpr_write_b32 a7, v13
	v_accvgpr_write_b32 a8, v14
	v_accvgpr_write_b32 a9, v15
	v_accvgpr_write_b32 a10, v16
	v_accvgpr_write_b32 a11, v17
	v_accvgpr_write_b32 a12, v18
	v_accvgpr_write_b32 a13, v19
	v_accvgpr_write_b32 a14, v20
	v_accvgpr_write_b32 a15, v21
	.loc	10 634 1 is_stmt 1      ; ./amd_xdlops.hpp:634:1
	s_nop 0
	.loc	10 632 16               ; ./amd_xdlops.hpp:632:16
	v_mfma_f32_16x16x1f32 a[0:15], v22, v0, a[0:15] cbsz:2
	.loc	10 634 1                ; ./amd_xdlops.hpp:634:1
	s_nop 7
	s_nop 1
	.loc	10 632 14               ; ./amd_xdlops.hpp:632:14
	v_accvgpr_read_b32 v3, a11
	v_accvgpr_read_b32 v2, a10
	v_accvgpr_read_b32 v1, a9
	v_accvgpr_read_b32 v0, a8
	v_accvgpr_read_b32 v9, a15
	v_accvgpr_read_b32 v8, a14
	v_accvgpr_read_b32 v7, a13
	v_accvgpr_read_b32 v6, a12
	v_accvgpr_read_b32 v13, a3
	v_accvgpr_read_b32 v12, a2
	v_accvgpr_read_b32 v11, a1
	v_accvgpr_read_b32 v10, a0
	v_accvgpr_read_b32 v17, a7
	v_accvgpr_read_b32 v16, a6
	v_accvgpr_read_b32 v15, a5
	v_accvgpr_read_b32 v14, a4
	s_nop 0
	s_nop 0
	flat_store_dwordx4 v[4:5], v[0:3] offset:32
	flat_store_dwordx4 v[4:5], v[6:9] offset:48
	flat_store_dwordx4 v[4:5], v[10:13]
	flat_store_dwordx4 v[4:5], v[14:17] offset:16
	.loc	10 634 1                ; ./amd_xdlops.hpp:634:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp130:
.Lfunc_end55:
	.size	_ZN2ck26gcnasm_mfma_f32_16x16x1f32ILi16ELi64EEEvRKfS2_PDv16_f, .Lfunc_end55-_ZN2ck26gcnasm_mfma_f32_16x16x1f32ILi16ELi64EEEvRKfS2_PDv16_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 388
; NumSgprs: 36
; NumVgprs: 23
; NumAgprs: 16
; TotalNumVgprs: 23
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck26gcnasm_mfma_f32_16x16x1f32ILi64ELi16EEEvRKfS2_PDv16_f ; -- Begin function _ZN2ck26gcnasm_mfma_f32_16x16x1f32ILi64ELi16EEEvRKfS2_PDv16_f
	.globl	_ZN2ck26gcnasm_mfma_f32_16x16x1f32ILi64ELi16EEEvRKfS2_PDv16_f
	.p2align	2
	.type	_ZN2ck26gcnasm_mfma_f32_16x16x1f32ILi64ELi16EEEvRKfS2_PDv16_f,@function
_ZN2ck26gcnasm_mfma_f32_16x16x1f32ILi64ELi16EEEvRKfS2_PDv16_f: ; @_ZN2ck26gcnasm_mfma_f32_16x16x1f32ILi64ELi16EEEvRKfS2_PDv16_f
_ZN2ck26gcnasm_mfma_f32_16x16x1f32ILi64ELi16EEEvRKfS2_PDv16_f$local:
.Lfunc_begin56:
	.loc	10 638 0                ; ./amd_xdlops.hpp:638:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp131:
	.loc	10 643 69 prologue_end  ; ./amd_xdlops.hpp:643:69
	flat_load_dwordx4 v[18:21], v[4:5] offset:48
	flat_load_dwordx4 v[14:17], v[4:5] offset:32
	flat_load_dwordx4 v[10:13], v[4:5] offset:16
	flat_load_dwordx4 v[6:9], v[4:5]
	.loc	10 643 55 is_stmt 0     ; ./amd_xdlops.hpp:643:55
	flat_load_dword v22, v[0:1]
	.loc	10 645 1 is_stmt 1      ; ./amd_xdlops.hpp:645:1
	s_nop 0
	.loc	10 643 62               ; ./amd_xdlops.hpp:643:62
	s_nop 0
	flat_load_dword v0, v[2:3]
	.loc	10 643 69 is_stmt 0     ; ./amd_xdlops.hpp:643:69
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	v_accvgpr_write_b32 a4, v10
	v_accvgpr_write_b32 a5, v11
	v_accvgpr_write_b32 a6, v12
	v_accvgpr_write_b32 a7, v13
	v_accvgpr_write_b32 a8, v14
	v_accvgpr_write_b32 a9, v15
	v_accvgpr_write_b32 a10, v16
	v_accvgpr_write_b32 a11, v17
	v_accvgpr_write_b32 a12, v18
	v_accvgpr_write_b32 a13, v19
	v_accvgpr_write_b32 a14, v20
	v_accvgpr_write_b32 a15, v21
	.loc	10 645 1 is_stmt 1      ; ./amd_xdlops.hpp:645:1
	s_nop 0
	.loc	10 643 16               ; ./amd_xdlops.hpp:643:16
	v_mfma_f32_16x16x1f32 a[0:15], v22, v0, a[0:15] blgp:4
	.loc	10 645 1                ; ./amd_xdlops.hpp:645:1
	s_nop 7
	s_nop 1
	.loc	10 643 14               ; ./amd_xdlops.hpp:643:14
	v_accvgpr_read_b32 v3, a11
	v_accvgpr_read_b32 v2, a10
	v_accvgpr_read_b32 v1, a9
	v_accvgpr_read_b32 v0, a8
	v_accvgpr_read_b32 v9, a15
	v_accvgpr_read_b32 v8, a14
	v_accvgpr_read_b32 v7, a13
	v_accvgpr_read_b32 v6, a12
	v_accvgpr_read_b32 v13, a3
	v_accvgpr_read_b32 v12, a2
	v_accvgpr_read_b32 v11, a1
	v_accvgpr_read_b32 v10, a0
	v_accvgpr_read_b32 v17, a7
	v_accvgpr_read_b32 v16, a6
	v_accvgpr_read_b32 v15, a5
	v_accvgpr_read_b32 v14, a4
	s_nop 0
	s_nop 0
	flat_store_dwordx4 v[4:5], v[0:3] offset:32
	flat_store_dwordx4 v[4:5], v[6:9] offset:48
	flat_store_dwordx4 v[4:5], v[10:13]
	flat_store_dwordx4 v[4:5], v[14:17] offset:16
	.loc	10 645 1                ; ./amd_xdlops.hpp:645:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp132:
.Lfunc_end56:
	.size	_ZN2ck26gcnasm_mfma_f32_16x16x1f32ILi64ELi16EEEvRKfS2_PDv16_f, .Lfunc_end56-_ZN2ck26gcnasm_mfma_f32_16x16x1f32ILi64ELi16EEEvRKfS2_PDv16_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 388
; NumSgprs: 36
; NumVgprs: 23
; NumAgprs: 16
; TotalNumVgprs: 23
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck24gcnasm_mfma_f32_4x4x1f32ILi4ELi64EEEvRKfS2_PDv4_f ; -- Begin function _ZN2ck24gcnasm_mfma_f32_4x4x1f32ILi4ELi64EEEvRKfS2_PDv4_f
	.globl	_ZN2ck24gcnasm_mfma_f32_4x4x1f32ILi4ELi64EEEvRKfS2_PDv4_f
	.p2align	2
	.type	_ZN2ck24gcnasm_mfma_f32_4x4x1f32ILi4ELi64EEEvRKfS2_PDv4_f,@function
_ZN2ck24gcnasm_mfma_f32_4x4x1f32ILi4ELi64EEEvRKfS2_PDv4_f: ; @_ZN2ck24gcnasm_mfma_f32_4x4x1f32ILi4ELi64EEEvRKfS2_PDv4_f
_ZN2ck24gcnasm_mfma_f32_4x4x1f32ILi4ELi64EEEvRKfS2_PDv4_f$local:
.Lfunc_begin57:
	.loc	10 652 0                ; ./amd_xdlops.hpp:652:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp133:
	.loc	10 657 53 prologue_end  ; ./amd_xdlops.hpp:657:53
	flat_load_dword v10, v[0:1]
	.loc	10 657 60 is_stmt 0     ; ./amd_xdlops.hpp:657:60
	flat_load_dword v11, v[2:3]
	.loc	10 657 67               ; ./amd_xdlops.hpp:657:67
	flat_load_dwordx4 v[6:9], v[4:5]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	.loc	10 659 1 is_stmt 1      ; ./amd_xdlops.hpp:659:1
	s_nop 0
	.loc	10 657 16               ; ./amd_xdlops.hpp:657:16
	v_mfma_f32_4x4x1f32 a[0:3], v10, v11, a[0:3] cbsz:4
	.loc	10 659 1                ; ./amd_xdlops.hpp:659:1
	s_nop 3
	.loc	10 657 16               ; ./amd_xdlops.hpp:657:16
	v_accvgpr_read_b32 v0, a0
	v_accvgpr_read_b32 v1, a1
	v_accvgpr_read_b32 v2, a2
	v_accvgpr_read_b32 v3, a3
	.loc	10 659 1                ; ./amd_xdlops.hpp:659:1
	s_nop 1
	.loc	10 657 14               ; ./amd_xdlops.hpp:657:14
	flat_store_dwordx4 v[4:5], v[0:3]
	.loc	10 659 1                ; ./amd_xdlops.hpp:659:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp134:
.Lfunc_end57:
	.size	_ZN2ck24gcnasm_mfma_f32_4x4x1f32ILi4ELi64EEEvRKfS2_PDv4_f, .Lfunc_end57-_ZN2ck24gcnasm_mfma_f32_4x4x1f32ILi4ELi64EEEvRKfS2_PDv4_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 132
; NumSgprs: 36
; NumVgprs: 12
; NumAgprs: 4
; TotalNumVgprs: 12
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck24gcnasm_mfma_f32_4x4x1f32ILi8ELi64EEEvRKfS2_PDv4_f ; -- Begin function _ZN2ck24gcnasm_mfma_f32_4x4x1f32ILi8ELi64EEEvRKfS2_PDv4_f
	.globl	_ZN2ck24gcnasm_mfma_f32_4x4x1f32ILi8ELi64EEEvRKfS2_PDv4_f
	.p2align	2
	.type	_ZN2ck24gcnasm_mfma_f32_4x4x1f32ILi8ELi64EEEvRKfS2_PDv4_f,@function
_ZN2ck24gcnasm_mfma_f32_4x4x1f32ILi8ELi64EEEvRKfS2_PDv4_f: ; @_ZN2ck24gcnasm_mfma_f32_4x4x1f32ILi8ELi64EEEvRKfS2_PDv4_f
_ZN2ck24gcnasm_mfma_f32_4x4x1f32ILi8ELi64EEEvRKfS2_PDv4_f$local:
.Lfunc_begin58:
	.loc	10 663 0                ; ./amd_xdlops.hpp:663:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp135:
	.loc	10 669 53 prologue_end  ; ./amd_xdlops.hpp:669:53
	flat_load_dword v14, v[0:1]
	.loc	10 669 60 is_stmt 0     ; ./amd_xdlops.hpp:669:60
	flat_load_dword v15, v[2:3]
	.loc	10 669 67               ; ./amd_xdlops.hpp:669:67
	flat_load_dwordx4 v[6:9], v[4:5]
	.loc	10 670 67 is_stmt 1     ; ./amd_xdlops.hpp:670:67
	flat_load_dwordx4 v[10:13], v[4:5] offset:16
	.loc	10 669 67               ; ./amd_xdlops.hpp:669:67
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	.loc	10 672 1                ; ./amd_xdlops.hpp:672:1
	s_nop 0
	.loc	10 669 16               ; ./amd_xdlops.hpp:669:16
	v_mfma_f32_4x4x1f32 a[0:3], v14, v15, a[0:3] cbsz:4
	.loc	10 672 1                ; ./amd_xdlops.hpp:672:1
	s_nop 3
	.loc	10 669 16               ; ./amd_xdlops.hpp:669:16
	v_accvgpr_read_b32 v9, a3
	v_accvgpr_read_b32 v8, a2
	v_accvgpr_read_b32 v7, a1
	v_accvgpr_read_b32 v6, a0
	.loc	10 670 67               ; ./amd_xdlops.hpp:670:67
	v_accvgpr_write_b32 a0, v10
	v_accvgpr_write_b32 a1, v11
	v_accvgpr_write_b32 a2, v12
	v_accvgpr_write_b32 a3, v13
	.loc	10 672 1                ; ./amd_xdlops.hpp:672:1
	s_nop 0
	.loc	10 669 14               ; ./amd_xdlops.hpp:669:14
	s_nop 0
	flat_store_dwordx4 v[4:5], v[6:9]
	.loc	10 670 53               ; ./amd_xdlops.hpp:670:53
	flat_load_dword v6, v[0:1]
	.loc	10 670 60 is_stmt 0     ; ./amd_xdlops.hpp:670:60
	s_nop 0
	s_nop 0
	flat_load_dword v7, v[2:3]
	.loc	10 670 16               ; ./amd_xdlops.hpp:670:16
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_mfma_f32_4x4x1f32 a[0:3], v6, v7, a[0:3] cbsz:4 abid:1
	.loc	10 672 1 is_stmt 1      ; ./amd_xdlops.hpp:672:1
	s_nop 3
	.loc	10 670 16               ; ./amd_xdlops.hpp:670:16
	v_accvgpr_read_b32 v0, a0
	v_accvgpr_read_b32 v1, a1
	v_accvgpr_read_b32 v2, a2
	v_accvgpr_read_b32 v3, a3
	.loc	10 672 1                ; ./amd_xdlops.hpp:672:1
	s_nop 1
	.loc	10 670 14               ; ./amd_xdlops.hpp:670:14
	flat_store_dwordx4 v[4:5], v[0:3] offset:16
	.loc	10 672 1                ; ./amd_xdlops.hpp:672:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp136:
.Lfunc_end58:
	.size	_ZN2ck24gcnasm_mfma_f32_4x4x1f32ILi8ELi64EEEvRKfS2_PDv4_f, .Lfunc_end58-_ZN2ck24gcnasm_mfma_f32_4x4x1f32ILi8ELi64EEEvRKfS2_PDv4_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 260
; NumSgprs: 36
; NumVgprs: 16
; NumAgprs: 4
; TotalNumVgprs: 16
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi64ELi64EEEvRKDv4_DF16_S3_PDv32_f ; -- Begin function _ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi64ELi64EEEvRKDv4_DF16_S3_PDv32_f
	.globl	_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi64ELi64EEEvRKDv4_DF16_S3_PDv32_f
	.p2align	2
	.type	_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi64ELi64EEEvRKDv4_DF16_S3_PDv32_f,@function
_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi64ELi64EEEvRKDv4_DF16_S3_PDv32_f: ; @_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi64ELi64EEEvRKDv4_DF16_S3_PDv32_f
_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi64ELi64EEEvRKDv4_DF16_S3_PDv32_f$local:
.Lfunc_begin59:
	.loc	10 680 0                ; ./amd_xdlops.hpp:680:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp137:
	.loc	10 686 55 prologue_end  ; ./amd_xdlops.hpp:686:55
	flat_load_dwordx2 v[38:39], v[0:1]
	.loc	10 686 62 is_stmt 0     ; ./amd_xdlops.hpp:686:62
	flat_load_dwordx2 v[48:49], v[2:3]
	.loc	10 686 69               ; ./amd_xdlops.hpp:686:69
	flat_load_dwordx4 v[34:37], v[4:5] offset:112
	flat_load_dwordx4 v[30:33], v[4:5] offset:96
	flat_load_dwordx4 v[26:29], v[4:5] offset:80
	flat_load_dwordx4 v[22:25], v[4:5] offset:64
	flat_load_dwordx4 v[18:21], v[4:5] offset:48
	flat_load_dwordx4 v[14:17], v[4:5] offset:32
	flat_load_dwordx4 v[10:13], v[4:5] offset:16
	flat_load_dwordx4 v[6:9], v[4:5]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	v_accvgpr_write_b32 a4, v10
	v_accvgpr_write_b32 a5, v11
	v_accvgpr_write_b32 a6, v12
	v_accvgpr_write_b32 a7, v13
	v_accvgpr_write_b32 a8, v14
	v_accvgpr_write_b32 a9, v15
	v_accvgpr_write_b32 a10, v16
	v_accvgpr_write_b32 a11, v17
	v_accvgpr_write_b32 a12, v18
	v_accvgpr_write_b32 a13, v19
	v_accvgpr_write_b32 a14, v20
	v_accvgpr_write_b32 a15, v21
	v_accvgpr_write_b32 a16, v22
	v_accvgpr_write_b32 a17, v23
	v_accvgpr_write_b32 a18, v24
	v_accvgpr_write_b32 a19, v25
	v_accvgpr_write_b32 a20, v26
	v_accvgpr_write_b32 a21, v27
	v_accvgpr_write_b32 a22, v28
	v_accvgpr_write_b32 a23, v29
	v_accvgpr_write_b32 a24, v30
	v_accvgpr_write_b32 a25, v31
	v_accvgpr_write_b32 a26, v32
	v_accvgpr_write_b32 a27, v33
	v_accvgpr_write_b32 a28, v34
	v_accvgpr_write_b32 a29, v35
	v_accvgpr_write_b32 a30, v36
	v_accvgpr_write_b32 a31, v37
	.loc	10 687 69 is_stmt 1     ; ./amd_xdlops.hpp:687:69
	s_nop 0
	s_nop 0
	flat_load_dwordx4 v[34:37], v[4:5] offset:240
	flat_load_dwordx4 v[30:33], v[4:5] offset:224
	flat_load_dwordx4 v[26:29], v[4:5] offset:208
	flat_load_dwordx4 v[22:25], v[4:5] offset:192
	flat_load_dwordx4 v[18:21], v[4:5] offset:176
	flat_load_dwordx4 v[14:17], v[4:5] offset:160
	flat_load_dwordx4 v[10:13], v[4:5] offset:144
	flat_load_dwordx4 v[6:9], v[4:5] offset:128
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[0:31], v[38:39], v[48:49], a[0:31] cbsz:1
	.loc	10 687 69               ; ./amd_xdlops.hpp:687:69
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a63, v37
	v_accvgpr_write_b32 a62, v36
	v_accvgpr_write_b32 a61, v35
	v_accvgpr_write_b32 a60, v34
	v_accvgpr_write_b32 a59, v33
	v_accvgpr_write_b32 a58, v32
	v_accvgpr_write_b32 a57, v31
	v_accvgpr_write_b32 a56, v30
	v_accvgpr_write_b32 a55, v29
	v_accvgpr_write_b32 a54, v28
	v_accvgpr_write_b32 a53, v27
	v_accvgpr_write_b32 a52, v26
	v_accvgpr_write_b32 a51, v25
	v_accvgpr_write_b32 a50, v24
	v_accvgpr_write_b32 a49, v23
	v_accvgpr_write_b32 a48, v22
	v_accvgpr_write_b32 a47, v21
	v_accvgpr_write_b32 a46, v20
	v_accvgpr_write_b32 a45, v19
	v_accvgpr_write_b32 a44, v18
	v_accvgpr_write_b32 a43, v17
	v_accvgpr_write_b32 a42, v16
	v_accvgpr_write_b32 a41, v15
	v_accvgpr_write_b32 a40, v14
	v_accvgpr_write_b32 a39, v13
	v_accvgpr_write_b32 a38, v12
	v_accvgpr_write_b32 a37, v11
	v_accvgpr_write_b32 a36, v10
	v_accvgpr_write_b32 a35, v9
	v_accvgpr_write_b32 a34, v8
	v_accvgpr_write_b32 a33, v7
	v_accvgpr_write_b32 a32, v6
	.loc	10 686 14               ; ./amd_xdlops.hpp:686:14
	v_accvgpr_read_b32 v9, a27
	v_accvgpr_read_b32 v8, a26
	v_accvgpr_read_b32 v7, a25
	v_accvgpr_read_b32 v6, a24
	v_accvgpr_read_b32 v13, a31
	v_accvgpr_read_b32 v12, a30
	v_accvgpr_read_b32 v11, a29
	v_accvgpr_read_b32 v10, a28
	v_accvgpr_read_b32 v17, a19
	v_accvgpr_read_b32 v16, a18
	v_accvgpr_read_b32 v15, a17
	v_accvgpr_read_b32 v14, a16
	v_accvgpr_read_b32 v21, a23
	v_accvgpr_read_b32 v20, a22
	v_accvgpr_read_b32 v19, a21
	v_accvgpr_read_b32 v18, a20
	v_accvgpr_read_b32 v25, a11
	v_accvgpr_read_b32 v24, a10
	v_accvgpr_read_b32 v23, a9
	v_accvgpr_read_b32 v22, a8
	v_accvgpr_read_b32 v29, a15
	v_accvgpr_read_b32 v28, a14
	v_accvgpr_read_b32 v27, a13
	v_accvgpr_read_b32 v26, a12
	v_accvgpr_read_b32 v33, a3
	v_accvgpr_read_b32 v32, a2
	v_accvgpr_read_b32 v31, a1
	v_accvgpr_read_b32 v30, a0
	v_accvgpr_read_b32 v37, a7
	v_accvgpr_read_b32 v36, a6
	v_accvgpr_read_b32 v35, a5
	v_accvgpr_read_b32 v34, a4
	s_nop 0
	s_nop 0
	flat_store_dwordx4 v[4:5], v[6:9] offset:96
	flat_store_dwordx4 v[4:5], v[10:13] offset:112
	flat_store_dwordx4 v[4:5], v[14:17] offset:64
	flat_store_dwordx4 v[4:5], v[18:21] offset:80
	flat_store_dwordx4 v[4:5], v[22:25] offset:32
	flat_store_dwordx4 v[4:5], v[26:29] offset:48
	flat_store_dwordx4 v[4:5], v[30:33]
	flat_store_dwordx4 v[4:5], v[34:37] offset:16
	.loc	10 687 55               ; ./amd_xdlops.hpp:687:55
	flat_load_dwordx2 v[6:7], v[0:1]
	.loc	10 687 62 is_stmt 0     ; ./amd_xdlops.hpp:687:62
	s_nop 0
	s_nop 0
	flat_load_dwordx2 v[8:9], v[2:3]
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_mfma_f32_32x32x4f16 a[0:31], v[6:7], v[8:9], a[32:63] cbsz:1 abid:1
	.loc	10 689 1 is_stmt 1      ; ./amd_xdlops.hpp:689:1
	s_nop 7
	s_nop 7
	s_nop 1
	.loc	10 687 14               ; ./amd_xdlops.hpp:687:14
	v_accvgpr_read_b32 v3, a27
	v_accvgpr_read_b32 v2, a26
	v_accvgpr_read_b32 v1, a25
	v_accvgpr_read_b32 v0, a24
	v_accvgpr_read_b32 v9, a31
	v_accvgpr_read_b32 v8, a30
	v_accvgpr_read_b32 v7, a29
	v_accvgpr_read_b32 v6, a28
	v_accvgpr_read_b32 v13, a19
	v_accvgpr_read_b32 v12, a18
	v_accvgpr_read_b32 v11, a17
	v_accvgpr_read_b32 v10, a16
	v_accvgpr_read_b32 v17, a23
	v_accvgpr_read_b32 v16, a22
	v_accvgpr_read_b32 v15, a21
	v_accvgpr_read_b32 v14, a20
	v_accvgpr_read_b32 v21, a11
	v_accvgpr_read_b32 v20, a10
	v_accvgpr_read_b32 v19, a9
	v_accvgpr_read_b32 v18, a8
	v_accvgpr_read_b32 v25, a15
	v_accvgpr_read_b32 v24, a14
	v_accvgpr_read_b32 v23, a13
	v_accvgpr_read_b32 v22, a12
	v_accvgpr_read_b32 v29, a3
	v_accvgpr_read_b32 v28, a2
	v_accvgpr_read_b32 v27, a1
	v_accvgpr_read_b32 v26, a0
	v_accvgpr_read_b32 v33, a7
	v_accvgpr_read_b32 v32, a6
	v_accvgpr_read_b32 v31, a5
	v_accvgpr_read_b32 v30, a4
	s_nop 0
	s_nop 0
	flat_store_dwordx4 v[4:5], v[0:3] offset:224
	flat_store_dwordx4 v[4:5], v[6:9] offset:240
	flat_store_dwordx4 v[4:5], v[10:13] offset:192
	flat_store_dwordx4 v[4:5], v[14:17] offset:208
	flat_store_dwordx4 v[4:5], v[18:21] offset:160
	flat_store_dwordx4 v[4:5], v[22:25] offset:176
	flat_store_dwordx4 v[4:5], v[26:29] offset:128
	flat_store_dwordx4 v[4:5], v[30:33] offset:144
	.loc	10 689 1                ; ./amd_xdlops.hpp:689:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp138:
.Lfunc_end59:
	.size	_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi64ELi64EEEvRKDv4_DF16_S3_PDv32_f, .Lfunc_end59-_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi64ELi64EEEvRKDv4_DF16_S3_PDv32_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 1396
; NumSgprs: 36
; NumVgprs: 50
; NumAgprs: 64
; TotalNumVgprs: 64
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi32ELi64EEEvRKDv4_DF16_S3_PDv32_f ; -- Begin function _ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi32ELi64EEEvRKDv4_DF16_S3_PDv32_f
	.globl	_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi32ELi64EEEvRKDv4_DF16_S3_PDv32_f
	.p2align	2
	.type	_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi32ELi64EEEvRKDv4_DF16_S3_PDv32_f,@function
_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi32ELi64EEEvRKDv4_DF16_S3_PDv32_f: ; @_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi32ELi64EEEvRKDv4_DF16_S3_PDv32_f
_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi32ELi64EEEvRKDv4_DF16_S3_PDv32_f$local:
.Lfunc_begin60:
	.loc	10 693 0                ; ./amd_xdlops.hpp:693:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp139:
	.loc	10 698 69 prologue_end  ; ./amd_xdlops.hpp:698:69
	flat_load_dwordx4 v[34:37], v[4:5] offset:112
	flat_load_dwordx4 v[30:33], v[4:5] offset:96
	flat_load_dwordx4 v[26:29], v[4:5] offset:80
	flat_load_dwordx4 v[22:25], v[4:5] offset:64
	flat_load_dwordx4 v[18:21], v[4:5] offset:48
	flat_load_dwordx4 v[14:17], v[4:5] offset:32
	flat_load_dwordx4 v[10:13], v[4:5] offset:16
	flat_load_dwordx4 v[6:9], v[4:5]
	.loc	10 698 55 is_stmt 0     ; ./amd_xdlops.hpp:698:55
	flat_load_dwordx2 v[38:39], v[0:1]
	.loc	10 700 1 is_stmt 1      ; ./amd_xdlops.hpp:700:1
	s_nop 0
	.loc	10 698 62               ; ./amd_xdlops.hpp:698:62
	s_nop 0
	flat_load_dwordx2 v[0:1], v[2:3]
	.loc	10 698 69 is_stmt 0     ; ./amd_xdlops.hpp:698:69
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	v_accvgpr_write_b32 a4, v10
	v_accvgpr_write_b32 a5, v11
	v_accvgpr_write_b32 a6, v12
	v_accvgpr_write_b32 a7, v13
	v_accvgpr_write_b32 a8, v14
	v_accvgpr_write_b32 a9, v15
	v_accvgpr_write_b32 a10, v16
	v_accvgpr_write_b32 a11, v17
	v_accvgpr_write_b32 a12, v18
	v_accvgpr_write_b32 a13, v19
	v_accvgpr_write_b32 a14, v20
	v_accvgpr_write_b32 a15, v21
	v_accvgpr_write_b32 a16, v22
	v_accvgpr_write_b32 a17, v23
	v_accvgpr_write_b32 a18, v24
	v_accvgpr_write_b32 a19, v25
	v_accvgpr_write_b32 a20, v26
	v_accvgpr_write_b32 a21, v27
	v_accvgpr_write_b32 a22, v28
	v_accvgpr_write_b32 a23, v29
	v_accvgpr_write_b32 a24, v30
	v_accvgpr_write_b32 a25, v31
	v_accvgpr_write_b32 a26, v32
	v_accvgpr_write_b32 a27, v33
	v_accvgpr_write_b32 a28, v34
	v_accvgpr_write_b32 a29, v35
	v_accvgpr_write_b32 a30, v36
	v_accvgpr_write_b32 a31, v37
	.loc	10 700 1 is_stmt 1      ; ./amd_xdlops.hpp:700:1
	s_nop 0
	.loc	10 698 16               ; ./amd_xdlops.hpp:698:16
	v_mfma_f32_32x32x4f16 a[0:31], v[38:39], v[0:1], a[0:31] cbsz:1
	.loc	10 700 1                ; ./amd_xdlops.hpp:700:1
	s_nop 7
	s_nop 7
	s_nop 1
	.loc	10 698 14               ; ./amd_xdlops.hpp:698:14
	v_accvgpr_read_b32 v3, a27
	v_accvgpr_read_b32 v2, a26
	v_accvgpr_read_b32 v1, a25
	v_accvgpr_read_b32 v0, a24
	v_accvgpr_read_b32 v9, a31
	v_accvgpr_read_b32 v8, a30
	v_accvgpr_read_b32 v7, a29
	v_accvgpr_read_b32 v6, a28
	v_accvgpr_read_b32 v13, a19
	v_accvgpr_read_b32 v12, a18
	v_accvgpr_read_b32 v11, a17
	v_accvgpr_read_b32 v10, a16
	v_accvgpr_read_b32 v17, a23
	v_accvgpr_read_b32 v16, a22
	v_accvgpr_read_b32 v15, a21
	v_accvgpr_read_b32 v14, a20
	v_accvgpr_read_b32 v21, a11
	v_accvgpr_read_b32 v20, a10
	v_accvgpr_read_b32 v19, a9
	v_accvgpr_read_b32 v18, a8
	v_accvgpr_read_b32 v25, a15
	v_accvgpr_read_b32 v24, a14
	v_accvgpr_read_b32 v23, a13
	v_accvgpr_read_b32 v22, a12
	v_accvgpr_read_b32 v29, a3
	v_accvgpr_read_b32 v28, a2
	v_accvgpr_read_b32 v27, a1
	v_accvgpr_read_b32 v26, a0
	v_accvgpr_read_b32 v33, a7
	v_accvgpr_read_b32 v32, a6
	v_accvgpr_read_b32 v31, a5
	v_accvgpr_read_b32 v30, a4
	s_nop 0
	s_nop 0
	flat_store_dwordx4 v[4:5], v[0:3] offset:96
	flat_store_dwordx4 v[4:5], v[6:9] offset:112
	flat_store_dwordx4 v[4:5], v[10:13] offset:64
	flat_store_dwordx4 v[4:5], v[14:17] offset:80
	flat_store_dwordx4 v[4:5], v[18:21] offset:32
	flat_store_dwordx4 v[4:5], v[22:25] offset:48
	flat_store_dwordx4 v[4:5], v[26:29]
	flat_store_dwordx4 v[4:5], v[30:33] offset:16
	.loc	10 700 1                ; ./amd_xdlops.hpp:700:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp140:
.Lfunc_end60:
	.size	_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi32ELi64EEEvRKDv4_DF16_S3_PDv32_f, .Lfunc_end60-_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi32ELi64EEEvRKDv4_DF16_S3_PDv32_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 712
; NumSgprs: 36
; NumVgprs: 40
; NumAgprs: 32
; TotalNumVgprs: 40
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi64ELi32EEEvRKDv4_DF16_S3_PDv32_f ; -- Begin function _ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi64ELi32EEEvRKDv4_DF16_S3_PDv32_f
	.globl	_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi64ELi32EEEvRKDv4_DF16_S3_PDv32_f
	.p2align	2
	.type	_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi64ELi32EEEvRKDv4_DF16_S3_PDv32_f,@function
_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi64ELi32EEEvRKDv4_DF16_S3_PDv32_f: ; @_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi64ELi32EEEvRKDv4_DF16_S3_PDv32_f
_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi64ELi32EEEvRKDv4_DF16_S3_PDv32_f$local:
.Lfunc_begin61:
	.loc	10 704 0                ; ./amd_xdlops.hpp:704:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp141:
	.loc	10 709 69 prologue_end  ; ./amd_xdlops.hpp:709:69
	flat_load_dwordx4 v[34:37], v[4:5] offset:112
	flat_load_dwordx4 v[30:33], v[4:5] offset:96
	flat_load_dwordx4 v[26:29], v[4:5] offset:80
	flat_load_dwordx4 v[22:25], v[4:5] offset:64
	flat_load_dwordx4 v[18:21], v[4:5] offset:48
	flat_load_dwordx4 v[14:17], v[4:5] offset:32
	flat_load_dwordx4 v[10:13], v[4:5] offset:16
	flat_load_dwordx4 v[6:9], v[4:5]
	.loc	10 709 55 is_stmt 0     ; ./amd_xdlops.hpp:709:55
	flat_load_dwordx2 v[38:39], v[0:1]
	.loc	10 711 1 is_stmt 1      ; ./amd_xdlops.hpp:711:1
	s_nop 0
	.loc	10 709 62               ; ./amd_xdlops.hpp:709:62
	s_nop 0
	flat_load_dwordx2 v[0:1], v[2:3]
	.loc	10 709 69 is_stmt 0     ; ./amd_xdlops.hpp:709:69
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	v_accvgpr_write_b32 a4, v10
	v_accvgpr_write_b32 a5, v11
	v_accvgpr_write_b32 a6, v12
	v_accvgpr_write_b32 a7, v13
	v_accvgpr_write_b32 a8, v14
	v_accvgpr_write_b32 a9, v15
	v_accvgpr_write_b32 a10, v16
	v_accvgpr_write_b32 a11, v17
	v_accvgpr_write_b32 a12, v18
	v_accvgpr_write_b32 a13, v19
	v_accvgpr_write_b32 a14, v20
	v_accvgpr_write_b32 a15, v21
	v_accvgpr_write_b32 a16, v22
	v_accvgpr_write_b32 a17, v23
	v_accvgpr_write_b32 a18, v24
	v_accvgpr_write_b32 a19, v25
	v_accvgpr_write_b32 a20, v26
	v_accvgpr_write_b32 a21, v27
	v_accvgpr_write_b32 a22, v28
	v_accvgpr_write_b32 a23, v29
	v_accvgpr_write_b32 a24, v30
	v_accvgpr_write_b32 a25, v31
	v_accvgpr_write_b32 a26, v32
	v_accvgpr_write_b32 a27, v33
	v_accvgpr_write_b32 a28, v34
	v_accvgpr_write_b32 a29, v35
	v_accvgpr_write_b32 a30, v36
	v_accvgpr_write_b32 a31, v37
	.loc	10 711 1 is_stmt 1      ; ./amd_xdlops.hpp:711:1
	s_nop 0
	.loc	10 709 16               ; ./amd_xdlops.hpp:709:16
	v_mfma_f32_32x32x4f16 a[0:31], v[38:39], v[0:1], a[0:31] blgp:1
	.loc	10 711 1                ; ./amd_xdlops.hpp:711:1
	s_nop 7
	s_nop 7
	s_nop 1
	.loc	10 709 14               ; ./amd_xdlops.hpp:709:14
	v_accvgpr_read_b32 v3, a27
	v_accvgpr_read_b32 v2, a26
	v_accvgpr_read_b32 v1, a25
	v_accvgpr_read_b32 v0, a24
	v_accvgpr_read_b32 v9, a31
	v_accvgpr_read_b32 v8, a30
	v_accvgpr_read_b32 v7, a29
	v_accvgpr_read_b32 v6, a28
	v_accvgpr_read_b32 v13, a19
	v_accvgpr_read_b32 v12, a18
	v_accvgpr_read_b32 v11, a17
	v_accvgpr_read_b32 v10, a16
	v_accvgpr_read_b32 v17, a23
	v_accvgpr_read_b32 v16, a22
	v_accvgpr_read_b32 v15, a21
	v_accvgpr_read_b32 v14, a20
	v_accvgpr_read_b32 v21, a11
	v_accvgpr_read_b32 v20, a10
	v_accvgpr_read_b32 v19, a9
	v_accvgpr_read_b32 v18, a8
	v_accvgpr_read_b32 v25, a15
	v_accvgpr_read_b32 v24, a14
	v_accvgpr_read_b32 v23, a13
	v_accvgpr_read_b32 v22, a12
	v_accvgpr_read_b32 v29, a3
	v_accvgpr_read_b32 v28, a2
	v_accvgpr_read_b32 v27, a1
	v_accvgpr_read_b32 v26, a0
	v_accvgpr_read_b32 v33, a7
	v_accvgpr_read_b32 v32, a6
	v_accvgpr_read_b32 v31, a5
	v_accvgpr_read_b32 v30, a4
	s_nop 0
	s_nop 0
	flat_store_dwordx4 v[4:5], v[0:3] offset:96
	flat_store_dwordx4 v[4:5], v[6:9] offset:112
	flat_store_dwordx4 v[4:5], v[10:13] offset:64
	flat_store_dwordx4 v[4:5], v[14:17] offset:80
	flat_store_dwordx4 v[4:5], v[18:21] offset:32
	flat_store_dwordx4 v[4:5], v[22:25] offset:48
	flat_store_dwordx4 v[4:5], v[26:29]
	flat_store_dwordx4 v[4:5], v[30:33] offset:16
	.loc	10 711 1                ; ./amd_xdlops.hpp:711:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp142:
.Lfunc_end61:
	.size	_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi64ELi32EEEvRKDv4_DF16_S3_PDv32_f, .Lfunc_end61-_ZN2ck26gcnasm_mfma_f32_32x32x4f16ILi64ELi32EEEvRKDv4_DF16_S3_PDv32_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 712
; NumSgprs: 36
; NumVgprs: 40
; NumAgprs: 32
; TotalNumVgprs: 40
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck26gcnasm_mfma_f32_32x32x8f16ERKDv4_DF16_S2_PDv16_f ; -- Begin function _ZN2ck26gcnasm_mfma_f32_32x32x8f16ERKDv4_DF16_S2_PDv16_f
	.globl	_ZN2ck26gcnasm_mfma_f32_32x32x8f16ERKDv4_DF16_S2_PDv16_f
	.p2align	2
	.type	_ZN2ck26gcnasm_mfma_f32_32x32x8f16ERKDv4_DF16_S2_PDv16_f,@function
_ZN2ck26gcnasm_mfma_f32_32x32x8f16ERKDv4_DF16_S2_PDv16_f: ; @_ZN2ck26gcnasm_mfma_f32_32x32x8f16ERKDv4_DF16_S2_PDv16_f
_ZN2ck26gcnasm_mfma_f32_32x32x8f16ERKDv4_DF16_S2_PDv16_f$local:
.Lfunc_begin62:
	.loc	10 714 0                ; ./amd_xdlops.hpp:714:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp143:
	.loc	10 719 69 prologue_end  ; ./amd_xdlops.hpp:719:69
	flat_load_dwordx4 v[18:21], v[4:5] offset:48
	flat_load_dwordx4 v[14:17], v[4:5] offset:32
	flat_load_dwordx4 v[10:13], v[4:5] offset:16
	flat_load_dwordx4 v[6:9], v[4:5]
	.loc	10 719 55 is_stmt 0     ; ./amd_xdlops.hpp:719:55
	flat_load_dwordx2 v[22:23], v[0:1]
	.loc	10 721 1 is_stmt 1      ; ./amd_xdlops.hpp:721:1
	s_nop 0
	.loc	10 719 62               ; ./amd_xdlops.hpp:719:62
	s_nop 0
	flat_load_dwordx2 v[0:1], v[2:3]
	.loc	10 719 69 is_stmt 0     ; ./amd_xdlops.hpp:719:69
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	v_accvgpr_write_b32 a4, v10
	v_accvgpr_write_b32 a5, v11
	v_accvgpr_write_b32 a6, v12
	v_accvgpr_write_b32 a7, v13
	v_accvgpr_write_b32 a8, v14
	v_accvgpr_write_b32 a9, v15
	v_accvgpr_write_b32 a10, v16
	v_accvgpr_write_b32 a11, v17
	v_accvgpr_write_b32 a12, v18
	v_accvgpr_write_b32 a13, v19
	v_accvgpr_write_b32 a14, v20
	v_accvgpr_write_b32 a15, v21
	.loc	10 721 1 is_stmt 1      ; ./amd_xdlops.hpp:721:1
	s_nop 0
	.loc	10 719 16               ; ./amd_xdlops.hpp:719:16
	v_mfma_f32_32x32x8f16 a[0:15], v[22:23], v[0:1], a[0:15]
	.loc	10 721 1                ; ./amd_xdlops.hpp:721:1
	s_nop 7
	s_nop 7
	s_nop 1
	.loc	10 719 14               ; ./amd_xdlops.hpp:719:14
	v_accvgpr_read_b32 v3, a11
	v_accvgpr_read_b32 v2, a10
	v_accvgpr_read_b32 v1, a9
	v_accvgpr_read_b32 v0, a8
	v_accvgpr_read_b32 v9, a15
	v_accvgpr_read_b32 v8, a14
	v_accvgpr_read_b32 v7, a13
	v_accvgpr_read_b32 v6, a12
	v_accvgpr_read_b32 v13, a3
	v_accvgpr_read_b32 v12, a2
	v_accvgpr_read_b32 v11, a1
	v_accvgpr_read_b32 v10, a0
	v_accvgpr_read_b32 v17, a7
	v_accvgpr_read_b32 v16, a6
	v_accvgpr_read_b32 v15, a5
	v_accvgpr_read_b32 v14, a4
	s_nop 0
	s_nop 0
	flat_store_dwordx4 v[4:5], v[0:3] offset:32
	flat_store_dwordx4 v[4:5], v[6:9] offset:48
	flat_store_dwordx4 v[4:5], v[10:13]
	flat_store_dwordx4 v[4:5], v[14:17] offset:16
	.loc	10 721 1                ; ./amd_xdlops.hpp:721:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp144:
.Lfunc_end62:
	.size	_ZN2ck26gcnasm_mfma_f32_32x32x8f16ERKDv4_DF16_S2_PDv16_f, .Lfunc_end62-_ZN2ck26gcnasm_mfma_f32_32x32x8f16ERKDv4_DF16_S2_PDv16_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 392
; NumSgprs: 36
; NumVgprs: 24
; NumAgprs: 16
; TotalNumVgprs: 24
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck27gcnasm_mfma_f32_16x16x16f16ERKDv4_DF16_S2_PDv4_f ; -- Begin function _ZN2ck27gcnasm_mfma_f32_16x16x16f16ERKDv4_DF16_S2_PDv4_f
	.globl	_ZN2ck27gcnasm_mfma_f32_16x16x16f16ERKDv4_DF16_S2_PDv4_f
	.p2align	2
	.type	_ZN2ck27gcnasm_mfma_f32_16x16x16f16ERKDv4_DF16_S2_PDv4_f,@function
_ZN2ck27gcnasm_mfma_f32_16x16x16f16ERKDv4_DF16_S2_PDv4_f: ; @_ZN2ck27gcnasm_mfma_f32_16x16x16f16ERKDv4_DF16_S2_PDv4_f
_ZN2ck27gcnasm_mfma_f32_16x16x16f16ERKDv4_DF16_S2_PDv4_f$local:
.Lfunc_begin63:
	.loc	10 724 0                ; ./amd_xdlops.hpp:724:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp145:
	.loc	10 729 56 prologue_end  ; ./amd_xdlops.hpp:729:56
	flat_load_dwordx2 v[10:11], v[0:1]
	.loc	10 729 63 is_stmt 0     ; ./amd_xdlops.hpp:729:63
	flat_load_dwordx2 v[12:13], v[2:3]
	.loc	10 729 70               ; ./amd_xdlops.hpp:729:70
	flat_load_dwordx4 v[6:9], v[4:5]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	.loc	10 731 1 is_stmt 1      ; ./amd_xdlops.hpp:731:1
	s_nop 0
	.loc	10 729 16               ; ./amd_xdlops.hpp:729:16
	v_mfma_f32_16x16x16f16 a[0:3], v[10:11], v[12:13], a[0:3]
	.loc	10 731 1                ; ./amd_xdlops.hpp:731:1
	s_nop 7
	s_nop 1
	.loc	10 729 16               ; ./amd_xdlops.hpp:729:16
	v_accvgpr_read_b32 v0, a0
	v_accvgpr_read_b32 v1, a1
	v_accvgpr_read_b32 v2, a2
	v_accvgpr_read_b32 v3, a3
	.loc	10 731 1                ; ./amd_xdlops.hpp:731:1
	s_nop 1
	.loc	10 729 14               ; ./amd_xdlops.hpp:729:14
	flat_store_dwordx4 v[4:5], v[0:3]
	.loc	10 731 1                ; ./amd_xdlops.hpp:731:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp146:
.Lfunc_end63:
	.size	_ZN2ck27gcnasm_mfma_f32_16x16x16f16ERKDv4_DF16_S2_PDv4_f, .Lfunc_end63-_ZN2ck27gcnasm_mfma_f32_16x16x16f16ERKDv4_DF16_S2_PDv4_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 136
; NumSgprs: 36
; NumVgprs: 14
; NumAgprs: 4
; TotalNumVgprs: 14
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck26gcnasm_mfma_f32_16x16x4f16ILi16ELi64EEEvRKDv4_DF16_S3_PDv16_f ; -- Begin function _ZN2ck26gcnasm_mfma_f32_16x16x4f16ILi16ELi64EEEvRKDv4_DF16_S3_PDv16_f
	.globl	_ZN2ck26gcnasm_mfma_f32_16x16x4f16ILi16ELi64EEEvRKDv4_DF16_S3_PDv16_f
	.p2align	2
	.type	_ZN2ck26gcnasm_mfma_f32_16x16x4f16ILi16ELi64EEEvRKDv4_DF16_S3_PDv16_f,@function
_ZN2ck26gcnasm_mfma_f32_16x16x4f16ILi16ELi64EEEvRKDv4_DF16_S3_PDv16_f: ; @_ZN2ck26gcnasm_mfma_f32_16x16x4f16ILi16ELi64EEEvRKDv4_DF16_S3_PDv16_f
_ZN2ck26gcnasm_mfma_f32_16x16x4f16ILi16ELi64EEEvRKDv4_DF16_S3_PDv16_f$local:
.Lfunc_begin64:
	.loc	10 738 0                ; ./amd_xdlops.hpp:738:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp147:
	.loc	10 743 69 prologue_end  ; ./amd_xdlops.hpp:743:69
	flat_load_dwordx4 v[18:21], v[4:5] offset:48
	flat_load_dwordx4 v[14:17], v[4:5] offset:32
	flat_load_dwordx4 v[10:13], v[4:5] offset:16
	flat_load_dwordx4 v[6:9], v[4:5]
	.loc	10 743 55 is_stmt 0     ; ./amd_xdlops.hpp:743:55
	flat_load_dwordx2 v[22:23], v[0:1]
	.loc	10 745 1 is_stmt 1      ; ./amd_xdlops.hpp:745:1
	s_nop 0
	.loc	10 743 62               ; ./amd_xdlops.hpp:743:62
	s_nop 0
	flat_load_dwordx2 v[0:1], v[2:3]
	.loc	10 743 69 is_stmt 0     ; ./amd_xdlops.hpp:743:69
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	v_accvgpr_write_b32 a4, v10
	v_accvgpr_write_b32 a5, v11
	v_accvgpr_write_b32 a6, v12
	v_accvgpr_write_b32 a7, v13
	v_accvgpr_write_b32 a8, v14
	v_accvgpr_write_b32 a9, v15
	v_accvgpr_write_b32 a10, v16
	v_accvgpr_write_b32 a11, v17
	v_accvgpr_write_b32 a12, v18
	v_accvgpr_write_b32 a13, v19
	v_accvgpr_write_b32 a14, v20
	v_accvgpr_write_b32 a15, v21
	.loc	10 745 1 is_stmt 1      ; ./amd_xdlops.hpp:745:1
	s_nop 0
	.loc	10 743 16               ; ./amd_xdlops.hpp:743:16
	v_mfma_f32_16x16x4f16 a[0:15], v[22:23], v[0:1], a[0:15] cbsz:2
	.loc	10 745 1                ; ./amd_xdlops.hpp:745:1
	s_nop 7
	s_nop 1
	.loc	10 743 14               ; ./amd_xdlops.hpp:743:14
	v_accvgpr_read_b32 v3, a11
	v_accvgpr_read_b32 v2, a10
	v_accvgpr_read_b32 v1, a9
	v_accvgpr_read_b32 v0, a8
	v_accvgpr_read_b32 v9, a15
	v_accvgpr_read_b32 v8, a14
	v_accvgpr_read_b32 v7, a13
	v_accvgpr_read_b32 v6, a12
	v_accvgpr_read_b32 v13, a3
	v_accvgpr_read_b32 v12, a2
	v_accvgpr_read_b32 v11, a1
	v_accvgpr_read_b32 v10, a0
	v_accvgpr_read_b32 v17, a7
	v_accvgpr_read_b32 v16, a6
	v_accvgpr_read_b32 v15, a5
	v_accvgpr_read_b32 v14, a4
	s_nop 0
	s_nop 0
	flat_store_dwordx4 v[4:5], v[0:3] offset:32
	flat_store_dwordx4 v[4:5], v[6:9] offset:48
	flat_store_dwordx4 v[4:5], v[10:13]
	flat_store_dwordx4 v[4:5], v[14:17] offset:16
	.loc	10 745 1                ; ./amd_xdlops.hpp:745:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp148:
.Lfunc_end64:
	.size	_ZN2ck26gcnasm_mfma_f32_16x16x4f16ILi16ELi64EEEvRKDv4_DF16_S3_PDv16_f, .Lfunc_end64-_ZN2ck26gcnasm_mfma_f32_16x16x4f16ILi16ELi64EEEvRKDv4_DF16_S3_PDv16_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 388
; NumSgprs: 36
; NumVgprs: 24
; NumAgprs: 16
; TotalNumVgprs: 24
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck26gcnasm_mfma_f32_16x16x4f16ILi64ELi16EEEvRKDv4_DF16_S3_PDv16_f ; -- Begin function _ZN2ck26gcnasm_mfma_f32_16x16x4f16ILi64ELi16EEEvRKDv4_DF16_S3_PDv16_f
	.globl	_ZN2ck26gcnasm_mfma_f32_16x16x4f16ILi64ELi16EEEvRKDv4_DF16_S3_PDv16_f
	.p2align	2
	.type	_ZN2ck26gcnasm_mfma_f32_16x16x4f16ILi64ELi16EEEvRKDv4_DF16_S3_PDv16_f,@function
_ZN2ck26gcnasm_mfma_f32_16x16x4f16ILi64ELi16EEEvRKDv4_DF16_S3_PDv16_f: ; @_ZN2ck26gcnasm_mfma_f32_16x16x4f16ILi64ELi16EEEvRKDv4_DF16_S3_PDv16_f
_ZN2ck26gcnasm_mfma_f32_16x16x4f16ILi64ELi16EEEvRKDv4_DF16_S3_PDv16_f$local:
.Lfunc_begin65:
	.loc	10 750 0                ; ./amd_xdlops.hpp:750:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp149:
	.loc	10 755 69 prologue_end  ; ./amd_xdlops.hpp:755:69
	flat_load_dwordx4 v[18:21], v[4:5] offset:48
	flat_load_dwordx4 v[14:17], v[4:5] offset:32
	flat_load_dwordx4 v[10:13], v[4:5] offset:16
	flat_load_dwordx4 v[6:9], v[4:5]
	.loc	10 755 55 is_stmt 0     ; ./amd_xdlops.hpp:755:55
	flat_load_dwordx2 v[22:23], v[0:1]
	.loc	10 757 1 is_stmt 1      ; ./amd_xdlops.hpp:757:1
	s_nop 0
	.loc	10 755 62               ; ./amd_xdlops.hpp:755:62
	s_nop 0
	flat_load_dwordx2 v[0:1], v[2:3]
	.loc	10 755 69 is_stmt 0     ; ./amd_xdlops.hpp:755:69
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	v_accvgpr_write_b32 a4, v10
	v_accvgpr_write_b32 a5, v11
	v_accvgpr_write_b32 a6, v12
	v_accvgpr_write_b32 a7, v13
	v_accvgpr_write_b32 a8, v14
	v_accvgpr_write_b32 a9, v15
	v_accvgpr_write_b32 a10, v16
	v_accvgpr_write_b32 a11, v17
	v_accvgpr_write_b32 a12, v18
	v_accvgpr_write_b32 a13, v19
	v_accvgpr_write_b32 a14, v20
	v_accvgpr_write_b32 a15, v21
	.loc	10 757 1 is_stmt 1      ; ./amd_xdlops.hpp:757:1
	s_nop 0
	.loc	10 755 16               ; ./amd_xdlops.hpp:755:16
	v_mfma_f32_16x16x4f16 a[0:15], v[22:23], v[0:1], a[0:15] blgp:4
	.loc	10 757 1                ; ./amd_xdlops.hpp:757:1
	s_nop 7
	s_nop 1
	.loc	10 755 14               ; ./amd_xdlops.hpp:755:14
	v_accvgpr_read_b32 v3, a11
	v_accvgpr_read_b32 v2, a10
	v_accvgpr_read_b32 v1, a9
	v_accvgpr_read_b32 v0, a8
	v_accvgpr_read_b32 v9, a15
	v_accvgpr_read_b32 v8, a14
	v_accvgpr_read_b32 v7, a13
	v_accvgpr_read_b32 v6, a12
	v_accvgpr_read_b32 v13, a3
	v_accvgpr_read_b32 v12, a2
	v_accvgpr_read_b32 v11, a1
	v_accvgpr_read_b32 v10, a0
	v_accvgpr_read_b32 v17, a7
	v_accvgpr_read_b32 v16, a6
	v_accvgpr_read_b32 v15, a5
	v_accvgpr_read_b32 v14, a4
	s_nop 0
	s_nop 0
	flat_store_dwordx4 v[4:5], v[0:3] offset:32
	flat_store_dwordx4 v[4:5], v[6:9] offset:48
	flat_store_dwordx4 v[4:5], v[10:13]
	flat_store_dwordx4 v[4:5], v[14:17] offset:16
	.loc	10 757 1                ; ./amd_xdlops.hpp:757:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp150:
.Lfunc_end65:
	.size	_ZN2ck26gcnasm_mfma_f32_16x16x4f16ILi64ELi16EEEvRKDv4_DF16_S3_PDv16_f, .Lfunc_end65-_ZN2ck26gcnasm_mfma_f32_16x16x4f16ILi64ELi16EEEvRKDv4_DF16_S3_PDv16_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 388
; NumSgprs: 36
; NumVgprs: 24
; NumAgprs: 16
; TotalNumVgprs: 24
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck24gcnasm_mfma_f32_4x4x4f16ILi4ELi64EEEvRKDv4_DF16_S3_PDv4_f ; -- Begin function _ZN2ck24gcnasm_mfma_f32_4x4x4f16ILi4ELi64EEEvRKDv4_DF16_S3_PDv4_f
	.globl	_ZN2ck24gcnasm_mfma_f32_4x4x4f16ILi4ELi64EEEvRKDv4_DF16_S3_PDv4_f
	.p2align	2
	.type	_ZN2ck24gcnasm_mfma_f32_4x4x4f16ILi4ELi64EEEvRKDv4_DF16_S3_PDv4_f,@function
_ZN2ck24gcnasm_mfma_f32_4x4x4f16ILi4ELi64EEEvRKDv4_DF16_S3_PDv4_f: ; @_ZN2ck24gcnasm_mfma_f32_4x4x4f16ILi4ELi64EEEvRKDv4_DF16_S3_PDv4_f
_ZN2ck24gcnasm_mfma_f32_4x4x4f16ILi4ELi64EEEvRKDv4_DF16_S3_PDv4_f$local:
.Lfunc_begin66:
	.loc	10 764 0                ; ./amd_xdlops.hpp:764:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp151:
	.loc	10 769 53 prologue_end  ; ./amd_xdlops.hpp:769:53
	flat_load_dwordx2 v[10:11], v[0:1]
	.loc	10 769 60 is_stmt 0     ; ./amd_xdlops.hpp:769:60
	flat_load_dwordx2 v[12:13], v[2:3]
	.loc	10 769 67               ; ./amd_xdlops.hpp:769:67
	flat_load_dwordx4 v[6:9], v[4:5]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	.loc	10 771 1 is_stmt 1      ; ./amd_xdlops.hpp:771:1
	s_nop 0
	.loc	10 769 16               ; ./amd_xdlops.hpp:769:16
	v_mfma_f32_4x4x4f16 a[0:3], v[10:11], v[12:13], a[0:3] cbsz:4
	.loc	10 771 1                ; ./amd_xdlops.hpp:771:1
	s_nop 3
	.loc	10 769 16               ; ./amd_xdlops.hpp:769:16
	v_accvgpr_read_b32 v0, a0
	v_accvgpr_read_b32 v1, a1
	v_accvgpr_read_b32 v2, a2
	v_accvgpr_read_b32 v3, a3
	.loc	10 771 1                ; ./amd_xdlops.hpp:771:1
	s_nop 1
	.loc	10 769 14               ; ./amd_xdlops.hpp:769:14
	flat_store_dwordx4 v[4:5], v[0:3]
	.loc	10 771 1                ; ./amd_xdlops.hpp:771:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp152:
.Lfunc_end66:
	.size	_ZN2ck24gcnasm_mfma_f32_4x4x4f16ILi4ELi64EEEvRKDv4_DF16_S3_PDv4_f, .Lfunc_end66-_ZN2ck24gcnasm_mfma_f32_4x4x4f16ILi4ELi64EEEvRKDv4_DF16_S3_PDv4_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 132
; NumSgprs: 36
; NumVgprs: 14
; NumAgprs: 4
; TotalNumVgprs: 14
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck24gcnasm_mfma_f32_4x4x4f16ILi8ELi64EEEvRKDv4_DF16_S3_PDv4_f ; -- Begin function _ZN2ck24gcnasm_mfma_f32_4x4x4f16ILi8ELi64EEEvRKDv4_DF16_S3_PDv4_f
	.globl	_ZN2ck24gcnasm_mfma_f32_4x4x4f16ILi8ELi64EEEvRKDv4_DF16_S3_PDv4_f
	.p2align	2
	.type	_ZN2ck24gcnasm_mfma_f32_4x4x4f16ILi8ELi64EEEvRKDv4_DF16_S3_PDv4_f,@function
_ZN2ck24gcnasm_mfma_f32_4x4x4f16ILi8ELi64EEEvRKDv4_DF16_S3_PDv4_f: ; @_ZN2ck24gcnasm_mfma_f32_4x4x4f16ILi8ELi64EEEvRKDv4_DF16_S3_PDv4_f
_ZN2ck24gcnasm_mfma_f32_4x4x4f16ILi8ELi64EEEvRKDv4_DF16_S3_PDv4_f$local:
.Lfunc_begin67:
	.loc	10 775 0                ; ./amd_xdlops.hpp:775:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp153:
	.loc	10 781 53 prologue_end  ; ./amd_xdlops.hpp:781:53
	flat_load_dwordx2 v[14:15], v[0:1]
	.loc	10 781 60 is_stmt 0     ; ./amd_xdlops.hpp:781:60
	flat_load_dwordx2 v[16:17], v[2:3]
	.loc	10 781 67               ; ./amd_xdlops.hpp:781:67
	flat_load_dwordx4 v[6:9], v[4:5]
	.loc	10 782 67 is_stmt 1     ; ./amd_xdlops.hpp:782:67
	flat_load_dwordx4 v[10:13], v[4:5] offset:16
	.loc	10 781 67               ; ./amd_xdlops.hpp:781:67
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	.loc	10 784 1                ; ./amd_xdlops.hpp:784:1
	s_nop 0
	.loc	10 781 16               ; ./amd_xdlops.hpp:781:16
	v_mfma_f32_4x4x4f16 a[0:3], v[14:15], v[16:17], a[0:3] cbsz:4
	.loc	10 784 1                ; ./amd_xdlops.hpp:784:1
	s_nop 3
	.loc	10 781 16               ; ./amd_xdlops.hpp:781:16
	v_accvgpr_read_b32 v9, a3
	v_accvgpr_read_b32 v8, a2
	v_accvgpr_read_b32 v7, a1
	v_accvgpr_read_b32 v6, a0
	.loc	10 782 67               ; ./amd_xdlops.hpp:782:67
	v_accvgpr_write_b32 a0, v10
	v_accvgpr_write_b32 a1, v11
	v_accvgpr_write_b32 a2, v12
	v_accvgpr_write_b32 a3, v13
	.loc	10 784 1                ; ./amd_xdlops.hpp:784:1
	s_nop 0
	.loc	10 781 14               ; ./amd_xdlops.hpp:781:14
	s_nop 0
	flat_store_dwordx4 v[4:5], v[6:9]
	.loc	10 782 53               ; ./amd_xdlops.hpp:782:53
	flat_load_dwordx2 v[6:7], v[0:1]
	.loc	10 782 60 is_stmt 0     ; ./amd_xdlops.hpp:782:60
	s_nop 0
	s_nop 0
	flat_load_dwordx2 v[8:9], v[2:3]
	.loc	10 782 16               ; ./amd_xdlops.hpp:782:16
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_mfma_f32_4x4x4f16 a[0:3], v[6:7], v[8:9], a[0:3] cbsz:4 abid:1
	.loc	10 784 1 is_stmt 1      ; ./amd_xdlops.hpp:784:1
	s_nop 3
	.loc	10 782 16               ; ./amd_xdlops.hpp:782:16
	v_accvgpr_read_b32 v0, a0
	v_accvgpr_read_b32 v1, a1
	v_accvgpr_read_b32 v2, a2
	v_accvgpr_read_b32 v3, a3
	.loc	10 784 1                ; ./amd_xdlops.hpp:784:1
	s_nop 1
	.loc	10 782 14               ; ./amd_xdlops.hpp:782:14
	flat_store_dwordx4 v[4:5], v[0:3] offset:16
	.loc	10 784 1                ; ./amd_xdlops.hpp:784:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp154:
.Lfunc_end67:
	.size	_ZN2ck24gcnasm_mfma_f32_4x4x4f16ILi8ELi64EEEvRKDv4_DF16_S3_PDv4_f, .Lfunc_end67-_ZN2ck24gcnasm_mfma_f32_4x4x4f16ILi8ELi64EEEvRKDv4_DF16_S3_PDv4_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 260
; NumSgprs: 36
; NumVgprs: 18
; NumAgprs: 4
; TotalNumVgprs: 18
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi64ELi64EEEvRKDv2_tS3_PDv32_f ; -- Begin function _ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi64ELi64EEEvRKDv2_tS3_PDv32_f
	.globl	_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi64ELi64EEEvRKDv2_tS3_PDv32_f
	.p2align	2
	.type	_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi64ELi64EEEvRKDv2_tS3_PDv32_f,@function
_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi64ELi64EEEvRKDv2_tS3_PDv32_f: ; @_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi64ELi64EEEvRKDv2_tS3_PDv32_f
_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi64ELi64EEEvRKDv2_tS3_PDv32_f$local:
.Lfunc_begin68:
	.loc	10 791 0                ; ./amd_xdlops.hpp:791:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp155:
	.loc	10 797 56 prologue_end  ; ./amd_xdlops.hpp:797:56
	flat_load_dword v38, v[0:1]
	.loc	10 797 63 is_stmt 0     ; ./amd_xdlops.hpp:797:63
	flat_load_dword v39, v[2:3]
	.loc	10 797 70               ; ./amd_xdlops.hpp:797:70
	flat_load_dwordx4 v[34:37], v[4:5] offset:112
	flat_load_dwordx4 v[30:33], v[4:5] offset:96
	flat_load_dwordx4 v[26:29], v[4:5] offset:80
	flat_load_dwordx4 v[22:25], v[4:5] offset:64
	flat_load_dwordx4 v[18:21], v[4:5] offset:48
	flat_load_dwordx4 v[14:17], v[4:5] offset:32
	flat_load_dwordx4 v[10:13], v[4:5] offset:16
	flat_load_dwordx4 v[6:9], v[4:5]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	v_accvgpr_write_b32 a4, v10
	v_accvgpr_write_b32 a5, v11
	v_accvgpr_write_b32 a6, v12
	v_accvgpr_write_b32 a7, v13
	v_accvgpr_write_b32 a8, v14
	v_accvgpr_write_b32 a9, v15
	v_accvgpr_write_b32 a10, v16
	v_accvgpr_write_b32 a11, v17
	v_accvgpr_write_b32 a12, v18
	v_accvgpr_write_b32 a13, v19
	v_accvgpr_write_b32 a14, v20
	v_accvgpr_write_b32 a15, v21
	v_accvgpr_write_b32 a16, v22
	v_accvgpr_write_b32 a17, v23
	v_accvgpr_write_b32 a18, v24
	v_accvgpr_write_b32 a19, v25
	v_accvgpr_write_b32 a20, v26
	v_accvgpr_write_b32 a21, v27
	v_accvgpr_write_b32 a22, v28
	v_accvgpr_write_b32 a23, v29
	v_accvgpr_write_b32 a24, v30
	v_accvgpr_write_b32 a25, v31
	v_accvgpr_write_b32 a26, v32
	v_accvgpr_write_b32 a27, v33
	v_accvgpr_write_b32 a28, v34
	v_accvgpr_write_b32 a29, v35
	v_accvgpr_write_b32 a30, v36
	v_accvgpr_write_b32 a31, v37
	.loc	10 798 70 is_stmt 1     ; ./amd_xdlops.hpp:798:70
	s_nop 0
	s_nop 0
	flat_load_dwordx4 v[34:37], v[4:5] offset:240
	flat_load_dwordx4 v[30:33], v[4:5] offset:224
	flat_load_dwordx4 v[26:29], v[4:5] offset:208
	flat_load_dwordx4 v[22:25], v[4:5] offset:192
	flat_load_dwordx4 v[18:21], v[4:5] offset:176
	flat_load_dwordx4 v[14:17], v[4:5] offset:160
	flat_load_dwordx4 v[10:13], v[4:5] offset:144
	flat_load_dwordx4 v[6:9], v[4:5] offset:128
	.loc	10 797 16               ; ./amd_xdlops.hpp:797:16
	v_mfma_f32_32x32x2bf16 a[0:31], v38, v39, a[0:31] cbsz:1
	.loc	10 798 70               ; ./amd_xdlops.hpp:798:70
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a63, v37
	v_accvgpr_write_b32 a62, v36
	v_accvgpr_write_b32 a61, v35
	v_accvgpr_write_b32 a60, v34
	v_accvgpr_write_b32 a59, v33
	v_accvgpr_write_b32 a58, v32
	v_accvgpr_write_b32 a57, v31
	v_accvgpr_write_b32 a56, v30
	v_accvgpr_write_b32 a55, v29
	v_accvgpr_write_b32 a54, v28
	v_accvgpr_write_b32 a53, v27
	v_accvgpr_write_b32 a52, v26
	v_accvgpr_write_b32 a51, v25
	v_accvgpr_write_b32 a50, v24
	v_accvgpr_write_b32 a49, v23
	v_accvgpr_write_b32 a48, v22
	v_accvgpr_write_b32 a47, v21
	v_accvgpr_write_b32 a46, v20
	v_accvgpr_write_b32 a45, v19
	v_accvgpr_write_b32 a44, v18
	v_accvgpr_write_b32 a43, v17
	v_accvgpr_write_b32 a42, v16
	v_accvgpr_write_b32 a41, v15
	v_accvgpr_write_b32 a40, v14
	v_accvgpr_write_b32 a39, v13
	v_accvgpr_write_b32 a38, v12
	v_accvgpr_write_b32 a37, v11
	v_accvgpr_write_b32 a36, v10
	v_accvgpr_write_b32 a35, v9
	v_accvgpr_write_b32 a34, v8
	v_accvgpr_write_b32 a33, v7
	v_accvgpr_write_b32 a32, v6
	.loc	10 797 14               ; ./amd_xdlops.hpp:797:14
	v_accvgpr_read_b32 v9, a27
	v_accvgpr_read_b32 v8, a26
	v_accvgpr_read_b32 v7, a25
	v_accvgpr_read_b32 v6, a24
	v_accvgpr_read_b32 v13, a31
	v_accvgpr_read_b32 v12, a30
	v_accvgpr_read_b32 v11, a29
	v_accvgpr_read_b32 v10, a28
	v_accvgpr_read_b32 v17, a19
	v_accvgpr_read_b32 v16, a18
	v_accvgpr_read_b32 v15, a17
	v_accvgpr_read_b32 v14, a16
	v_accvgpr_read_b32 v21, a23
	v_accvgpr_read_b32 v20, a22
	v_accvgpr_read_b32 v19, a21
	v_accvgpr_read_b32 v18, a20
	v_accvgpr_read_b32 v25, a11
	v_accvgpr_read_b32 v24, a10
	v_accvgpr_read_b32 v23, a9
	v_accvgpr_read_b32 v22, a8
	v_accvgpr_read_b32 v29, a15
	v_accvgpr_read_b32 v28, a14
	v_accvgpr_read_b32 v27, a13
	v_accvgpr_read_b32 v26, a12
	v_accvgpr_read_b32 v33, a3
	v_accvgpr_read_b32 v32, a2
	v_accvgpr_read_b32 v31, a1
	v_accvgpr_read_b32 v30, a0
	v_accvgpr_read_b32 v37, a7
	v_accvgpr_read_b32 v36, a6
	v_accvgpr_read_b32 v35, a5
	v_accvgpr_read_b32 v34, a4
	s_nop 0
	s_nop 0
	flat_store_dwordx4 v[4:5], v[6:9] offset:96
	flat_store_dwordx4 v[4:5], v[10:13] offset:112
	flat_store_dwordx4 v[4:5], v[14:17] offset:64
	flat_store_dwordx4 v[4:5], v[18:21] offset:80
	flat_store_dwordx4 v[4:5], v[22:25] offset:32
	flat_store_dwordx4 v[4:5], v[26:29] offset:48
	flat_store_dwordx4 v[4:5], v[30:33]
	flat_store_dwordx4 v[4:5], v[34:37] offset:16
	.loc	10 798 56               ; ./amd_xdlops.hpp:798:56
	flat_load_dword v6, v[0:1]
	.loc	10 798 63 is_stmt 0     ; ./amd_xdlops.hpp:798:63
	s_nop 0
	s_nop 0
	flat_load_dword v7, v[2:3]
	.loc	10 798 16               ; ./amd_xdlops.hpp:798:16
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_mfma_f32_32x32x2bf16 a[0:31], v6, v7, a[32:63] cbsz:1 abid:1
	.loc	10 800 1 is_stmt 1      ; ./amd_xdlops.hpp:800:1
	s_nop 7
	s_nop 7
	s_nop 1
	.loc	10 798 14               ; ./amd_xdlops.hpp:798:14
	v_accvgpr_read_b32 v3, a27
	v_accvgpr_read_b32 v2, a26
	v_accvgpr_read_b32 v1, a25
	v_accvgpr_read_b32 v0, a24
	v_accvgpr_read_b32 v9, a31
	v_accvgpr_read_b32 v8, a30
	v_accvgpr_read_b32 v7, a29
	v_accvgpr_read_b32 v6, a28
	v_accvgpr_read_b32 v13, a19
	v_accvgpr_read_b32 v12, a18
	v_accvgpr_read_b32 v11, a17
	v_accvgpr_read_b32 v10, a16
	v_accvgpr_read_b32 v17, a23
	v_accvgpr_read_b32 v16, a22
	v_accvgpr_read_b32 v15, a21
	v_accvgpr_read_b32 v14, a20
	v_accvgpr_read_b32 v21, a11
	v_accvgpr_read_b32 v20, a10
	v_accvgpr_read_b32 v19, a9
	v_accvgpr_read_b32 v18, a8
	v_accvgpr_read_b32 v25, a15
	v_accvgpr_read_b32 v24, a14
	v_accvgpr_read_b32 v23, a13
	v_accvgpr_read_b32 v22, a12
	v_accvgpr_read_b32 v29, a3
	v_accvgpr_read_b32 v28, a2
	v_accvgpr_read_b32 v27, a1
	v_accvgpr_read_b32 v26, a0
	v_accvgpr_read_b32 v33, a7
	v_accvgpr_read_b32 v32, a6
	v_accvgpr_read_b32 v31, a5
	v_accvgpr_read_b32 v30, a4
	s_nop 0
	s_nop 0
	flat_store_dwordx4 v[4:5], v[0:3] offset:224
	flat_store_dwordx4 v[4:5], v[6:9] offset:240
	flat_store_dwordx4 v[4:5], v[10:13] offset:192
	flat_store_dwordx4 v[4:5], v[14:17] offset:208
	flat_store_dwordx4 v[4:5], v[18:21] offset:160
	flat_store_dwordx4 v[4:5], v[22:25] offset:176
	flat_store_dwordx4 v[4:5], v[26:29] offset:128
	flat_store_dwordx4 v[4:5], v[30:33] offset:144
	.loc	10 800 1                ; ./amd_xdlops.hpp:800:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp156:
.Lfunc_end68:
	.size	_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi64ELi64EEEvRKDv2_tS3_PDv32_f, .Lfunc_end68-_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi64ELi64EEEvRKDv2_tS3_PDv32_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 1396
; NumSgprs: 36
; NumVgprs: 40
; NumAgprs: 64
; TotalNumVgprs: 64
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi32ELi64EEEvRKDv2_tS3_PDv32_f ; -- Begin function _ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi32ELi64EEEvRKDv2_tS3_PDv32_f
	.globl	_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi32ELi64EEEvRKDv2_tS3_PDv32_f
	.p2align	2
	.type	_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi32ELi64EEEvRKDv2_tS3_PDv32_f,@function
_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi32ELi64EEEvRKDv2_tS3_PDv32_f: ; @_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi32ELi64EEEvRKDv2_tS3_PDv32_f
_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi32ELi64EEEvRKDv2_tS3_PDv32_f$local:
.Lfunc_begin69:
	.loc	10 804 0                ; ./amd_xdlops.hpp:804:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp157:
	.loc	10 809 70 prologue_end  ; ./amd_xdlops.hpp:809:70
	flat_load_dwordx4 v[34:37], v[4:5] offset:112
	flat_load_dwordx4 v[30:33], v[4:5] offset:96
	flat_load_dwordx4 v[26:29], v[4:5] offset:80
	flat_load_dwordx4 v[22:25], v[4:5] offset:64
	flat_load_dwordx4 v[18:21], v[4:5] offset:48
	flat_load_dwordx4 v[14:17], v[4:5] offset:32
	flat_load_dwordx4 v[10:13], v[4:5] offset:16
	flat_load_dwordx4 v[6:9], v[4:5]
	.loc	10 809 56 is_stmt 0     ; ./amd_xdlops.hpp:809:56
	flat_load_dword v38, v[0:1]
	.loc	10 811 1 is_stmt 1      ; ./amd_xdlops.hpp:811:1
	s_nop 0
	.loc	10 809 63               ; ./amd_xdlops.hpp:809:63
	s_nop 0
	flat_load_dword v0, v[2:3]
	.loc	10 809 70 is_stmt 0     ; ./amd_xdlops.hpp:809:70
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	v_accvgpr_write_b32 a4, v10
	v_accvgpr_write_b32 a5, v11
	v_accvgpr_write_b32 a6, v12
	v_accvgpr_write_b32 a7, v13
	v_accvgpr_write_b32 a8, v14
	v_accvgpr_write_b32 a9, v15
	v_accvgpr_write_b32 a10, v16
	v_accvgpr_write_b32 a11, v17
	v_accvgpr_write_b32 a12, v18
	v_accvgpr_write_b32 a13, v19
	v_accvgpr_write_b32 a14, v20
	v_accvgpr_write_b32 a15, v21
	v_accvgpr_write_b32 a16, v22
	v_accvgpr_write_b32 a17, v23
	v_accvgpr_write_b32 a18, v24
	v_accvgpr_write_b32 a19, v25
	v_accvgpr_write_b32 a20, v26
	v_accvgpr_write_b32 a21, v27
	v_accvgpr_write_b32 a22, v28
	v_accvgpr_write_b32 a23, v29
	v_accvgpr_write_b32 a24, v30
	v_accvgpr_write_b32 a25, v31
	v_accvgpr_write_b32 a26, v32
	v_accvgpr_write_b32 a27, v33
	v_accvgpr_write_b32 a28, v34
	v_accvgpr_write_b32 a29, v35
	v_accvgpr_write_b32 a30, v36
	v_accvgpr_write_b32 a31, v37
	.loc	10 811 1 is_stmt 1      ; ./amd_xdlops.hpp:811:1
	s_nop 0
	.loc	10 809 16               ; ./amd_xdlops.hpp:809:16
	v_mfma_f32_32x32x2bf16 a[0:31], v38, v0, a[0:31] cbsz:1
	.loc	10 811 1                ; ./amd_xdlops.hpp:811:1
	s_nop 7
	s_nop 7
	s_nop 1
	.loc	10 809 14               ; ./amd_xdlops.hpp:809:14
	v_accvgpr_read_b32 v3, a27
	v_accvgpr_read_b32 v2, a26
	v_accvgpr_read_b32 v1, a25
	v_accvgpr_read_b32 v0, a24
	v_accvgpr_read_b32 v9, a31
	v_accvgpr_read_b32 v8, a30
	v_accvgpr_read_b32 v7, a29
	v_accvgpr_read_b32 v6, a28
	v_accvgpr_read_b32 v13, a19
	v_accvgpr_read_b32 v12, a18
	v_accvgpr_read_b32 v11, a17
	v_accvgpr_read_b32 v10, a16
	v_accvgpr_read_b32 v17, a23
	v_accvgpr_read_b32 v16, a22
	v_accvgpr_read_b32 v15, a21
	v_accvgpr_read_b32 v14, a20
	v_accvgpr_read_b32 v21, a11
	v_accvgpr_read_b32 v20, a10
	v_accvgpr_read_b32 v19, a9
	v_accvgpr_read_b32 v18, a8
	v_accvgpr_read_b32 v25, a15
	v_accvgpr_read_b32 v24, a14
	v_accvgpr_read_b32 v23, a13
	v_accvgpr_read_b32 v22, a12
	v_accvgpr_read_b32 v29, a3
	v_accvgpr_read_b32 v28, a2
	v_accvgpr_read_b32 v27, a1
	v_accvgpr_read_b32 v26, a0
	v_accvgpr_read_b32 v33, a7
	v_accvgpr_read_b32 v32, a6
	v_accvgpr_read_b32 v31, a5
	v_accvgpr_read_b32 v30, a4
	s_nop 0
	s_nop 0
	flat_store_dwordx4 v[4:5], v[0:3] offset:96
	flat_store_dwordx4 v[4:5], v[6:9] offset:112
	flat_store_dwordx4 v[4:5], v[10:13] offset:64
	flat_store_dwordx4 v[4:5], v[14:17] offset:80
	flat_store_dwordx4 v[4:5], v[18:21] offset:32
	flat_store_dwordx4 v[4:5], v[22:25] offset:48
	flat_store_dwordx4 v[4:5], v[26:29]
	flat_store_dwordx4 v[4:5], v[30:33] offset:16
	.loc	10 811 1                ; ./amd_xdlops.hpp:811:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp158:
.Lfunc_end69:
	.size	_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi32ELi64EEEvRKDv2_tS3_PDv32_f, .Lfunc_end69-_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi32ELi64EEEvRKDv2_tS3_PDv32_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 712
; NumSgprs: 36
; NumVgprs: 39
; NumAgprs: 32
; TotalNumVgprs: 39
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi64ELi32EEEvRKDv2_tS3_PDv32_f ; -- Begin function _ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi64ELi32EEEvRKDv2_tS3_PDv32_f
	.globl	_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi64ELi32EEEvRKDv2_tS3_PDv32_f
	.p2align	2
	.type	_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi64ELi32EEEvRKDv2_tS3_PDv32_f,@function
_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi64ELi32EEEvRKDv2_tS3_PDv32_f: ; @_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi64ELi32EEEvRKDv2_tS3_PDv32_f
_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi64ELi32EEEvRKDv2_tS3_PDv32_f$local:
.Lfunc_begin70:
	.loc	10 815 0                ; ./amd_xdlops.hpp:815:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp159:
	.loc	10 820 70 prologue_end  ; ./amd_xdlops.hpp:820:70
	flat_load_dwordx4 v[34:37], v[4:5] offset:112
	flat_load_dwordx4 v[30:33], v[4:5] offset:96
	flat_load_dwordx4 v[26:29], v[4:5] offset:80
	flat_load_dwordx4 v[22:25], v[4:5] offset:64
	flat_load_dwordx4 v[18:21], v[4:5] offset:48
	flat_load_dwordx4 v[14:17], v[4:5] offset:32
	flat_load_dwordx4 v[10:13], v[4:5] offset:16
	flat_load_dwordx4 v[6:9], v[4:5]
	.loc	10 820 56 is_stmt 0     ; ./amd_xdlops.hpp:820:56
	flat_load_dword v38, v[0:1]
	.loc	10 822 1 is_stmt 1      ; ./amd_xdlops.hpp:822:1
	s_nop 0
	.loc	10 820 63               ; ./amd_xdlops.hpp:820:63
	s_nop 0
	flat_load_dword v0, v[2:3]
	.loc	10 820 70 is_stmt 0     ; ./amd_xdlops.hpp:820:70
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	v_accvgpr_write_b32 a4, v10
	v_accvgpr_write_b32 a5, v11
	v_accvgpr_write_b32 a6, v12
	v_accvgpr_write_b32 a7, v13
	v_accvgpr_write_b32 a8, v14
	v_accvgpr_write_b32 a9, v15
	v_accvgpr_write_b32 a10, v16
	v_accvgpr_write_b32 a11, v17
	v_accvgpr_write_b32 a12, v18
	v_accvgpr_write_b32 a13, v19
	v_accvgpr_write_b32 a14, v20
	v_accvgpr_write_b32 a15, v21
	v_accvgpr_write_b32 a16, v22
	v_accvgpr_write_b32 a17, v23
	v_accvgpr_write_b32 a18, v24
	v_accvgpr_write_b32 a19, v25
	v_accvgpr_write_b32 a20, v26
	v_accvgpr_write_b32 a21, v27
	v_accvgpr_write_b32 a22, v28
	v_accvgpr_write_b32 a23, v29
	v_accvgpr_write_b32 a24, v30
	v_accvgpr_write_b32 a25, v31
	v_accvgpr_write_b32 a26, v32
	v_accvgpr_write_b32 a27, v33
	v_accvgpr_write_b32 a28, v34
	v_accvgpr_write_b32 a29, v35
	v_accvgpr_write_b32 a30, v36
	v_accvgpr_write_b32 a31, v37
	.loc	10 822 1 is_stmt 1      ; ./amd_xdlops.hpp:822:1
	s_nop 0
	.loc	10 820 16               ; ./amd_xdlops.hpp:820:16
	v_mfma_f32_32x32x2bf16 a[0:31], v38, v0, a[0:31] blgp:1
	.loc	10 822 1                ; ./amd_xdlops.hpp:822:1
	s_nop 7
	s_nop 7
	s_nop 1
	.loc	10 820 14               ; ./amd_xdlops.hpp:820:14
	v_accvgpr_read_b32 v3, a27
	v_accvgpr_read_b32 v2, a26
	v_accvgpr_read_b32 v1, a25
	v_accvgpr_read_b32 v0, a24
	v_accvgpr_read_b32 v9, a31
	v_accvgpr_read_b32 v8, a30
	v_accvgpr_read_b32 v7, a29
	v_accvgpr_read_b32 v6, a28
	v_accvgpr_read_b32 v13, a19
	v_accvgpr_read_b32 v12, a18
	v_accvgpr_read_b32 v11, a17
	v_accvgpr_read_b32 v10, a16
	v_accvgpr_read_b32 v17, a23
	v_accvgpr_read_b32 v16, a22
	v_accvgpr_read_b32 v15, a21
	v_accvgpr_read_b32 v14, a20
	v_accvgpr_read_b32 v21, a11
	v_accvgpr_read_b32 v20, a10
	v_accvgpr_read_b32 v19, a9
	v_accvgpr_read_b32 v18, a8
	v_accvgpr_read_b32 v25, a15
	v_accvgpr_read_b32 v24, a14
	v_accvgpr_read_b32 v23, a13
	v_accvgpr_read_b32 v22, a12
	v_accvgpr_read_b32 v29, a3
	v_accvgpr_read_b32 v28, a2
	v_accvgpr_read_b32 v27, a1
	v_accvgpr_read_b32 v26, a0
	v_accvgpr_read_b32 v33, a7
	v_accvgpr_read_b32 v32, a6
	v_accvgpr_read_b32 v31, a5
	v_accvgpr_read_b32 v30, a4
	s_nop 0
	s_nop 0
	flat_store_dwordx4 v[4:5], v[0:3] offset:96
	flat_store_dwordx4 v[4:5], v[6:9] offset:112
	flat_store_dwordx4 v[4:5], v[10:13] offset:64
	flat_store_dwordx4 v[4:5], v[14:17] offset:80
	flat_store_dwordx4 v[4:5], v[18:21] offset:32
	flat_store_dwordx4 v[4:5], v[22:25] offset:48
	flat_store_dwordx4 v[4:5], v[26:29]
	flat_store_dwordx4 v[4:5], v[30:33] offset:16
	.loc	10 822 1                ; ./amd_xdlops.hpp:822:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp160:
.Lfunc_end70:
	.size	_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi64ELi32EEEvRKDv2_tS3_PDv32_f, .Lfunc_end70-_ZN2ck27gcnasm_mfma_f32_32x32x2bf16ILi64ELi32EEEvRKDv2_tS3_PDv32_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 712
; NumSgprs: 36
; NumVgprs: 39
; NumAgprs: 32
; TotalNumVgprs: 39
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck27gcnasm_mfma_f32_32x32x4bf16ERKDv2_tS2_PDv16_f ; -- Begin function _ZN2ck27gcnasm_mfma_f32_32x32x4bf16ERKDv2_tS2_PDv16_f
	.globl	_ZN2ck27gcnasm_mfma_f32_32x32x4bf16ERKDv2_tS2_PDv16_f
	.p2align	2
	.type	_ZN2ck27gcnasm_mfma_f32_32x32x4bf16ERKDv2_tS2_PDv16_f,@function
_ZN2ck27gcnasm_mfma_f32_32x32x4bf16ERKDv2_tS2_PDv16_f: ; @_ZN2ck27gcnasm_mfma_f32_32x32x4bf16ERKDv2_tS2_PDv16_f
_ZN2ck27gcnasm_mfma_f32_32x32x4bf16ERKDv2_tS2_PDv16_f$local:
.Lfunc_begin71:
	.loc	10 825 0                ; ./amd_xdlops.hpp:825:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp161:
	.loc	10 830 70 prologue_end  ; ./amd_xdlops.hpp:830:70
	flat_load_dwordx4 v[18:21], v[4:5] offset:48
	flat_load_dwordx4 v[14:17], v[4:5] offset:32
	flat_load_dwordx4 v[10:13], v[4:5] offset:16
	flat_load_dwordx4 v[6:9], v[4:5]
	.loc	10 830 56 is_stmt 0     ; ./amd_xdlops.hpp:830:56
	flat_load_dword v22, v[0:1]
	.loc	10 832 1 is_stmt 1      ; ./amd_xdlops.hpp:832:1
	s_nop 0
	.loc	10 830 63               ; ./amd_xdlops.hpp:830:63
	s_nop 0
	flat_load_dword v0, v[2:3]
	.loc	10 830 70 is_stmt 0     ; ./amd_xdlops.hpp:830:70
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	v_accvgpr_write_b32 a4, v10
	v_accvgpr_write_b32 a5, v11
	v_accvgpr_write_b32 a6, v12
	v_accvgpr_write_b32 a7, v13
	v_accvgpr_write_b32 a8, v14
	v_accvgpr_write_b32 a9, v15
	v_accvgpr_write_b32 a10, v16
	v_accvgpr_write_b32 a11, v17
	v_accvgpr_write_b32 a12, v18
	v_accvgpr_write_b32 a13, v19
	v_accvgpr_write_b32 a14, v20
	v_accvgpr_write_b32 a15, v21
	.loc	10 832 1 is_stmt 1      ; ./amd_xdlops.hpp:832:1
	s_nop 0
	.loc	10 830 16               ; ./amd_xdlops.hpp:830:16
	v_mfma_f32_32x32x4bf16 a[0:15], v22, v0, a[0:15]
	.loc	10 832 1                ; ./amd_xdlops.hpp:832:1
	s_nop 7
	s_nop 7
	s_nop 1
	.loc	10 830 14               ; ./amd_xdlops.hpp:830:14
	v_accvgpr_read_b32 v3, a11
	v_accvgpr_read_b32 v2, a10
	v_accvgpr_read_b32 v1, a9
	v_accvgpr_read_b32 v0, a8
	v_accvgpr_read_b32 v9, a15
	v_accvgpr_read_b32 v8, a14
	v_accvgpr_read_b32 v7, a13
	v_accvgpr_read_b32 v6, a12
	v_accvgpr_read_b32 v13, a3
	v_accvgpr_read_b32 v12, a2
	v_accvgpr_read_b32 v11, a1
	v_accvgpr_read_b32 v10, a0
	v_accvgpr_read_b32 v17, a7
	v_accvgpr_read_b32 v16, a6
	v_accvgpr_read_b32 v15, a5
	v_accvgpr_read_b32 v14, a4
	s_nop 0
	s_nop 0
	flat_store_dwordx4 v[4:5], v[0:3] offset:32
	flat_store_dwordx4 v[4:5], v[6:9] offset:48
	flat_store_dwordx4 v[4:5], v[10:13]
	flat_store_dwordx4 v[4:5], v[14:17] offset:16
	.loc	10 832 1                ; ./amd_xdlops.hpp:832:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp162:
.Lfunc_end71:
	.size	_ZN2ck27gcnasm_mfma_f32_32x32x4bf16ERKDv2_tS2_PDv16_f, .Lfunc_end71-_ZN2ck27gcnasm_mfma_f32_32x32x4bf16ERKDv2_tS2_PDv16_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 392
; NumSgprs: 36
; NumVgprs: 23
; NumAgprs: 16
; TotalNumVgprs: 23
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck27gcnasm_mfma_f32_16x16x8bf16ERKDv2_tS2_PDv4_f ; -- Begin function _ZN2ck27gcnasm_mfma_f32_16x16x8bf16ERKDv2_tS2_PDv4_f
	.globl	_ZN2ck27gcnasm_mfma_f32_16x16x8bf16ERKDv2_tS2_PDv4_f
	.p2align	2
	.type	_ZN2ck27gcnasm_mfma_f32_16x16x8bf16ERKDv2_tS2_PDv4_f,@function
_ZN2ck27gcnasm_mfma_f32_16x16x8bf16ERKDv2_tS2_PDv4_f: ; @_ZN2ck27gcnasm_mfma_f32_16x16x8bf16ERKDv2_tS2_PDv4_f
_ZN2ck27gcnasm_mfma_f32_16x16x8bf16ERKDv2_tS2_PDv4_f$local:
.Lfunc_begin72:
	.loc	10 835 0                ; ./amd_xdlops.hpp:835:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp163:
	.loc	10 840 56 prologue_end  ; ./amd_xdlops.hpp:840:56
	flat_load_dword v10, v[0:1]
	.loc	10 840 63 is_stmt 0     ; ./amd_xdlops.hpp:840:63
	flat_load_dword v11, v[2:3]
	.loc	10 840 70               ; ./amd_xdlops.hpp:840:70
	flat_load_dwordx4 v[6:9], v[4:5]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	.loc	10 842 1 is_stmt 1      ; ./amd_xdlops.hpp:842:1
	s_nop 0
	.loc	10 840 16               ; ./amd_xdlops.hpp:840:16
	v_mfma_f32_16x16x8bf16 a[0:3], v10, v11, a[0:3]
	.loc	10 842 1                ; ./amd_xdlops.hpp:842:1
	s_nop 7
	s_nop 1
	.loc	10 840 16               ; ./amd_xdlops.hpp:840:16
	v_accvgpr_read_b32 v0, a0
	v_accvgpr_read_b32 v1, a1
	v_accvgpr_read_b32 v2, a2
	v_accvgpr_read_b32 v3, a3
	.loc	10 842 1                ; ./amd_xdlops.hpp:842:1
	s_nop 1
	.loc	10 840 14               ; ./amd_xdlops.hpp:840:14
	flat_store_dwordx4 v[4:5], v[0:3]
	.loc	10 842 1                ; ./amd_xdlops.hpp:842:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp164:
.Lfunc_end72:
	.size	_ZN2ck27gcnasm_mfma_f32_16x16x8bf16ERKDv2_tS2_PDv4_f, .Lfunc_end72-_ZN2ck27gcnasm_mfma_f32_16x16x8bf16ERKDv2_tS2_PDv4_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 136
; NumSgprs: 36
; NumVgprs: 12
; NumAgprs: 4
; TotalNumVgprs: 12
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck27gcnasm_mfma_f32_16x16x2bf16ILi16ELi64EEEvRKDv2_tS3_PDv16_f ; -- Begin function _ZN2ck27gcnasm_mfma_f32_16x16x2bf16ILi16ELi64EEEvRKDv2_tS3_PDv16_f
	.globl	_ZN2ck27gcnasm_mfma_f32_16x16x2bf16ILi16ELi64EEEvRKDv2_tS3_PDv16_f
	.p2align	2
	.type	_ZN2ck27gcnasm_mfma_f32_16x16x2bf16ILi16ELi64EEEvRKDv2_tS3_PDv16_f,@function
_ZN2ck27gcnasm_mfma_f32_16x16x2bf16ILi16ELi64EEEvRKDv2_tS3_PDv16_f: ; @_ZN2ck27gcnasm_mfma_f32_16x16x2bf16ILi16ELi64EEEvRKDv2_tS3_PDv16_f
_ZN2ck27gcnasm_mfma_f32_16x16x2bf16ILi16ELi64EEEvRKDv2_tS3_PDv16_f$local:
.Lfunc_begin73:
	.loc	10 849 0                ; ./amd_xdlops.hpp:849:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp165:
	.loc	10 854 70 prologue_end  ; ./amd_xdlops.hpp:854:70
	flat_load_dwordx4 v[18:21], v[4:5] offset:48
	flat_load_dwordx4 v[14:17], v[4:5] offset:32
	flat_load_dwordx4 v[10:13], v[4:5] offset:16
	flat_load_dwordx4 v[6:9], v[4:5]
	.loc	10 854 56 is_stmt 0     ; ./amd_xdlops.hpp:854:56
	flat_load_dword v22, v[0:1]
	.loc	10 856 1 is_stmt 1      ; ./amd_xdlops.hpp:856:1
	s_nop 0
	.loc	10 854 63               ; ./amd_xdlops.hpp:854:63
	s_nop 0
	flat_load_dword v0, v[2:3]
	.loc	10 854 70 is_stmt 0     ; ./amd_xdlops.hpp:854:70
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	v_accvgpr_write_b32 a4, v10
	v_accvgpr_write_b32 a5, v11
	v_accvgpr_write_b32 a6, v12
	v_accvgpr_write_b32 a7, v13
	v_accvgpr_write_b32 a8, v14
	v_accvgpr_write_b32 a9, v15
	v_accvgpr_write_b32 a10, v16
	v_accvgpr_write_b32 a11, v17
	v_accvgpr_write_b32 a12, v18
	v_accvgpr_write_b32 a13, v19
	v_accvgpr_write_b32 a14, v20
	v_accvgpr_write_b32 a15, v21
	.loc	10 856 1 is_stmt 1      ; ./amd_xdlops.hpp:856:1
	s_nop 0
	.loc	10 854 16               ; ./amd_xdlops.hpp:854:16
	v_mfma_f32_16x16x2bf16 a[0:15], v22, v0, a[0:15] cbsz:2
	.loc	10 856 1                ; ./amd_xdlops.hpp:856:1
	s_nop 7
	s_nop 1
	.loc	10 854 14               ; ./amd_xdlops.hpp:854:14
	v_accvgpr_read_b32 v3, a11
	v_accvgpr_read_b32 v2, a10
	v_accvgpr_read_b32 v1, a9
	v_accvgpr_read_b32 v0, a8
	v_accvgpr_read_b32 v9, a15
	v_accvgpr_read_b32 v8, a14
	v_accvgpr_read_b32 v7, a13
	v_accvgpr_read_b32 v6, a12
	v_accvgpr_read_b32 v13, a3
	v_accvgpr_read_b32 v12, a2
	v_accvgpr_read_b32 v11, a1
	v_accvgpr_read_b32 v10, a0
	v_accvgpr_read_b32 v17, a7
	v_accvgpr_read_b32 v16, a6
	v_accvgpr_read_b32 v15, a5
	v_accvgpr_read_b32 v14, a4
	s_nop 0
	s_nop 0
	flat_store_dwordx4 v[4:5], v[0:3] offset:32
	flat_store_dwordx4 v[4:5], v[6:9] offset:48
	flat_store_dwordx4 v[4:5], v[10:13]
	flat_store_dwordx4 v[4:5], v[14:17] offset:16
	.loc	10 856 1                ; ./amd_xdlops.hpp:856:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp166:
.Lfunc_end73:
	.size	_ZN2ck27gcnasm_mfma_f32_16x16x2bf16ILi16ELi64EEEvRKDv2_tS3_PDv16_f, .Lfunc_end73-_ZN2ck27gcnasm_mfma_f32_16x16x2bf16ILi16ELi64EEEvRKDv2_tS3_PDv16_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 388
; NumSgprs: 36
; NumVgprs: 23
; NumAgprs: 16
; TotalNumVgprs: 23
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck27gcnasm_mfma_f32_16x16x2bf16ILi64ELi16EEEvRKDv2_tS3_PDv16_f ; -- Begin function _ZN2ck27gcnasm_mfma_f32_16x16x2bf16ILi64ELi16EEEvRKDv2_tS3_PDv16_f
	.globl	_ZN2ck27gcnasm_mfma_f32_16x16x2bf16ILi64ELi16EEEvRKDv2_tS3_PDv16_f
	.p2align	2
	.type	_ZN2ck27gcnasm_mfma_f32_16x16x2bf16ILi64ELi16EEEvRKDv2_tS3_PDv16_f,@function
_ZN2ck27gcnasm_mfma_f32_16x16x2bf16ILi64ELi16EEEvRKDv2_tS3_PDv16_f: ; @_ZN2ck27gcnasm_mfma_f32_16x16x2bf16ILi64ELi16EEEvRKDv2_tS3_PDv16_f
_ZN2ck27gcnasm_mfma_f32_16x16x2bf16ILi64ELi16EEEvRKDv2_tS3_PDv16_f$local:
.Lfunc_begin74:
	.loc	10 860 0                ; ./amd_xdlops.hpp:860:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp167:
	.loc	10 865 70 prologue_end  ; ./amd_xdlops.hpp:865:70
	flat_load_dwordx4 v[18:21], v[4:5] offset:48
	flat_load_dwordx4 v[14:17], v[4:5] offset:32
	flat_load_dwordx4 v[10:13], v[4:5] offset:16
	flat_load_dwordx4 v[6:9], v[4:5]
	.loc	10 865 56 is_stmt 0     ; ./amd_xdlops.hpp:865:56
	flat_load_dword v22, v[0:1]
	.loc	10 867 1 is_stmt 1      ; ./amd_xdlops.hpp:867:1
	s_nop 0
	.loc	10 865 63               ; ./amd_xdlops.hpp:865:63
	s_nop 0
	flat_load_dword v0, v[2:3]
	.loc	10 865 70 is_stmt 0     ; ./amd_xdlops.hpp:865:70
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	v_accvgpr_write_b32 a4, v10
	v_accvgpr_write_b32 a5, v11
	v_accvgpr_write_b32 a6, v12
	v_accvgpr_write_b32 a7, v13
	v_accvgpr_write_b32 a8, v14
	v_accvgpr_write_b32 a9, v15
	v_accvgpr_write_b32 a10, v16
	v_accvgpr_write_b32 a11, v17
	v_accvgpr_write_b32 a12, v18
	v_accvgpr_write_b32 a13, v19
	v_accvgpr_write_b32 a14, v20
	v_accvgpr_write_b32 a15, v21
	.loc	10 867 1 is_stmt 1      ; ./amd_xdlops.hpp:867:1
	s_nop 0
	.loc	10 865 16               ; ./amd_xdlops.hpp:865:16
	v_mfma_f32_16x16x2bf16 a[0:15], v22, v0, a[0:15] blgp:4
	.loc	10 867 1                ; ./amd_xdlops.hpp:867:1
	s_nop 7
	s_nop 1
	.loc	10 865 14               ; ./amd_xdlops.hpp:865:14
	v_accvgpr_read_b32 v3, a11
	v_accvgpr_read_b32 v2, a10
	v_accvgpr_read_b32 v1, a9
	v_accvgpr_read_b32 v0, a8
	v_accvgpr_read_b32 v9, a15
	v_accvgpr_read_b32 v8, a14
	v_accvgpr_read_b32 v7, a13
	v_accvgpr_read_b32 v6, a12
	v_accvgpr_read_b32 v13, a3
	v_accvgpr_read_b32 v12, a2
	v_accvgpr_read_b32 v11, a1
	v_accvgpr_read_b32 v10, a0
	v_accvgpr_read_b32 v17, a7
	v_accvgpr_read_b32 v16, a6
	v_accvgpr_read_b32 v15, a5
	v_accvgpr_read_b32 v14, a4
	s_nop 0
	s_nop 0
	flat_store_dwordx4 v[4:5], v[0:3] offset:32
	flat_store_dwordx4 v[4:5], v[6:9] offset:48
	flat_store_dwordx4 v[4:5], v[10:13]
	flat_store_dwordx4 v[4:5], v[14:17] offset:16
	.loc	10 867 1                ; ./amd_xdlops.hpp:867:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp168:
.Lfunc_end74:
	.size	_ZN2ck27gcnasm_mfma_f32_16x16x2bf16ILi64ELi16EEEvRKDv2_tS3_PDv16_f, .Lfunc_end74-_ZN2ck27gcnasm_mfma_f32_16x16x2bf16ILi64ELi16EEEvRKDv2_tS3_PDv16_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 388
; NumSgprs: 36
; NumVgprs: 23
; NumAgprs: 16
; TotalNumVgprs: 23
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck25gcnasm_mfma_f32_4x4x2bf16ILi4ELi64EEEvRKDv2_tS3_PDv4_f ; -- Begin function _ZN2ck25gcnasm_mfma_f32_4x4x2bf16ILi4ELi64EEEvRKDv2_tS3_PDv4_f
	.globl	_ZN2ck25gcnasm_mfma_f32_4x4x2bf16ILi4ELi64EEEvRKDv2_tS3_PDv4_f
	.p2align	2
	.type	_ZN2ck25gcnasm_mfma_f32_4x4x2bf16ILi4ELi64EEEvRKDv2_tS3_PDv4_f,@function
_ZN2ck25gcnasm_mfma_f32_4x4x2bf16ILi4ELi64EEEvRKDv2_tS3_PDv4_f: ; @_ZN2ck25gcnasm_mfma_f32_4x4x2bf16ILi4ELi64EEEvRKDv2_tS3_PDv4_f
_ZN2ck25gcnasm_mfma_f32_4x4x2bf16ILi4ELi64EEEvRKDv2_tS3_PDv4_f$local:
.Lfunc_begin75:
	.loc	10 874 0                ; ./amd_xdlops.hpp:874:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp169:
	.loc	10 879 54 prologue_end  ; ./amd_xdlops.hpp:879:54
	flat_load_dword v10, v[0:1]
	.loc	10 879 61 is_stmt 0     ; ./amd_xdlops.hpp:879:61
	flat_load_dword v11, v[2:3]
	.loc	10 879 68               ; ./amd_xdlops.hpp:879:68
	flat_load_dwordx4 v[6:9], v[4:5]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	.loc	10 881 1 is_stmt 1      ; ./amd_xdlops.hpp:881:1
	s_nop 0
	.loc	10 879 16               ; ./amd_xdlops.hpp:879:16
	v_mfma_f32_4x4x2bf16 a[0:3], v10, v11, a[0:3] cbsz:4
	.loc	10 881 1                ; ./amd_xdlops.hpp:881:1
	s_nop 3
	.loc	10 879 16               ; ./amd_xdlops.hpp:879:16
	v_accvgpr_read_b32 v0, a0
	v_accvgpr_read_b32 v1, a1
	v_accvgpr_read_b32 v2, a2
	v_accvgpr_read_b32 v3, a3
	.loc	10 881 1                ; ./amd_xdlops.hpp:881:1
	s_nop 1
	.loc	10 879 14               ; ./amd_xdlops.hpp:879:14
	flat_store_dwordx4 v[4:5], v[0:3]
	.loc	10 881 1                ; ./amd_xdlops.hpp:881:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp170:
.Lfunc_end75:
	.size	_ZN2ck25gcnasm_mfma_f32_4x4x2bf16ILi4ELi64EEEvRKDv2_tS3_PDv4_f, .Lfunc_end75-_ZN2ck25gcnasm_mfma_f32_4x4x2bf16ILi4ELi64EEEvRKDv2_tS3_PDv4_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 132
; NumSgprs: 36
; NumVgprs: 12
; NumAgprs: 4
; TotalNumVgprs: 12
; ScratchSize: 0
; MemoryBound: 1
	.text
	.hidden	_ZN2ck25gcnasm_mfma_f32_4x4x2bf16ILi8ELi64EEEvRKDv2_tS3_PDv4_f ; -- Begin function _ZN2ck25gcnasm_mfma_f32_4x4x2bf16ILi8ELi64EEEvRKDv2_tS3_PDv4_f
	.globl	_ZN2ck25gcnasm_mfma_f32_4x4x2bf16ILi8ELi64EEEvRKDv2_tS3_PDv4_f
	.p2align	2
	.type	_ZN2ck25gcnasm_mfma_f32_4x4x2bf16ILi8ELi64EEEvRKDv2_tS3_PDv4_f,@function
_ZN2ck25gcnasm_mfma_f32_4x4x2bf16ILi8ELi64EEEvRKDv2_tS3_PDv4_f: ; @_ZN2ck25gcnasm_mfma_f32_4x4x2bf16ILi8ELi64EEEvRKDv2_tS3_PDv4_f
_ZN2ck25gcnasm_mfma_f32_4x4x2bf16ILi8ELi64EEEvRKDv2_tS3_PDv4_f$local:
.Lfunc_begin76:
	.loc	10 885 0                ; ./amd_xdlops.hpp:885:0
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
.Ltmp171:
	.loc	10 891 54 prologue_end  ; ./amd_xdlops.hpp:891:54
	flat_load_dword v14, v[0:1]
	.loc	10 891 61 is_stmt 0     ; ./amd_xdlops.hpp:891:61
	flat_load_dword v15, v[2:3]
	.loc	10 891 68               ; ./amd_xdlops.hpp:891:68
	flat_load_dwordx4 v[6:9], v[4:5]
	.loc	10 892 68 is_stmt 1     ; ./amd_xdlops.hpp:892:68
	flat_load_dwordx4 v[10:13], v[4:5] offset:16
	.loc	10 891 68               ; ./amd_xdlops.hpp:891:68
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_accvgpr_write_b32 a0, v6
	v_accvgpr_write_b32 a1, v7
	v_accvgpr_write_b32 a2, v8
	v_accvgpr_write_b32 a3, v9
	.loc	10 894 1                ; ./amd_xdlops.hpp:894:1
	s_nop 0
	.loc	10 891 16               ; ./amd_xdlops.hpp:891:16
	v_mfma_f32_4x4x2bf16 a[0:3], v14, v15, a[0:3] cbsz:4
	.loc	10 894 1                ; ./amd_xdlops.hpp:894:1
	s_nop 3
	.loc	10 891 16               ; ./amd_xdlops.hpp:891:16
	v_accvgpr_read_b32 v9, a3
	v_accvgpr_read_b32 v8, a2
	v_accvgpr_read_b32 v7, a1
	v_accvgpr_read_b32 v6, a0
	.loc	10 892 68               ; ./amd_xdlops.hpp:892:68
	v_accvgpr_write_b32 a0, v10
	v_accvgpr_write_b32 a1, v11
	v_accvgpr_write_b32 a2, v12
	v_accvgpr_write_b32 a3, v13
	.loc	10 894 1                ; ./amd_xdlops.hpp:894:1
	s_nop 0
	.loc	10 891 14               ; ./amd_xdlops.hpp:891:14
	s_nop 0
	flat_store_dwordx4 v[4:5], v[6:9]
	.loc	10 892 54               ; ./amd_xdlops.hpp:892:54
	flat_load_dword v6, v[0:1]
	.loc	10 892 61 is_stmt 0     ; ./amd_xdlops.hpp:892:61
	s_nop 0
	s_nop 0
	flat_load_dword v7, v[2:3]
	.loc	10 892 16               ; ./amd_xdlops.hpp:892:16
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_mfma_f32_4x4x2bf16 a[0:3], v6, v7, a[0:3] cbsz:4 abid:1
	.loc	10 894 1 is_stmt 1      ; ./amd_xdlops.hpp:894:1
	s_nop 3
	.loc	10 892 16               ; ./amd_xdlops.hpp:892:16
	v_accvgpr_read_b32 v0, a0
	v_accvgpr_read_b32 v1, a1
	v_accvgpr_read_b32 v2, a2
	v_accvgpr_read_b32 v3, a3
	.loc	10 894 1                ; ./amd_xdlops.hpp:894:1
	s_nop 1
	.loc	10 892 14               ; ./amd_xdlops.hpp:892:14
	flat_store_dwordx4 v[4:5], v[0:3] offset:16
	.loc	10 894 1                ; ./amd_xdlops.hpp:894:1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Ltmp172:
.Lfunc_end76:
	.size	_ZN2ck25gcnasm_mfma_f32_4x4x2bf16ILi8ELi64EEEvRKDv2_tS3_PDv4_f, .Lfunc_end76-_ZN2ck25gcnasm_mfma_f32_4x4x2bf16ILi8ELi64EEEvRKDv2_tS3_PDv4_f
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 260
; NumSgprs: 36
; NumVgprs: 16
; NumAgprs: 4
; TotalNumVgprs: 16
; ScratchSize: 0
; MemoryBound: 1
	.text
	.protected	gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw ; -- Begin function gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw
	.globl	gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw
	.p2align	8
	.type	gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw,@function
gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw: ; @gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw
gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw$local:
.Lfunc_begin77:
	.file	11 "/nhwc_miopen/build/kevin/miopen-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp-500d-1bac-474f-b3b3/gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp"
	.loc	11 11 0                 ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:11:0
; %bb.0:                                ; %_ZZN2ck5MergeINS_8SequenceIJLi128ELi14ELi14EEEEE23CalculateLowerIndexDiffERKNS_5ArrayIiLi1EEES7_RKNS4_IiLi3EEEENKUlT_E0_clINS_17integral_constantIiLi2EEEEEDaSB_.exit.i.i.i.i.i.i.i.i.i.i.i.i.i.i.i.i.i.i.i.i.i.i.i.1
	s_add_u32 flat_scratch_lo, s6, s9
	s_addc_u32 flat_scratch_hi, s7, 0
	s_add_u32 s0, s0, s9
	s_load_dwordx2 s[28:29], s[4:5], 0x0
	s_load_dwordx2 s[24:25], s[4:5], 0x8
	s_load_dwordx2 s[20:21], s[4:5], 0x10
	s_mov_b32 s4, 0x5397829d
	s_addc_u32 s1, s1, 0
.Ltmp173:
	.file	12 "/nhwc_miopen/build/kevin/miopen-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp-500d-1bac-474f-b3b3/./multi_index_transform.hpp"
	.loc	12 210 34 prologue_end  ; ./multi_index_transform.hpp:210:34
	s_mul_hi_i32 s5, s8, s4
	s_lshr_b32 s6, s5, 31
	s_ashr_i32 s18, s5, 8
	s_add_i32 s18, s18, s6
	.loc	12 211 18               ; ./multi_index_transform.hpp:211:18
	s_mul_i32 s5, s18, 0xfffffcf0
	s_add_i32 s5, s5, s8
.Ltmp174:
	.loc	12 210 34               ; ./multi_index_transform.hpp:210:34
	s_ashr_i32 s6, s5, 31
	s_lshr_b32 s6, s6, 30
	s_add_i32 s6, s5, s6
	s_ashr_i32 s7, s6, 2
.Ltmp175:
	.file	13 "/nhwc_miopen/build/kevin/miopen-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp-500d-1bac-474f-b3b3/./gridwise_gemm_xdlops_fp16_bfp16.hpp"
	.loc	13 1118 72              ; ./gridwise_gemm_xdlops_fp16_bfp16.hpp:1118:72
	s_lshl_b32 s22, s7, 7
.Ltmp176:
	.loc	12 210 34               ; ./multi_index_transform.hpp:210:34
	v_lshrrev_b32_e32 v65, 3, v0
.Ltmp177:
	.file	14 "/nhwc_miopen/build/kevin/miopen-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp-500d-1bac-474f-b3b3/./math.hpp"
	.loc	14 20 101               ; ./math.hpp:20:101
	v_lshl_or_b32 v2, v65, 2, s22
.Ltmp178:
	.loc	12 210 34               ; ./multi_index_transform.hpp:210:34
	v_mul_hi_i32 v3, v2, s4
.Ltmp179:
	.loc	12 211 35               ; ./multi_index_transform.hpp:211:35
	s_and_b32 s6, s6, -4
	.loc	12 211 18 is_stmt 0     ; ./multi_index_transform.hpp:211:18
	s_sub_i32 s5, s5, s6
.Ltmp180:
	.loc	13 1115 72 is_stmt 1    ; ./gridwise_gemm_xdlops_fp16_bfp16.hpp:1115:72
	s_lshl_b32 s19, s5, 8
.Ltmp181:
	.file	15 "/nhwc_miopen/build/kevin/miopen-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp-500d-1bac-474f-b3b3/./tensor_descriptor.hpp"
	.loc	15 85 71                ; ./tensor_descriptor.hpp:85:71
	s_lshl_b32 s4, s18, 20
.Ltmp182:
	.loc	12 210 34               ; ./multi_index_transform.hpp:210:34
	v_lshrrev_b32_e32 v5, 31, v3
	v_ashrrev_i32_e32 v3, 6, v3
.Ltmp183:
	.loc	12 211 18               ; ./multi_index_transform.hpp:211:18
	v_and_b32_e32 v8, 31, v0
.Ltmp184:
	.loc	14 20 101               ; ./math.hpp:20:101
	s_add_i32 s4, s19, s4
	v_lshl_or_b32 v4, v8, 3, s4
.Ltmp185:
	.loc	12 210 34               ; ./multi_index_transform.hpp:210:34
	v_add_u32_e32 v3, v3, v5
	s_movk_i32 s4, 0xff3c
.Ltmp186:
	.loc	12 210 34 is_stmt 0     ; ./multi_index_transform.hpp:210:34
	v_lshrrev_b32_e32 v1, 5, v0
.Ltmp187:
	.loc	12 211 18 is_stmt 1     ; ./multi_index_transform.hpp:211:18
	v_mul_lo_u32 v5, v3, s4
.Ltmp188:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_lshl_add_u32 v103, v1, 13, v4
.Ltmp189:
	.loc	15 85 71 is_stmt 0      ; ./tensor_descriptor.hpp:85:71
	v_lshlrev_b32_e32 v4, 6, v8
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_lshl_or_b32 v11, v1, 11, v4
	s_mov_b32 s27, 0x27000
	s_mov_b32 s26, -1
.Ltmp190:
	.loc	5 337 58 is_stmt 1      ; ./amd_buffer_addressing.hpp:337:58
	v_lshlrev_b32_e32 v10, 1, v103
	s_movk_i32 s5, 0xffc
	.loc	5 336 28                ; ./amd_buffer_addressing.hpp:336:28
	s_nop 0
	s_waitcnt lgkmcnt(0)
	s_nop 0
	buffer_load_dwordx4 v[12:15], v10, s[24:27], 0 offen
	buffer_load_dwordx4 v[20:23], v10, s[24:27], 0 offen offset:2048
	buffer_load_dwordx4 v[28:31], v10, s[24:27], 4 offen offset:4092
	buffer_load_dwordx4 v[68:71], v10, s[24:27], s5 offen offset:2052
	s_movk_i32 s5, 0x1ffc
.Ltmp191:
	.loc	6 52 39                 ; ./in_memory_operation.hpp:52:39
	v_lshlrev_b32_e32 v64, 1, v11
	s_movk_i32 s6, 0x4000
.Ltmp192:
	.loc	5 336 28                ; ./amd_buffer_addressing.hpp:336:28
	s_nop 0
	s_nop 0
	buffer_load_dwordx4 v[36:39], v10, s[24:27], s5 offen offset:4
	buffer_load_dwordx4 v[40:43], v10, s[24:27], s5 offen offset:2052
.Ltmp193:
	.loc	12 369 57               ; ./multi_index_transform.hpp:369:57
	v_lshlrev_b32_e32 v34, 3, v1
.Ltmp194:
	.loc	12 211 18               ; ./multi_index_transform.hpp:211:18
	v_add_u32_e32 v1, v5, v2
	s_movk_i32 s5, 0x2ffc
.Ltmp195:
	.loc	6 52 39                 ; ./in_memory_operation.hpp:52:39
	v_add_u32_e32 v5, s6, v64
	s_mov_b32 s4, 0x92492493
.Ltmp196:
	.loc	12 210 34               ; ./multi_index_transform.hpp:210:34
	v_mul_hi_i32 v2, v1, s4
.Ltmp197:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add_u32_e32 v3, s18, v3
	s_mov_b32 s4, 0x31000
	v_mul_lo_u32 v3, v3, s4
.Ltmp198:
	.loc	12 210 34               ; ./multi_index_transform.hpp:210:34
	v_add_u32_e32 v2, v2, v1
	v_lshrrev_b32_e32 v4, 31, v2
	v_ashrrev_i32_e32 v2, 3, v2
	v_add_u32_e32 v9, v2, v4
	.loc	12 211 18               ; ./multi_index_transform.hpp:211:18
	v_mul_lo_u32 v2, v9, -14
	s_movk_i32 s23, 0x3800
.Ltmp199:
	.loc	12 211 18 is_stmt 0     ; ./multi_index_transform.hpp:211:18
	v_and_b32_e32 v8, 7, v0
.Ltmp200:
	.loc	12 369 57 is_stmt 1     ; ./multi_index_transform.hpp:369:57
	v_lshlrev_b32_e32 v67, 3, v8
.Ltmp201:
	.loc	12 211 18               ; ./multi_index_transform.hpp:211:18
	v_add_u32_e32 v11, v2, v1
.Ltmp202:
	.file	16 "/nhwc_miopen/build/kevin/miopen-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp-500d-1bac-474f-b3b3/./threadwise_generic_tensor_slice_copy.hpp"
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	v_mov_b32_e32 v104, 0xffff
.Ltmp203:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_or_b32_e32 v3, v67, v3
.Ltmp204:
	.loc	15 85 71 is_stmt 0      ; ./tensor_descriptor.hpp:85:71
	v_lshlrev_b32_e32 v1, 10, v11
.Ltmp205:
	.loc	5 0 0                   ; ./amd_buffer_addressing.hpp:0:0
	s_mov_b32 s30, s26
	s_mov_b32 s31, s27
.Ltmp206:
	.file	17 "/nhwc_miopen/build/kevin/miopen-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp-500d-1bac-474f-b3b3/./blockwise_gemm_xdlops.hpp"
	.loc	17 81 35 is_stmt 1      ; ./blockwise_gemm_xdlops.hpp:81:35
	v_and_b32_e32 v66, 0xc0, v0
.Ltmp207:
	.loc	13 0 0 is_stmt 0        ; ./gridwise_gemm_xdlops_fp16_bfp16.hpp:0:0
	v_accvgpr_write_b32 a96, 0
	v_accvgpr_write_b32 a97, 0
	v_accvgpr_write_b32 a98, 0
	v_accvgpr_write_b32 a99, 0
	v_accvgpr_write_b32 a100, 0
	v_accvgpr_write_b32 a101, 0
	v_accvgpr_write_b32 a102, 0
	v_accvgpr_write_b32 a103, 0
	v_accvgpr_write_b32 a104, 0
	v_accvgpr_write_b32 a105, 0
	v_accvgpr_write_b32 a106, 0
	v_accvgpr_write_b32 a107, 0
	v_accvgpr_write_b32 a108, 0
	v_accvgpr_write_b32 a109, 0
.Ltmp208:
	.loc	5 336 28 is_stmt 1      ; ./amd_buffer_addressing.hpp:336:28
	buffer_load_dwordx4 v[44:47], v10, s[24:27], s5 offen offset:4
.Ltmp209:
	.loc	13 0 0 is_stmt 0        ; ./gridwise_gemm_xdlops_fp16_bfp16.hpp:0:0
	v_accvgpr_write_b32 a110, 0
	v_accvgpr_write_b32 a111, 0
	v_accvgpr_write_b32 a112, 0
	v_accvgpr_write_b32 a113, 0
	v_accvgpr_write_b32 a114, 0
	v_accvgpr_write_b32 a115, 0
	v_accvgpr_write_b32 a116, 0
	v_accvgpr_write_b32 a117, 0
	v_accvgpr_write_b32 a118, 0
	v_accvgpr_write_b32 a119, 0
	v_accvgpr_write_b32 a120, 0
	v_accvgpr_write_b32 a121, 0
	v_accvgpr_write_b32 a122, 0
	v_accvgpr_write_b32 a123, 0
	v_accvgpr_write_b32 a124, 0
	v_accvgpr_write_b32 a125, 0
	v_accvgpr_write_b32 a126, 0
	v_accvgpr_write_b32 a127, 0
	v_accvgpr_write_b32 a64, 0
	v_accvgpr_write_b32 a65, 0
	v_accvgpr_write_b32 a66, 0
	v_accvgpr_write_b32 a67, 0
	v_accvgpr_write_b32 a68, 0
	v_accvgpr_write_b32 a69, 0
	v_accvgpr_write_b32 a70, 0
	v_accvgpr_write_b32 a71, 0
	v_accvgpr_write_b32 a72, 0
	v_accvgpr_write_b32 a73, 0
	v_accvgpr_write_b32 a74, 0
	v_accvgpr_write_b32 a75, 0
	v_accvgpr_write_b32 a76, 0
	v_accvgpr_write_b32 a77, 0
	v_accvgpr_write_b32 a78, 0
.Ltmp210:
	.loc	16 133 38 is_stmt 1     ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	s_waitcnt vmcnt(6)
	v_and_b32_e32 v19, v104, v13
	s_waitcnt vmcnt(5)
	v_lshl_or_b32 v60, v21, 16, v19
	s_waitcnt vmcnt(4)
	v_lshrrev_b32_e32 v16, 16, v28
	v_and_b32_e32 v26, v104, v29
	s_waitcnt vmcnt(3)
	v_lshl_or_b32 v61, v69, 16, v26
.Ltmp211:
	.loc	13 0 0 is_stmt 0        ; ./gridwise_gemm_xdlops_fp16_bfp16.hpp:0:0
	v_accvgpr_write_b32 a79, 0
.Ltmp212:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	s_waitcnt vmcnt(2)
	v_and_b32_e32 v2, v104, v36
	v_lshrrev_b32_e32 v17, 16, v36
	s_waitcnt vmcnt(1)
	v_lshl_or_b32 v54, v40, 16, v2
.Ltmp213:
	.loc	13 0 0                  ; ./gridwise_gemm_xdlops_fp16_bfp16.hpp:0:0
	v_accvgpr_write_b32 a80, 0
	v_accvgpr_write_b32 a81, 0
	v_accvgpr_write_b32 a82, 0
	v_accvgpr_write_b32 a83, 0
	v_accvgpr_write_b32 a84, 0
	v_accvgpr_write_b32 a85, 0
	v_accvgpr_write_b32 a86, 0
	v_accvgpr_write_b32 a87, 0
	v_accvgpr_write_b32 a88, 0
	v_accvgpr_write_b32 a89, 0
	v_accvgpr_write_b32 a90, 0
	v_accvgpr_write_b32 a91, 0
	v_accvgpr_write_b32 a92, 0
	v_accvgpr_write_b32 a93, 0
	v_accvgpr_write_b32 a94, 0
	v_accvgpr_write_b32 a95, 0
	v_accvgpr_write_b32 a0, 0
	v_accvgpr_write_b32 a1, 0
	v_accvgpr_write_b32 a2, 0
	v_accvgpr_write_b32 a3, 0
	v_accvgpr_write_b32 a4, 0
	v_accvgpr_write_b32 a5, 0
	v_accvgpr_write_b32 a6, 0
	v_accvgpr_write_b32 a7, 0
	v_accvgpr_write_b32 a8, 0
	v_accvgpr_write_b32 a9, 0
	v_accvgpr_write_b32 a10, 0
	v_accvgpr_write_b32 a11, 0
	v_accvgpr_write_b32 a12, 0
	v_accvgpr_write_b32 a13, 0
	v_accvgpr_write_b32 a14, 0
	v_accvgpr_write_b32 a15, 0
	v_accvgpr_write_b32 a16, 0
	v_accvgpr_write_b32 a17, 0
	v_accvgpr_write_b32 a18, 0
	v_accvgpr_write_b32 a19, 0
	v_accvgpr_write_b32 a20, 0
.Ltmp214:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	s_waitcnt vmcnt(0)
	v_lshrrev_b32_e32 v18, 16, v44
.Ltmp215:
	.loc	13 0 0                  ; ./gridwise_gemm_xdlops_fp16_bfp16.hpp:0:0
	v_accvgpr_write_b32 a21, 0
	v_accvgpr_write_b32 a22, 0
	v_accvgpr_write_b32 a23, 0
	v_accvgpr_write_b32 a24, 0
	v_accvgpr_write_b32 a25, 0
	v_accvgpr_write_b32 a26, 0
	v_accvgpr_write_b32 a27, 0
	v_accvgpr_write_b32 a28, 0
	v_accvgpr_write_b32 a29, 0
	v_accvgpr_write_b32 a30, 0
	v_accvgpr_write_b32 a31, 0
	v_accvgpr_write_b32 a32, 0
	v_accvgpr_write_b32 a33, 0
	v_accvgpr_write_b32 a34, 0
	v_accvgpr_write_b32 a35, 0
	v_accvgpr_write_b32 a36, 0
	v_accvgpr_write_b32 a37, 0
	v_accvgpr_write_b32 a38, 0
	v_accvgpr_write_b32 a39, 0
	v_accvgpr_write_b32 a40, 0
	v_accvgpr_write_b32 a41, 0
	v_accvgpr_write_b32 a42, 0
	v_accvgpr_write_b32 a43, 0
	v_accvgpr_write_b32 a44, 0
	v_accvgpr_write_b32 a45, 0
	v_accvgpr_write_b32 a46, 0
	v_accvgpr_write_b32 a47, 0
	v_accvgpr_write_b32 a48, 0
	v_accvgpr_write_b32 a49, 0
	v_accvgpr_write_b32 a50, 0
	v_accvgpr_write_b32 a51, 0
	v_accvgpr_write_b32 a52, 0
	v_accvgpr_write_b32 a53, 0
	v_accvgpr_write_b32 a54, 0
	v_accvgpr_write_b32 a55, 0
	v_accvgpr_write_b32 a56, 0
	v_accvgpr_write_b32 a57, 0
	v_accvgpr_write_b32 a58, 0
	v_accvgpr_write_b32 a59, 0
	v_accvgpr_write_b32 a60, 0
	v_accvgpr_write_b32 a61, 0
	v_accvgpr_write_b32 a62, 0
	v_accvgpr_write_b32 a63, 0
.Ltmp216:
	.loc	12 210 34 is_stmt 1     ; ./multi_index_transform.hpp:210:34
	v_mov_b32_e32 v27, 0
	s_mov_b32 s33, -8
	s_movk_i32 s34, 0x3bf
	s_movk_i32 s35, 0x3c0
	s_movk_i32 s36, 0x3ff
	s_movk_i32 s37, 0x3fe
	s_movk_i32 s38, 0x3fd
	s_movk_i32 s39, 0x3fc
	s_movk_i32 s40, 0x3fb
	s_movk_i32 s41, 0x3fa
	s_movk_i32 s42, 0x3f9
	s_nop 0
.Ltmp217:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	s_nop 0
	buffer_store_dword v5, off, s[0:3], 0 offset:176 ; 4-byte Folded Spill
.Ltmp218:
	.loc	5 336 28                ; ./amd_buffer_addressing.hpp:336:28
	buffer_load_dwordx4 v[48:51], v10, s[24:27], s5 offen offset:2052
.Ltmp219:
	.loc	15 85 71                ; ./tensor_descriptor.hpp:85:71
	v_mul_lo_u32 v10, v9, s23
.Ltmp220:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	v_mov_b32_e32 v5, 0xffff0000
	v_and_or_b32 v57, v68, v5, v16
	v_and_or_b32 v58, v40, v5, v17
.Ltmp221:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v105, v3, v10, v1
.Ltmp222:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	v_and_b32_e32 v1, v104, v44
	v_and_b32_e32 v10, v104, v12
	v_and_b32_e32 v3, v104, v28
	v_lshrrev_b32_e32 v12, 16, v12
	v_lshl_or_b32 v52, v20, 16, v10
	v_lshl_or_b32 v53, v68, 16, v3
	v_and_or_b32 v56, v20, v5, v12
.Ltmp223:
	.loc	12 0 0 is_stmt 0        ; ./multi_index_transform.hpp:0:0
	v_add_u32_e32 v10, 1, v9
.Ltmp224:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	s_waitcnt vmcnt(0)
	v_lshl_or_b32 v55, v48, 16, v1
	v_and_b32_e32 v1, v104, v37
	v_lshl_or_b32 v62, v41, 16, v1
	v_and_b32_e32 v1, v104, v45
	v_lshl_or_b32 v63, v49, 16, v1
	v_lshrrev_b32_e32 v1, 16, v13
	v_and_or_b32 v59, v48, v5, v18
.Ltmp225:
	.loc	6 52 58 is_stmt 1       ; ./in_memory_operation.hpp:52:58
	ds_write_b128 v64, v[52:55] offset:16384
	ds_write_b128 v64, v[56:59] offset:16400
.Ltmp226:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	v_and_or_b32 v52, v21, v5, v1
	v_lshrrev_b32_e32 v1, 16, v29
	v_and_or_b32 v53, v69, v5, v1
	v_lshrrev_b32_e32 v1, 16, v37
	v_and_or_b32 v54, v41, v5, v1
	v_lshrrev_b32_e32 v1, 16, v45
	v_and_or_b32 v55, v49, v5, v1
	v_and_b32_e32 v1, v104, v14
.Ltmp227:
	.loc	6 52 58                 ; ./in_memory_operation.hpp:52:58
	ds_write_b128 v64, v[52:55] offset:16432
.Ltmp228:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	v_lshl_or_b32 v52, v22, 16, v1
	v_and_b32_e32 v1, v104, v30
	v_lshl_or_b32 v53, v70, 16, v1
	v_and_b32_e32 v1, v104, v38
	v_lshl_or_b32 v54, v42, 16, v1
	v_and_b32_e32 v1, v104, v46
	v_lshl_or_b32 v55, v50, 16, v1
	v_lshrrev_b32_e32 v1, 16, v14
.Ltmp229:
	.loc	6 52 58                 ; ./in_memory_operation.hpp:52:58
	ds_write_b128 v64, v[52:55] offset:16448
.Ltmp230:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	v_and_or_b32 v52, v22, v5, v1
	v_lshrrev_b32_e32 v1, 16, v30
	v_and_or_b32 v53, v70, v5, v1
	v_lshrrev_b32_e32 v1, 16, v38
	v_and_or_b32 v54, v42, v5, v1
	v_lshrrev_b32_e32 v1, 16, v46
	v_and_or_b32 v55, v50, v5, v1
	v_and_b32_e32 v1, v104, v15
.Ltmp231:
	.loc	6 52 58                 ; ./in_memory_operation.hpp:52:58
	ds_write_b128 v64, v[52:55] offset:16464
.Ltmp232:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	v_lshl_or_b32 v52, v23, 16, v1
	v_and_b32_e32 v1, v104, v31
	v_lshl_or_b32 v53, v71, 16, v1
	v_and_b32_e32 v1, v104, v39
	v_lshl_or_b32 v54, v43, 16, v1
	v_and_b32_e32 v1, v104, v47
	v_lshl_or_b32 v55, v51, 16, v1
	v_lshrrev_b32_e32 v1, 16, v15
	v_and_or_b32 v12, v23, v5, v1
	v_lshrrev_b32_e32 v1, 16, v31
	v_and_or_b32 v13, v71, v5, v1
	v_lshrrev_b32_e32 v1, 16, v39
	v_and_or_b32 v14, v43, v5, v1
	v_lshrrev_b32_e32 v1, 16, v47
	v_and_or_b32 v15, v51, v5, v1
.Ltmp233:
	.loc	6 52 58                 ; ./in_memory_operation.hpp:52:58
	ds_write_b128 v64, v[12:15] offset:16496
.Ltmp234:
	.loc	14 20 101               ; ./math.hpp:20:101
	v_or_b32_e32 v12, 1, v11
.Ltmp235:
	.loc	12 287 44               ; ./multi_index_transform.hpp:287:44
	v_add_u32_e32 v13, 0x1ffff2, v12
	.loc	12 285 43               ; ./multi_index_transform.hpp:285:43
	v_cmp_gt_i32_e32 vcc, 14, v12
	.loc	12 285 28 is_stmt 0     ; ./multi_index_transform.hpp:285:28
	v_cndmask_b32_e32 v12, v13, v12, vcc
	v_cndmask_b32_e32 v13, v10, v9, vcc
.Ltmp236:
	.loc	12 287 44 is_stmt 1     ; ./multi_index_transform.hpp:287:44
	v_add_u32_e32 v14, -14, v13
	.loc	12 285 43               ; ./multi_index_transform.hpp:285:43
	v_cmp_gt_i32_e32 vcc, 14, v13
	.loc	12 285 28 is_stmt 0     ; ./multi_index_transform.hpp:285:28
	v_cndmask_b32_e32 v13, v14, v13, vcc
.Ltmp237:
	.loc	5 337 58 is_stmt 1      ; ./amd_buffer_addressing.hpp:337:58
	v_lshlrev_b32_e32 v1, 1, v105
.Ltmp238:
	.loc	14 26 101               ; ./math.hpp:26:101
	v_sub_u32_e32 v13, v13, v9
.Ltmp239:
	.loc	14 26 101 is_stmt 0     ; ./math.hpp:26:101
	v_sub_u32_e32 v12, v12, v11
.Ltmp240:
	.loc	12 285 28 is_stmt 1     ; ./multi_index_transform.hpp:285:28
	v_mov_b32_e32 v14, 0x7fffd000
	v_mov_b32_e32 v15, 0x800
.Ltmp241:
	.loc	6 52 58                 ; ./in_memory_operation.hpp:52:58
	ds_write_b128 v64, v[60:63] offset:16416
	ds_write_b128 v64, v[52:55] offset:16480
.Ltmp242:
	.loc	15 95 60                ; ./tensor_descriptor.hpp:95:60
	v_lshlrev_b32_e32 v3, 10, v12
	s_nop 0
.Ltmp243:
	.loc	5 336 28                ; ./amd_buffer_addressing.hpp:336:28
	s_nop 0
	buffer_load_dwordx4 v[16:19], v1, s[28:31], 0 offen
.Ltmp244:
	.loc	15 95 60                ; ./tensor_descriptor.hpp:95:60
	v_mul_lo_u32 v1, v13, s23
.Ltmp245:
	.loc	15 95 42 is_stmt 0      ; ./tensor_descriptor.hpp:95:42
	v_mov_b32_e32 v13, s4
	v_cndmask_b32_e64 v2, v13, 0, vcc
.Ltmp246:
	.loc	12 285 43 is_stmt 1     ; ./multi_index_transform.hpp:285:43
	v_cmp_gt_i32_e32 vcc, 12, v11
.Ltmp247:
	.loc	15 95 42                ; ./tensor_descriptor.hpp:95:42
	v_add3_u32 v12, v105, v2, v1
	s_nop 0
	s_nop 0
	buffer_store_dword v1, off, s[0:3], 0 offset:180 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[0:3], 0 offset:184 ; 4-byte Folded Spill
.Ltmp248:
	.loc	12 285 28               ; ./multi_index_transform.hpp:285:28
	v_cndmask_b32_e32 v1, v14, v15, vcc
	v_cndmask_b32_e32 v14, v10, v9, vcc
.Ltmp249:
	.loc	12 287 44               ; ./multi_index_transform.hpp:287:44
	v_add_u32_e32 v15, -14, v14
	.loc	12 285 43               ; ./multi_index_transform.hpp:285:43
	v_cmp_gt_i32_e32 vcc, 14, v14
	.loc	12 285 28 is_stmt 0     ; ./multi_index_transform.hpp:285:28
	v_cndmask_b32_e32 v14, v15, v14, vcc
.Ltmp250:
	.loc	14 26 101 is_stmt 1     ; ./math.hpp:26:101
	v_sub_u32_e32 v14, v14, v9
	v_mul_lo_u32 v2, v14, s23
.Ltmp251:
	.loc	5 337 58                ; ./amd_buffer_addressing.hpp:337:58
	v_add_lshl_u32 v12, v12, v3, 1
.Ltmp252:
	.loc	12 285 28               ; ./multi_index_transform.hpp:285:28
	v_mov_b32_e32 v14, 0x7fffd400
	v_mov_b32_e32 v15, 0xc00
	s_nop 0
	s_nop 0
	buffer_store_dword v3, off, s[0:3], 0 offset:188 ; 4-byte Folded Spill
	v_cndmask_b32_e64 v3, v13, 0, vcc
	.loc	12 285 43 is_stmt 0     ; ./multi_index_transform.hpp:285:43
	v_cmp_gt_i32_e32 vcc, 11, v11
	.loc	12 285 28               ; ./multi_index_transform.hpp:285:28
	v_cndmask_b32_e32 v10, v10, v9, vcc
.Ltmp253:
	.loc	12 287 44 is_stmt 1     ; ./multi_index_transform.hpp:287:44
	v_add_u32_e32 v11, -14, v10
	s_nop 0
.Ltmp254:
	.loc	5 336 28                ; ./amd_buffer_addressing.hpp:336:28
	s_nop 0
	buffer_load_dwordx4 v[28:31], v12, s[28:31], 0 offen
	s_nop 0
	s_nop 0
	buffer_store_dword v2, off, s[0:3], 0 offset:196 ; 4-byte Folded Spill
	buffer_store_dword v3, off, s[0:3], 0 offset:200 ; 4-byte Folded Spill
.Ltmp255:
	.loc	15 95 42                ; ./tensor_descriptor.hpp:95:42
	v_add3_u32 v12, v105, v3, v2
.Ltmp256:
	.loc	12 285 28               ; ./multi_index_transform.hpp:285:28
	v_cndmask_b32_e32 v2, v14, v15, vcc
.Ltmp257:
	.loc	12 285 43 is_stmt 0     ; ./multi_index_transform.hpp:285:43
	v_cmp_gt_i32_e32 vcc, 14, v10
	.loc	12 285 28               ; ./multi_index_transform.hpp:285:28
	v_cndmask_b32_e32 v10, v11, v10, vcc
.Ltmp258:
	.loc	14 26 101 is_stmt 1     ; ./math.hpp:26:101
	v_sub_u32_e32 v9, v10, v9
	v_mul_lo_u32 v3, v9, s23
.Ltmp259:
	.loc	5 337 58                ; ./amd_buffer_addressing.hpp:337:58
	v_add_lshl_u32 v9, v12, v1, 1
	s_nop 0
	s_nop 0
	buffer_store_dword v1, off, s[0:3], 0 offset:192 ; 4-byte Folded Spill
	v_cndmask_b32_e64 v1, v13, 0, vcc
	s_nop 0
	.loc	5 336 28                ; ./amd_buffer_addressing.hpp:336:28
	s_nop 0
	buffer_load_dwordx4 v[20:23], v9, s[28:31], 0 offen
.Ltmp260:
	.loc	15 95 42                ; ./tensor_descriptor.hpp:95:42
	v_add3_u32 v9, v105, v1, v3
	s_nop 0
	s_nop 0
	buffer_store_dword v3, off, s[0:3], 0 offset:208 ; 4-byte Folded Spill
	buffer_store_dword v1, off, s[0:3], 0 offset:212 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[0:3], 0 offset:204 ; 4-byte Folded Spill
.Ltmp261:
	.loc	5 337 58                ; ./amd_buffer_addressing.hpp:337:58
	v_add_lshl_u32 v9, v9, v2, 1
	v_lshlrev_b32_e32 v2, 4, v66
	s_nop 0
	.loc	5 336 28                ; ./amd_buffer_addressing.hpp:336:28
	s_nop 0
	buffer_load_dwordx4 v[36:39], v9, s[28:31], 0 offen
.Ltmp262:
	.loc	6 52 39                 ; ./in_memory_operation.hpp:52:39
	v_lshlrev_b32_e32 v9, 6, v65
	v_lshl_or_b32 v1, v8, 11, v9
	s_nop 0
	s_nop 0
	buffer_store_dword v1, off, s[0:3], 0 offset:216 ; 4-byte Folded Spill
	buffer_load_dword v24, off, s[0:3], 0 offset:216 ; 4-byte Folded Reload
	s_nop 0
	s_nop 0
	buffer_store_dword v65, off, s[0:3], 0 offset:224 ; 4-byte Folded Spill
	buffer_store_dword v66, off, s[0:3], 0 offset:228 ; 4-byte Folded Spill
	buffer_store_dword v0, off, s[0:3], 0 offset:220 ; 4-byte Folded Spill
.Ltmp263:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	s_waitcnt vmcnt(17)
	v_bfi_b32 v18, v104, v18, v18
.Ltmp264:
	.loc	6 52 58                 ; ./in_memory_operation.hpp:52:58
	ds_write_b128 v1, v[16:19]
.Ltmp265:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	s_waitcnt vmcnt(13)
	v_bfi_b32 v30, v104, v30, v30
.Ltmp266:
	.loc	6 52 58                 ; ./in_memory_operation.hpp:52:58
	ds_write_b128 v1, v[28:31] offset:16
	v_mov_b32_e32 v28, 0
.Ltmp267:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	s_waitcnt vmcnt(9)
	v_bfi_b32 v22, v104, v22, v22
.Ltmp268:
	.loc	6 52 58                 ; ./in_memory_operation.hpp:52:58
	ds_write_b128 v1, v[20:23] offset:32
.Ltmp269:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	s_waitcnt vmcnt(5)
	v_bfi_b32 v38, v104, v38, v38
.Ltmp270:
	.loc	6 52 58                 ; ./in_memory_operation.hpp:52:58
	ds_write_b128 v1, v[36:39] offset:48
.Ltmp271:
	.file	18 "/nhwc_miopen/build/kevin/miopen-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp-500d-1bac-474f-b3b3/./xdlops_gemm.hpp"
	.loc	18 0 0 is_stmt 0        ; ./xdlops_gemm.hpp:0:0
	v_and_b32_e32 v1, 63, v0
	v_lshlrev_b32_e32 v123, 4, v1
	v_or3_b32 v127, v2, v123, s6
	v_or_b32_e32 v107, 0x400, v123
.Ltmp272:
BB77_1:                                 ; %_ZZN2ck5MergeINS_8SequenceIJLi1ELi1ELi1024EEEEE23CalculateLowerIndexDiffERKNS_5ArrayIiLi1EEES7_RKNS4_IiLi3EEEENKUlT_E0_clINS_17integral_constantIiLi2EEEEEDaSB_.exit.i.i.i.i.i.i.i.i.i.i.i.i.i.i3233.i.i.i
                                        ; =>This Inner Loop Header: Depth=1
	.loc	12 285 43 is_stmt 1     ; ./multi_index_transform.hpp:285:43
	v_cmp_gt_i32_e32 vcc, s35, v34
	v_mov_b32_e32 v2, 0xfffffc40
	.loc	12 285 28 is_stmt 0     ; ./multi_index_transform.hpp:285:28
	v_cndmask_b32_e64 v0, v2, 64, vcc
	.loc	12 285 43               ; ./multi_index_transform.hpp:285:43
	v_cmp_lt_i32_e32 vcc, s34, v34
	.loc	12 285 28               ; ./multi_index_transform.hpp:285:28
	v_addc_co_u32_e32 v1, vcc, 0, v27, vcc
.Ltmp273:
	.loc	12 285 43               ; ./multi_index_transform.hpp:285:43
	v_cmp_gt_i32_e32 vcc, s35, v67
	.loc	12 285 28               ; ./multi_index_transform.hpp:285:28
	v_cndmask_b32_e64 v106, v2, 64, vcc
	.loc	12 285 43               ; ./multi_index_transform.hpp:285:43
	v_cmp_lt_i32_e32 vcc, s34, v67
	.loc	12 285 28               ; ./multi_index_transform.hpp:285:28
	v_addc_co_u32_e32 v2, vcc, 0, v28, vcc
.Ltmp274:
	.loc	12 285 43               ; ./multi_index_transform.hpp:285:43
	v_cmp_lt_i32_e32 vcc, 0, v1
.Ltmp275:
	.loc	12 285 43               ; ./multi_index_transform.hpp:285:43
	v_cmp_lt_i32_e64 s[4:5], 0, v2
.Ltmp276:
	.loc	12 285 28               ; ./multi_index_transform.hpp:285:28
	v_cndmask_b32_e64 v3, 0, 1, vcc
.Ltmp277:
	.loc	12 285 28               ; ./multi_index_transform.hpp:285:28
	v_add_u32_e32 v34, v34, v0
.Ltmp278:
	.loc	12 285 28               ; ./multi_index_transform.hpp:285:28
	v_subbrev_co_u32_e64 v26, s[6:7], 0, v1, vcc
.Ltmp279:
	.loc	14 26 101 is_stmt 1     ; ./math.hpp:26:101
	v_subb_co_u32_e32 v1, vcc, v1, v27, vcc
.Ltmp280:
	.loc	15 95 42                ; ./tensor_descriptor.hpp:95:42
	v_or_b32_e32 v0, v0, v3
.Ltmp281:
	.loc	12 285 28               ; ./multi_index_transform.hpp:285:28
	v_subbrev_co_u32_e64 v33, vcc, 0, v2, s[4:5]
	v_cndmask_b32_e64 v8, 0, -1, s[4:5]
.Ltmp282:
	.loc	15 95 42                ; ./tensor_descriptor.hpp:95:42
	v_add_u32_e32 v0, v0, v1
.Ltmp283:
	.loc	15 95 60 is_stmt 0      ; ./tensor_descriptor.hpp:95:60
	v_mul_i32_i24_e32 v2, s23, v8
.Ltmp284:
	.loc	14 20 101 is_stmt 1     ; ./math.hpp:20:101
	v_or_b32_e32 v3, 1, v34
.Ltmp285:
	.loc	12 287 44               ; ./multi_index_transform.hpp:287:44
	v_add_u32_e32 v8, 0x3ffc01, v34
	.loc	12 285 43               ; ./multi_index_transform.hpp:285:43
	v_cmp_gt_i32_e64 s[14:15], s36, v34
.Ltmp286:
	.loc	14 20 101               ; ./math.hpp:20:101
	v_or_b32_e32 v10, 2, v34
.Ltmp287:
	.loc	12 287 44               ; ./multi_index_transform.hpp:287:44
	v_add_u32_e32 v11, 0x3ffc02, v34
	.loc	12 285 43               ; ./multi_index_transform.hpp:285:43
	v_cmp_gt_i32_e32 vcc, s37, v34
.Ltmp288:
	.loc	14 20 101               ; ./math.hpp:20:101
	v_or_b32_e32 v14, 4, v34
.Ltmp289:
	.loc	12 287 44               ; ./multi_index_transform.hpp:287:44
	v_add_u32_e32 v15, 0x3ffc04, v34
	.loc	12 285 43               ; ./multi_index_transform.hpp:285:43
	v_cmp_gt_i32_e64 s[6:7], s39, v34
	.loc	12 285 28 is_stmt 0     ; ./multi_index_transform.hpp:285:28
	v_cndmask_b32_e64 v3, v8, v3, s[14:15]
	v_cndmask_b32_e32 v8, v11, v10, vcc
	v_cndmask_b32_e64 v11, v15, v14, s[6:7]
.Ltmp290:
	.loc	12 441 47 is_stmt 1     ; ./multi_index_transform.hpp:441:47
	v_sub_u32_e32 v15, v28, v33
.Ltmp291:
	.loc	14 20 101               ; ./math.hpp:20:101
	v_or_b32_e32 v20, 7, v34
.Ltmp292:
	.loc	12 287 44               ; ./multi_index_transform.hpp:287:44
	v_add_u32_e32 v21, 0x3ffc07, v34
	.loc	12 285 43               ; ./multi_index_transform.hpp:285:43
	v_cmp_gt_i32_e64 s[12:13], s42, v34
.Ltmp293:
	.file	19 "/nhwc_miopen/build/kevin/miopen-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp-500d-1bac-474f-b3b3/./tensor_coordinate.hpp"
	.loc	19 68 17                ; ./tensor_coordinate.hpp:68:17
	v_lshl_add_u32 v103, v0, 10, v103
.Ltmp294:
	.loc	12 285 28               ; ./multi_index_transform.hpp:285:28
	v_cndmask_b32_e64 v14, v21, v20, s[12:13]
.Ltmp295:
	.loc	14 26 101               ; ./math.hpp:26:101
	v_add_u32_e32 v9, v105, v106
.Ltmp296:
	.loc	15 95 60                ; ./tensor_descriptor.hpp:95:60
	v_lshlrev_b32_e32 v15, 10, v15
.Ltmp297:
	.loc	5 337 58                ; ./amd_buffer_addressing.hpp:337:58
	v_lshlrev_b32_e32 v21, 1, v103
.Ltmp298:
	.loc	19 68 17                ; ./tensor_coordinate.hpp:68:17
	v_add3_u32 v105, v9, v2, v15
.Ltmp299:
	.loc	12 0 0 is_stmt 0        ; ./multi_index_transform.hpp:0:0
	v_add_u32_e32 v1, 1, v26
.Ltmp300:
	.loc	14 20 101 is_stmt 1     ; ./math.hpp:20:101
	v_or_b32_e32 v12, 3, v34
.Ltmp301:
	.loc	12 287 44               ; ./multi_index_transform.hpp:287:44
	v_add_u32_e32 v13, 0x3ffc03, v34
	.loc	12 285 43               ; ./multi_index_transform.hpp:285:43
	v_cmp_gt_i32_e64 s[4:5], s38, v34
.Ltmp302:
	.loc	14 20 101               ; ./math.hpp:20:101
	v_or_b32_e32 v16, 5, v34
.Ltmp303:
	.loc	12 287 44               ; ./multi_index_transform.hpp:287:44
	v_add_u32_e32 v17, 0x3ffc05, v34
	.loc	12 285 43               ; ./multi_index_transform.hpp:285:43
	v_cmp_gt_i32_e64 s[8:9], s40, v34
	.loc	12 285 28 is_stmt 0     ; ./multi_index_transform.hpp:285:28
	v_cndmask_b32_e64 v0, v1, v26, s[14:15]
	v_cndmask_b32_e64 v10, v13, v12, s[4:5]
	v_cndmask_b32_e64 v12, v17, v16, s[8:9]
	v_cndmask_b32_e32 v16, v1, v26, vcc
.Ltmp304:
	.loc	12 285 43               ; ./multi_index_transform.hpp:285:43
	v_cmp_lt_i32_e32 vcc, 0, v0
.Ltmp305:
	.loc	12 285 28               ; ./multi_index_transform.hpp:285:28
	v_cndmask_b32_e64 v17, v1, v26, s[4:5]
.Ltmp306:
	.loc	14 26 101 is_stmt 1     ; ./math.hpp:26:101
	v_subb_co_u32_e64 v0, s[4:5], v0, v26, vcc
.Ltmp307:
	.loc	14 26 101 is_stmt 0     ; ./math.hpp:26:101
	v_sub_u32_e32 v3, v3, v34
.Ltmp308:
	.loc	12 285 43 is_stmt 1     ; ./multi_index_transform.hpp:285:43
	v_cmp_lt_i32_e64 s[4:5], 0, v16
	v_addc_co_u32_e32 v0, vcc, v0, v3, vcc
.Ltmp309:
	.loc	14 26 101               ; ./math.hpp:26:101
	v_subb_co_u32_e64 v2, vcc, v16, v26, s[4:5]
.Ltmp310:
	.loc	12 285 43               ; ./multi_index_transform.hpp:285:43
	v_cmp_gt_i32_e64 s[10:11], s41, v34
.Ltmp311:
	.loc	14 20 101               ; ./math.hpp:20:101
	v_or_b32_e32 v18, 6, v34
.Ltmp312:
	.loc	12 287 44               ; ./multi_index_transform.hpp:287:44
	v_add_u32_e32 v19, 0x3ffc06, v34
	.loc	12 285 28               ; ./multi_index_transform.hpp:285:28
	v_cndmask_b32_e64 v13, v19, v18, s[10:11]
	v_cndmask_b32_e64 v18, v1, v26, s[6:7]
.Ltmp313:
	.loc	12 285 43 is_stmt 0     ; ./multi_index_transform.hpp:285:43
	v_cmp_lt_i32_e64 s[6:7], 0, v17
.Ltmp314:
	.loc	12 285 28               ; ./multi_index_transform.hpp:285:28
	v_cndmask_b32_e64 v19, v1, v26, s[8:9]
.Ltmp315:
	.loc	14 26 101 is_stmt 1     ; ./math.hpp:26:101
	v_subb_co_u32_e64 v17, s[8:9], v17, v26, s[6:7]
.Ltmp316:
	.loc	14 26 101 is_stmt 0     ; ./math.hpp:26:101
	v_sub_u32_e32 v8, v8, v34
.Ltmp317:
	.loc	12 285 28 is_stmt 1     ; ./multi_index_transform.hpp:285:28
	v_cndmask_b32_e64 v22, 0, 1, s[4:5]
.Ltmp318:
	.loc	14 26 101               ; ./math.hpp:26:101
	v_sub_u32_e32 v10, v10, v34
	v_or_b32_e32 v3, v8, v22
	v_addc_co_u32_e64 v8, vcc, v17, v10, s[6:7]
.Ltmp319:
	.loc	12 285 28               ; ./multi_index_transform.hpp:285:28
	v_cndmask_b32_e64 v20, v1, v26, s[10:11]
	v_cndmask_b32_e64 v1, v1, v26, s[12:13]
.Ltmp320:
	.loc	12 285 43 is_stmt 0     ; ./multi_index_transform.hpp:285:43
	v_cmp_lt_i32_e64 s[14:15], 0, v1
.Ltmp321:
	.loc	14 26 101 is_stmt 1     ; ./math.hpp:26:101
	v_sub_u32_e32 v14, v14, v34
.Ltmp322:
	.loc	14 26 101 is_stmt 0     ; ./math.hpp:26:101
	v_subb_co_u32_e64 v1, s[16:17], v1, v26, s[14:15]
	v_addc_co_u32_e64 v1, vcc, v1, v14, s[14:15]
.Ltmp323:
	.loc	5 337 58 is_stmt 1      ; ./amd_buffer_addressing.hpp:337:58
	v_lshlrev_b32_e32 v14, 1, v105
.Ltmp324:
	.loc	12 285 43               ; ./multi_index_transform.hpp:285:43
	v_cmp_lt_i32_e64 s[8:9], 0, v18
	v_cmp_lt_i32_e64 s[10:11], 0, v19
.Ltmp325:
	.loc	14 26 101               ; ./math.hpp:26:101
	v_subb_co_u32_e64 v19, s[12:13], v19, v26, s[10:11]
.Ltmp326:
	.loc	14 26 101 is_stmt 0     ; ./math.hpp:26:101
	v_sub_u32_e32 v11, v11, v34
.Ltmp327:
	.loc	12 285 28 is_stmt 1     ; ./multi_index_transform.hpp:285:28
	v_cndmask_b32_e64 v23, 0, 1, s[8:9]
.Ltmp328:
	.loc	14 26 101               ; ./math.hpp:26:101
	v_sub_u32_e32 v12, v12, v34
	v_or_b32_e32 v10, v11, v23
.Ltmp329:
	.loc	14 26 101 is_stmt 0     ; ./math.hpp:26:101
	v_subb_co_u32_e64 v9, vcc, v18, v26, s[8:9]
	v_addc_co_u32_e64 v11, vcc, v19, v12, s[10:11]
	v_add_lshl_u32 v2, v3, v2, 10
	v_lshlrev_b32_e32 v3, 10, v8
	v_add_lshl_u32 v8, v10, v9, 10
	v_lshlrev_b32_e32 v9, 10, v11
.Ltmp330:
	.loc	12 285 43 is_stmt 1     ; ./multi_index_transform.hpp:285:43
	v_cmp_lt_i32_e64 s[12:13], 0, v20
.Ltmp331:
	.loc	14 26 101               ; ./math.hpp:26:101
	v_sub_u32_e32 v13, v13, v34
.Ltmp332:
	.loc	12 285 28               ; ./multi_index_transform.hpp:285:28
	v_cndmask_b32_e64 v31, 0, 1, s[12:13]
.Ltmp333:
	.loc	14 26 101               ; ./math.hpp:26:101
	v_subb_co_u32_e64 v12, vcc, v20, v26, s[12:13]
	v_or_b32_e32 v13, v13, v31
	v_add_lshl_u32 v10, v13, v12, 10
	v_lshlrev_b32_e32 v0, 10, v0
	v_lshlrev_b32_e32 v1, 10, v1
.Ltmp334:
	.loc	5 337 58                ; ./amd_buffer_addressing.hpp:337:58
	v_add_lshl_u32 v0, v103, v0, 1
	v_add_lshl_u32 v2, v103, v2, 1
	v_add_lshl_u32 v3, v103, v3, 1
	v_add_lshl_u32 v8, v103, v8, 1
	v_add_lshl_u32 v9, v103, v9, 1
	v_add_lshl_u32 v10, v103, v10, 1
	v_add_lshl_u32 v1, v103, v1, 1
	v_mov_b32_e32 v32, v107
	v_mov_b32_e32 v25, v123
	s_nop 0
.Ltmp335:
	.loc	12 285 43               ; ./multi_index_transform.hpp:285:43
	s_nop 0
	buffer_store_dword v67, off, s[0:3], 0 offset:16 ; 4-byte Folded Spill
.Ltmp336:
	.loc	5 336 28                ; ./amd_buffer_addressing.hpp:336:28
	buffer_load_dwordx4 v[27:30], v21, s[24:27], 0 offen
.Ltmp337:
	.loc	15 95 42                ; ./tensor_descriptor.hpp:95:42
	buffer_load_dword v5, off, s[0:3], 0 offset:180 ; 4-byte Folded Reload
	buffer_load_dword v15, off, s[0:3], 0 offset:184 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_add3_u32 v15, v105, v15, v5
	s_nop 0
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:196 ; 4-byte Folded Reload
	buffer_load_dword v16, off, s[0:3], 0 offset:200 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_add3_u32 v16, v105, v16, v5
	s_nop 0
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:208 ; 4-byte Folded Reload
	buffer_load_dword v17, off, s[0:3], 0 offset:212 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_add3_u32 v17, v105, v17, v5
	s_nop 0
.Ltmp338:
	.loc	5 336 28                ; ./amd_buffer_addressing.hpp:336:28
	s_nop 0
	buffer_load_dwordx4 v[4:7], v14, s[28:31], 0 offen
	.loc	5 337 58                ; ./amd_buffer_addressing.hpp:337:58
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dword v4, off, s[0:3], 0 offset:160 ; 4-byte Folded Spill
	buffer_store_dword v5, off, s[0:3], 0 offset:164 ; 4-byte Folded Spill
	buffer_store_dword v6, off, s[0:3], 0 offset:168 ; 4-byte Folded Spill
	buffer_store_dword v7, off, s[0:3], 0 offset:172 ; 4-byte Folded Spill
	buffer_load_dword v5, off, s[0:3], 0 offset:188 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_add_lshl_u32 v11, v15, v5, 1
	s_nop 0
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:192 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_add_lshl_u32 v12, v16, v5, 1
	s_nop 0
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:204 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_add_lshl_u32 v13, v17, v5, 1
	.loc	5 336 28                ; ./amd_buffer_addressing.hpp:336:28
	s_nop 0
	s_nop 0
	buffer_load_dwordx4 v[63:66], v11, s[28:31], 0 offen
	buffer_load_dwordx4 v[67:70], v12, s[28:31], 0 offen
	buffer_load_dwordx4 v[71:74], v13, s[28:31], 0 offen
.Ltmp339:
	.loc	5 336 28 is_stmt 0      ; ./amd_buffer_addressing.hpp:336:28
	buffer_load_dwordx4 v[35:38], v0, s[24:27], 0 offen
	buffer_load_dwordx4 v[39:42], v2, s[24:27], 0 offen
	buffer_load_dwordx4 v[43:46], v3, s[24:27], 0 offen
	buffer_load_dwordx4 v[47:50], v8, s[24:27], 0 offen
	buffer_load_dwordx4 v[51:54], v9, s[24:27], 0 offen
	buffer_load_dwordx4 v[55:58], v10, s[24:27], 0 offen
	buffer_load_dwordx4 v[59:62], v1, s[24:27], 0 offen
.Ltmp340:
	.loc	8 13 5 is_stmt 1        ; ./synchronization.hpp:13:5
	;;#ASMSTART
	    s_waitcnt lgkmcnt(0) 
     s_barrier     
	;;#ASMEND
.Ltmp341:
	.loc	18 911 24               ; ./xdlops_gemm.hpp:911:24
	ds_read_b128 v[75:78], v127
	ds_read_b128 v[79:82], v127 offset:4096
	.loc	18 912 24               ; ./xdlops_gemm.hpp:912:24
	ds_read_b128 v[83:86], v123
	ds_read_b128 v[87:90], v123 offset:2048
	.loc	18 911 24               ; ./xdlops_gemm.hpp:911:24
	ds_read_b128 v[91:94], v127 offset:8192
	ds_read_b128 v[95:98], v127 offset:12288
	.loc	18 912 24               ; ./xdlops_gemm.hpp:912:24
	ds_read_b128 v[99:102], v123 offset:4096
	ds_read_b128 v[0:3], v123 offset:6144
.Ltmp342:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	s_waitcnt lgkmcnt(5)
	v_mfma_f32_32x32x4f16 a[64:95], v[75:76], v[83:84], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[75:76], v[83:84], a[96:127] cbsz:1
.Ltmp343:
	.loc	13 1223 64              ; ./gridwise_gemm_xdlops_fp16_bfp16.hpp:1223:64
	s_add_i32 s33, s33, 8
	s_cmpk_gt_u32 s33, 0x6f
	s_nop 0
	s_waitcnt lgkmcnt(0)
	s_nop 0
	buffer_store_dword v0, off, s[0:3], 0 offset:144 ; 4-byte Folded Spill
	buffer_store_dword v1, off, s[0:3], 0 offset:148 ; 4-byte Folded Spill
	buffer_store_dword v2, off, s[0:3], 0 offset:152 ; 4-byte Folded Spill
	buffer_store_dword v3, off, s[0:3], 0 offset:156 ; 4-byte Folded Spill
.Ltmp344:
	.loc	18 912 24               ; ./xdlops_gemm.hpp:912:24
	ds_read_b128 v[107:110], v107
	ds_read_b128 v[111:114], v32 offset:2048
	.loc	18 911 24               ; ./xdlops_gemm.hpp:911:24
	ds_read_b128 v[115:118], v127 offset:16384
.Ltmp345:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	v_and_b32_e32 v0, v104, v27
	v_lshrrev_b32_e32 v1, 16, v27
.Ltmp346:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_waitcnt lgkmcnt(2)
	v_mfma_f32_32x32x4f16 a[0:31], v[75:76], v[107:108], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[75:76], v[107:108], a[32:63] cbsz:1 abid:1
.Ltmp347:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	v_and_b32_e32 v2, v104, v28
	v_lshrrev_b32_e32 v3, 16, v28
.Ltmp348:
	.loc	16 133 38 is_stmt 0     ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	v_mov_b32_e32 v12, 0xffff0000
.Ltmp349:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	v_lshrrev_b32_e32 v9, 16, v29
	v_lshrrev_b32_e32 v11, 16, v30
	v_and_b32_e32 v8, v104, v29
.Ltmp350:
	.loc	10 687 16 is_stmt 1     ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[77:78], v[85:86], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[77:78], v[85:86], a[96:127] cbsz:1
.Ltmp351:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	v_and_b32_e32 v10, v104, v30
.Ltmp352:
	.loc	18 912 24               ; ./xdlops_gemm.hpp:912:24
	ds_read_b128 v[119:122], v123 offset:8192
.Ltmp353:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[0:31], v[77:78], v[109:110], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[77:78], v[109:110], a[32:63] cbsz:1 abid:1
	v_mfma_f32_32x32x4f16 a[64:95], v[79:80], v[87:88], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[79:80], v[87:88], a[96:127] cbsz:1
	s_waitcnt lgkmcnt(2)
	v_mfma_f32_32x32x4f16 a[0:31], v[79:80], v[111:112], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[79:80], v[111:112], a[32:63] cbsz:1 abid:1
	v_mfma_f32_32x32x4f16 a[64:95], v[81:82], v[89:90], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[81:82], v[89:90], a[96:127] cbsz:1
	v_mfma_f32_32x32x4f16 a[0:31], v[81:82], v[113:114], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[81:82], v[113:114], a[32:63] cbsz:1 abid:1
.Ltmp354:
	.loc	18 911 24               ; ./xdlops_gemm.hpp:911:24
	ds_read_b128 v[111:114], v127 offset:20480
.Ltmp355:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[91:92], v[99:100], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[91:92], v[99:100], a[96:127] cbsz:1
.Ltmp356:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	s_waitcnt vmcnt(13)
	v_bfi_b32 v65, v104, v65, v65
	s_waitcnt vmcnt(12)
	v_bfi_b32 v69, v104, v69, v69
	s_waitcnt vmcnt(11)
	v_bfi_b32 v73, v104, v73, v73
.Ltmp357:
	.loc	16 133 38 is_stmt 0     ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	s_waitcnt vmcnt(10)
	v_lshl_or_b32 v27, v35, 16, v0
	s_waitcnt vmcnt(9)
	v_and_b32_e32 v0, v104, v39
	v_and_or_b32 v35, v35, v12, v1
	v_lshrrev_b32_e32 v1, 16, v39
	v_lshl_or_b32 v39, v36, 16, v2
	v_and_or_b32 v75, v36, v12, v3
	v_lshrrev_b32_e32 v3, 16, v40
	v_and_b32_e32 v2, v104, v40
	v_lshl_or_b32 v79, v37, 16, v8
	v_and_b32_e32 v8, v104, v41
	v_and_or_b32 v83, v37, v12, v9
	v_lshrrev_b32_e32 v9, 16, v41
	v_lshl_or_b32 v87, v38, 16, v10
	v_and_b32_e32 v10, v104, v42
	v_and_or_b32 v107, v38, v12, v11
	v_lshrrev_b32_e32 v11, 16, v42
	s_waitcnt vmcnt(8)
	v_lshl_or_b32 v28, v43, 16, v0
	v_and_or_b32 v36, v43, v12, v1
	v_lshl_or_b32 v40, v44, 16, v2
	v_and_or_b32 v76, v44, v12, v3
	v_lshl_or_b32 v80, v45, 16, v8
	s_waitcnt vmcnt(7)
	v_and_b32_e32 v0, v104, v47
	v_and_or_b32 v84, v45, v12, v9
	v_lshrrev_b32_e32 v1, 16, v47
	v_lshl_or_b32 v88, v46, 16, v10
	v_and_or_b32 v108, v46, v12, v11
	v_and_b32_e32 v2, v104, v48
	v_lshrrev_b32_e32 v3, 16, v48
	v_and_b32_e32 v8, v104, v49
	v_lshrrev_b32_e32 v9, 16, v49
	v_and_b32_e32 v10, v104, v50
	v_lshrrev_b32_e32 v11, 16, v50
	s_waitcnt vmcnt(6)
	v_lshl_or_b32 v29, v51, 16, v0
	v_and_or_b32 v37, v51, v12, v1
	v_lshl_or_b32 v41, v52, 16, v2
	v_and_or_b32 v77, v52, v12, v3
	v_lshl_or_b32 v81, v53, 16, v8
	s_waitcnt vmcnt(5)
	v_and_b32_e32 v0, v104, v55
	v_and_or_b32 v85, v53, v12, v9
	v_lshrrev_b32_e32 v1, 16, v55
	v_lshl_or_b32 v89, v54, 16, v10
	v_and_or_b32 v109, v54, v12, v11
	v_and_b32_e32 v2, v104, v56
	v_lshrrev_b32_e32 v3, 16, v56
	v_and_b32_e32 v8, v104, v57
	v_lshrrev_b32_e32 v9, 16, v57
	v_and_b32_e32 v10, v104, v58
	v_lshrrev_b32_e32 v11, 16, v58
.Ltmp358:
	.loc	18 912 24 is_stmt 1     ; ./xdlops_gemm.hpp:912:24
	ds_read_b128 v[43:46], v123 offset:10240
	.loc	18 911 24               ; ./xdlops_gemm.hpp:911:24
	ds_read_b128 v[47:50], v127 offset:24576
	ds_read_b128 v[51:54], v127 offset:28672
.Ltmp359:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	s_waitcnt vmcnt(4)
	v_lshl_or_b32 v30, v59, 16, v0
	v_and_or_b32 v38, v59, v12, v1
	v_lshl_or_b32 v42, v60, 16, v2
	v_and_or_b32 v78, v60, v12, v3
.Ltmp360:
	.loc	18 912 24               ; ./xdlops_gemm.hpp:912:24
	ds_read_b128 v[55:58], v123 offset:12288
.Ltmp361:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	v_lshl_or_b32 v82, v61, 16, v8
	v_and_or_b32 v86, v61, v12, v9
	v_lshl_or_b32 v90, v62, 16, v10
	v_and_or_b32 v110, v62, v12, v11
.Ltmp362:
	.loc	18 912 24               ; ./xdlops_gemm.hpp:912:24
	ds_read_b128 v[59:62], v123 offset:14336
	ds_read_b128 v[123:126], v32 offset:4096
	ds_read_b128 v[12:15], v32 offset:6144
	ds_read_b128 v[20:23], v32 offset:8192
	ds_read_b128 v[4:7], v32 offset:10240
	ds_read_b128 v[16:19], v32 offset:12288
	ds_read_b128 v[8:11], v32 offset:14336
.Ltmp363:
	.loc	8 13 5                  ; ./synchronization.hpp:13:5
	;;#ASMSTART
	    s_waitcnt lgkmcnt(0) 
     s_barrier     
	;;#ASMEND
	s_nop 0
	s_nop 0
	buffer_load_dword v0, off, s[0:3], 0 offset:160 ; 4-byte Folded Reload
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_load_dword v1, off, s[0:3], 0 offset:164 ; 4-byte Folded Reload
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_load_dword v2, off, s[0:3], 0 offset:168 ; 4-byte Folded Reload
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_load_dword v3, off, s[0:3], 0 offset:172 ; 4-byte Folded Reload
.Ltmp364:
	.loc	6 52 58                 ; ./in_memory_operation.hpp:52:58
	ds_write_b128 v24, v[67:70] offset:32
	ds_write_b128 v24, v[63:66] offset:16
	ds_write_b128 v24, v[71:74] offset:48
.Ltmp365:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_waitcnt lgkmcnt(8)
	v_mfma_f32_32x32x4f16 a[0:31], v[91:92], v[123:124], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[91:92], v[123:124], a[32:63] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[93:94], v[101:102], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[93:94], v[101:102], a[64:95] cbsz:1 abid:1
	v_mov_b32_e32 v123, v25
	s_nop 0
	s_nop 0
	buffer_load_dword v31, off, s[0:3], 0 offset:176 ; 4-byte Folded Reload
	buffer_load_dword v67, off, s[0:3], 0 offset:16 ; 4-byte Folded Reload
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[0:31], v[93:94], v[125:126], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[93:94], v[125:126], a[32:63] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_waitcnt lgkmcnt(7)
	v_mfma_f32_32x32x4f16 a[0:31], v[95:96], v[12:13], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[95:96], v[12:13], a[32:63] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[0:31], v[97:98], v[14:15], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[97:98], v[14:15], a[32:63] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_waitcnt lgkmcnt(6)
	v_mfma_f32_32x32x4f16 a[0:31], v[115:116], v[20:21], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[115:116], v[20:21], a[32:63] cbsz:1 abid:1
.Ltmp366:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	s_waitcnt vmcnt(2)
	v_bfi_b32 v2, v104, v2, v2
.Ltmp367:
	.loc	6 52 58                 ; ./in_memory_operation.hpp:52:58
	ds_write_b128 v24, v[0:3]
.Ltmp368:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[0:31], v[117:118], v[22:23], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[117:118], v[22:23], a[32:63] cbsz:1 abid:1
.Ltmp369:
	.loc	6 52 58                 ; ./in_memory_operation.hpp:52:58
	s_waitcnt vmcnt(1)
	ds_write_b128 v31, v[27:30]
	ds_write_b128 v31, v[35:38] offset:16
	ds_write_b128 v31, v[39:42] offset:32
	ds_write_b128 v31, v[75:78] offset:48
	ds_write_b128 v31, v[79:82] offset:64
	ds_write_b128 v31, v[83:86] offset:80
	ds_write_b128 v31, v[87:90] offset:96
	ds_write_b128 v31, v[107:110] offset:112
	s_nop 0
	s_nop 0
	buffer_load_dword v0, off, s[0:3], 0 offset:144 ; 4-byte Folded Reload
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_load_dword v1, off, s[0:3], 0 offset:148 ; 4-byte Folded Reload
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_load_dword v2, off, s[0:3], 0 offset:152 ; 4-byte Folded Reload
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_load_dword v3, off, s[0:3], 0 offset:156 ; 4-byte Folded Reload
.Ltmp370:
	.loc	12 285 28               ; ./multi_index_transform.hpp:285:28
	v_add_u32_e32 v67, v67, v106
	v_mov_b32_e32 v27, v26
	v_mov_b32_e32 v28, v33
	v_mov_b32_e32 v107, v32
.Ltmp371:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_waitcnt lgkmcnt(14)
	v_mfma_f32_32x32x4f16 a[0:31], v[111:112], v[4:5], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[111:112], v[4:5], a[32:63] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[0:31], v[113:114], v[6:7], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[113:114], v[6:7], a[32:63] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_waitcnt lgkmcnt(13)
	v_mfma_f32_32x32x4f16 a[0:31], v[47:48], v[16:17], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[47:48], v[16:17], a[32:63] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[0:31], v[49:50], v[18:19], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[49:50], v[18:19], a[32:63] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_waitcnt lgkmcnt(12)
	v_mfma_f32_32x32x4f16 a[0:31], v[51:52], v[8:9], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[51:52], v[8:9], a[32:63] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_waitcnt vmcnt(0)
	v_mfma_f32_32x32x4f16 a[96:127], v[95:96], v[0:1], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[95:96], v[0:1], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[0:31], v[53:54], v[10:11], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[53:54], v[10:11], a[32:63] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[97:98], v[2:3], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[97:98], v[2:3], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[115:116], v[119:120], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[115:116], v[119:120], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[117:118], v[121:122], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[117:118], v[121:122], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[111:112], v[43:44], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[111:112], v[43:44], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[113:114], v[45:46], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[113:114], v[45:46], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[47:48], v[55:56], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[47:48], v[55:56], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[49:50], v[57:58], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[49:50], v[57:58], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[51:52], v[59:60], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[51:52], v[59:60], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[53:54], v[61:62], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[53:54], v[61:62], a[64:95] cbsz:1 abid:1
	s_cbranch_scc0 BB77_1
.Ltmp372:
; %bb.2:
	.loc	8 13 5                  ; ./synchronization.hpp:13:5
	;;#ASMSTART
	    s_waitcnt lgkmcnt(0) 
     s_barrier     
	;;#ASMEND
.Ltmp373:
	.loc	18 911 24               ; ./xdlops_gemm.hpp:911:24
	ds_read_b128 v[6:9], v127
	ds_read_b128 v[10:13], v127 offset:4096
	.loc	18 912 24               ; ./xdlops_gemm.hpp:912:24
	ds_read_b128 v[14:17], v123
	ds_read_b128 v[18:21], v123 offset:2048
	ds_read_b128 v[22:25], v107
	ds_read_b128 v[26:29], v107 offset:2048
.Ltmp374:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_waitcnt lgkmcnt(3)
	v_mfma_f32_32x32x4f16 a[96:127], v[6:7], v[14:15], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[6:7], v[14:15], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_waitcnt lgkmcnt(1)
	v_mfma_f32_32x32x4f16 a[0:31], v[6:7], v[22:23], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[6:7], v[22:23], a[32:63] cbsz:1 abid:1
	s_mov_b32 s23, 0x27000
	s_mov_b32 s7, 0x5397829d
	s_movk_i32 s6, 0xff3c
	s_mov_b32 s5, 0x92492493
	s_movk_i32 s11, 0xc4
	s_mov_b32 s4, 0x31000
	s_movk_i32 s8, 0x620
	s_movk_i32 s9, 0xc40
	s_movk_i32 s10, 0x1260
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[8:9], v[16:17], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[8:9], v[16:17], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[0:31], v[8:9], v[24:25], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[8:9], v[24:25], a[32:63] cbsz:1 abid:1
.Ltmp375:
	.loc	18 911 24               ; ./xdlops_gemm.hpp:911:24
	ds_read_b128 v[6:9], v127 offset:8192
	ds_read_b128 v[14:17], v127 offset:12288
	.loc	18 912 24               ; ./xdlops_gemm.hpp:912:24
	ds_read_b128 v[22:25], v123 offset:4096
	ds_read_b128 v[30:33], v123 offset:6144
.Ltmp376:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[10:11], v[18:19], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[10:11], v[18:19], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_waitcnt lgkmcnt(4)
	v_mfma_f32_32x32x4f16 a[0:31], v[10:11], v[26:27], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[10:11], v[26:27], a[32:63] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[12:13], v[20:21], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[12:13], v[20:21], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[0:31], v[12:13], v[28:29], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[12:13], v[28:29], a[32:63] cbsz:1 abid:1
.Ltmp377:
	.loc	18 912 24               ; ./xdlops_gemm.hpp:912:24
	ds_read_b128 v[10:13], v107 offset:4096
	ds_read_b128 v[18:21], v107 offset:6144
.Ltmp378:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_waitcnt lgkmcnt(3)
	v_mfma_f32_32x32x4f16 a[96:127], v[6:7], v[22:23], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[6:7], v[22:23], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_waitcnt lgkmcnt(1)
	v_mfma_f32_32x32x4f16 a[0:31], v[6:7], v[10:11], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[6:7], v[10:11], a[32:63] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[8:9], v[24:25], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[8:9], v[24:25], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[0:31], v[8:9], v[12:13], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[8:9], v[12:13], a[32:63] cbsz:1 abid:1
.Ltmp379:
	.loc	18 911 24               ; ./xdlops_gemm.hpp:911:24
	ds_read_b128 v[6:9], v127 offset:16384
	ds_read_b128 v[10:13], v127 offset:20480
	.loc	18 912 24               ; ./xdlops_gemm.hpp:912:24
	ds_read_b128 v[22:25], v123 offset:8192
	ds_read_b128 v[26:29], v123 offset:10240
	.loc	18 911 24               ; ./xdlops_gemm.hpp:911:24
	ds_read_b128 v[34:37], v127 offset:24576
	ds_read_b128 v[38:41], v127 offset:28672
.Ltmp380:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[14:15], v[30:31], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[14:15], v[30:31], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_waitcnt lgkmcnt(6)
	v_mfma_f32_32x32x4f16 a[0:31], v[14:15], v[18:19], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[14:15], v[18:19], a[32:63] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[16:17], v[32:33], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[16:17], v[32:33], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[0:31], v[16:17], v[20:21], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[16:17], v[20:21], a[32:63] cbsz:1 abid:1
.Ltmp381:
	.loc	18 912 24               ; ./xdlops_gemm.hpp:912:24
	ds_read_b128 v[14:17], v123 offset:12288
	ds_read_b128 v[18:21], v123 offset:14336
	ds_read_b128 v[30:33], v107 offset:8192
	ds_read_b128 v[42:45], v107 offset:10240
	ds_read_b128 v[46:49], v107 offset:12288
	ds_read_b128 v[50:53], v107 offset:14336
.Ltmp382:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp383:
	.loc	18 0 0 is_stmt 0        ; ./xdlops_gemm.hpp:0:0
	s_nop 0
	buffer_load_dword v0, off, s[0:3], 0 offset:220 ; 4-byte Folded Reload
.Ltmp384:
	.loc	10 686 16 is_stmt 1     ; ./amd_xdlops.hpp:686:16
	s_waitcnt lgkmcnt(9)
	v_mfma_f32_32x32x4f16 a[96:127], v[6:7], v[22:23], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[6:7], v[22:23], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_waitcnt lgkmcnt(3)
	v_mfma_f32_32x32x4f16 a[0:31], v[6:7], v[30:31], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[6:7], v[30:31], a[32:63] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[8:9], v[24:25], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[8:9], v[24:25], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[0:31], v[8:9], v[32:33], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[8:9], v[32:33], a[32:63] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[10:11], v[26:27], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[10:11], v[26:27], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_waitcnt lgkmcnt(2)
	v_mfma_f32_32x32x4f16 a[0:31], v[10:11], v[42:43], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[10:11], v[42:43], a[32:63] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[12:13], v[28:29], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[12:13], v[28:29], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[0:31], v[12:13], v[44:45], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[12:13], v[44:45], a[32:63] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[34:35], v[14:15], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[34:35], v[14:15], a[64:95] cbsz:1 abid:1
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_waitcnt lgkmcnt(1)
	v_mfma_f32_32x32x4f16 a[0:31], v[34:35], v[46:47], a[0:31] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[34:35], v[46:47], a[32:63] cbsz:1 abid:1
.Ltmp385:
	.loc	18 0 0 is_stmt 0        ; ./xdlops_gemm.hpp:0:0
	s_waitcnt vmcnt(0)
	v_and_or_b32 v110, v0, 31, s22
.Ltmp386:
	.loc	17 125 67 is_stmt 1     ; ./blockwise_gemm_xdlops.hpp:125:67
	s_nop 0
	s_nop 0
	buffer_load_dword v0, off, s[0:3], 0 offset:224 ; 4-byte Folded Reload
	buffer_load_dword v1, off, s[0:3], 0 offset:228 ; 4-byte Folded Reload
.Ltmp387:
	.loc	12 210 34               ; ./multi_index_transform.hpp:210:34
	v_mul_hi_i32 v2, v110, s7
.Ltmp388:
	.loc	17 122 67               ; ./blockwise_gemm_xdlops.hpp:122:67
	v_or_b32_e32 v3, 32, v110
.Ltmp389:
	.loc	12 210 34               ; ./multi_index_transform.hpp:210:34
	v_mul_hi_i32 v5, v3, s7
.Ltmp390:
	.loc	13 1309 44              ; ./gridwise_gemm_xdlops_fp16_bfp16.hpp:1309:44
	v_or_b32_e32 v109, 64, v110
.Ltmp391:
	.loc	12 210 34               ; ./multi_index_transform.hpp:210:34
	v_lshrrev_b32_e32 v7, 31, v2
	v_ashrrev_i32_e32 v2, 6, v2
	v_add_u32_e32 v2, v2, v7
	.loc	12 211 18               ; ./multi_index_transform.hpp:211:18
	v_mul_lo_u32 v9, v2, s6
	.loc	12 210 34               ; ./multi_index_transform.hpp:210:34
	v_lshrrev_b32_e32 v7, 31, v5
	v_ashrrev_i32_e32 v5, 6, v5
.Ltmp392:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[0:31], v[36:37], v[48:49], a[0:31] cbsz:1
.Ltmp393:
	.loc	15 0 0 is_stmt 0        ; ./tensor_descriptor.hpp:0:0
	v_add_u32_e32 v2, s18, v2
.Ltmp394:
	.loc	12 210 34 is_stmt 1     ; ./multi_index_transform.hpp:210:34
	v_add_u32_e32 v5, v5, v7
	v_mul_lo_u32 v59, v2, s4
.Ltmp395:
	.loc	15 0 0 is_stmt 0        ; ./tensor_descriptor.hpp:0:0
	v_add_u32_e32 v2, s18, v5
	v_mul_lo_u32 v114, v2, s4
.Ltmp396:
	.loc	10 686 16 is_stmt 1     ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[36:37], v[16:17], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[36:37], v[48:49], a[32:63] cbsz:1 abid:1
.Ltmp397:
	.loc	12 210 34               ; ./multi_index_transform.hpp:210:34
	v_mul_hi_i32 v113, v109, s7
	s_mov_b32 s22, -1
.Ltmp398:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[64:95], v[36:37], v[16:17], a[64:95] cbsz:1 abid:1
.Ltmp399:
	.loc	12 210 34               ; ./multi_index_transform.hpp:210:34
	v_lshrrev_b32_e32 v118, 31, v113
	v_ashrrev_i32_e32 v113, 6, v113
	v_add_u32_e32 v118, v113, v118
	.loc	12 211 18               ; ./multi_index_transform.hpp:211:18
	v_mul_lo_u32 v119, v118, s6
.Ltmp400:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_waitcnt lgkmcnt(0)
	v_mfma_f32_32x32x4f16 a[0:31], v[38:39], v[50:51], a[0:31] cbsz:1
.Ltmp401:
	.loc	15 0 0 is_stmt 0        ; ./tensor_descriptor.hpp:0:0
	v_add_u32_e32 v118, s18, v118
	v_mul_lo_u32 v118, v118, s4
.Ltmp402:
	.loc	12 211 18 is_stmt 1     ; ./multi_index_transform.hpp:211:18
	v_add_u32_e32 v109, v119, v109
.Ltmp403:
	.loc	12 210 34               ; ./multi_index_transform.hpp:210:34
	v_mul_hi_i32 v119, v109, s5
.Ltmp404:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[38:39], v[18:19], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_mfma_f32_32x32x4f16 a[32:63], v[38:39], v[50:51], a[32:63] cbsz:1 abid:1
	v_mfma_f32_32x32x4f16 a[64:95], v[38:39], v[18:19], a[64:95] cbsz:1 abid:1
	v_mfma_f32_32x32x4f16 a[32:63], v[40:41], v[52:53], a[32:63] cbsz:1 abid:1
	v_mfma_f32_32x32x4f16 a[64:95], v[40:41], v[20:21], a[64:95] cbsz:1 abid:1
.Ltmp405:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 7
	s_nop 5
.Ltmp406:
	.loc	17 125 67               ; ./blockwise_gemm_xdlops.hpp:125:67
	s_waitcnt vmcnt(0)
	v_and_or_b32 v0, v0, 4, v1
.Ltmp407:
	.loc	13 1306 44              ; ./gridwise_gemm_xdlops_fp16_bfp16.hpp:1306:44
	v_add_u32_e32 v1, s19, v0
.Ltmp408:
	.loc	17 125 67               ; ./blockwise_gemm_xdlops.hpp:125:67
	v_or_b32_e32 v0, 32, v0
.Ltmp409:
	.loc	13 1323 46              ; ./gridwise_gemm_xdlops_fp16_bfp16.hpp:1323:46
	v_ashrrev_i32_e32 v4, 31, v1
	v_lshrrev_b32_e32 v4, 29, v4
	.loc	13 1306 44              ; ./gridwise_gemm_xdlops_fp16_bfp16.hpp:1306:44
	v_add_u32_e32 v0, s19, v0
	.loc	13 1323 46              ; ./gridwise_gemm_xdlops_fp16_bfp16.hpp:1323:46
	v_ashrrev_i32_e32 v6, 31, v0
	v_add_u32_e32 v4, v1, v4
	v_lshrrev_b32_e32 v6, 29, v6
	v_and_b32_e32 v4, -8, v4
	v_add_u32_e32 v6, v0, v6
	v_sub_u32_e32 v1, v1, v4
	v_and_b32_e32 v6, -8, v6
	.loc	13 1324 58              ; ./gridwise_gemm_xdlops_fp16_bfp16.hpp:1324:58
	v_ashrrev_i32_e32 v8, 31, v1
	v_lshrrev_b32_e32 v7, 30, v8
	v_sub_u32_e32 v0, v0, v6
	v_add_u32_e32 v1, v1, v7
.Ltmp410:
	.loc	12 211 18               ; ./multi_index_transform.hpp:211:18
	v_mul_lo_u32 v8, v5, s6
.Ltmp411:
	.loc	13 1324 58              ; ./gridwise_gemm_xdlops_fp16_bfp16.hpp:1324:58
	v_ashrrev_i32_e32 v5, 31, v0
	v_lshrrev_b32_e32 v2, 30, v5
	v_and_b32_e32 v1, -4, v1
.Ltmp412:
	.loc	12 211 18               ; ./multi_index_transform.hpp:211:18
	v_add_u32_e32 v5, v9, v110
.Ltmp413:
	.loc	12 369 41               ; ./multi_index_transform.hpp:369:41
	v_add_u32_e32 v1, v1, v4
.Ltmp414:
	.loc	12 210 34               ; ./multi_index_transform.hpp:210:34
	v_mul_hi_i32 v4, v5, s5
.Ltmp415:
	.loc	12 211 18               ; ./multi_index_transform.hpp:211:18
	v_add_u32_e32 v7, v8, v3
.Ltmp416:
	.loc	13 1324 58              ; ./gridwise_gemm_xdlops_fp16_bfp16.hpp:1324:58
	v_add_u32_e32 v0, v0, v2
	v_mul_lo_u32 v2, v1, s11
.Ltmp417:
	.loc	12 210 34               ; ./multi_index_transform.hpp:210:34
	v_add_u32_e32 v8, v4, v5
	v_lshrrev_b32_e32 v9, 31, v8
	v_ashrrev_i32_e32 v8, 3, v8
	v_add_u32_e32 v8, v8, v9
	.loc	12 211 18               ; ./multi_index_transform.hpp:211:18
	v_mul_lo_u32 v10, v8, -14
	v_mul_lo_u32 v99, v8, 14
.Ltmp418:
	.loc	13 1324 58              ; ./gridwise_gemm_xdlops_fp16_bfp16.hpp:1324:58
	v_and_b32_e32 v0, -4, v0
.Ltmp419:
	.loc	12 369 41               ; ./multi_index_transform.hpp:369:41
	v_add_u32_e32 v0, v0, v6
.Ltmp420:
	.loc	12 211 18               ; ./multi_index_transform.hpp:211:18
	v_add_u32_e32 v100, v10, v5
.Ltmp421:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v5, v2, v100, v59
.Ltmp422:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v83, v5, v99, 1
.Ltmp423:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_accvgpr_read_b32 v5, a0
.Ltmp424:
	.loc	12 210 34               ; ./multi_index_transform.hpp:210:34
	v_mul_hi_i32 v6, v7, s5
	v_add_u32_e32 v4, s8, v2
	v_mul_lo_u32 v0, v0, s11
.Ltmp425:
	.loc	13 1309 44              ; ./gridwise_gemm_xdlops_fp16_bfp16.hpp:1309:44
	v_or_b32_e32 v110, 0x60, v110
.Ltmp426:
	.loc	12 210 34               ; ./multi_index_transform.hpp:210:34
	v_add_u32_e32 v6, v6, v7
	v_lshrrev_b32_e32 v9, 31, v6
	v_ashrrev_i32_e32 v6, 3, v6
	v_add_u32_e32 v6, v6, v9
	.loc	12 211 18               ; ./multi_index_transform.hpp:211:18
	v_mul_lo_u32 v8, v6, -14
	v_mul_lo_u32 v115, v6, 14
.Ltmp427:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v6, v4, v100, v59
.Ltmp428:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v75, v6, v99, 1
.Ltmp429:
	.loc	12 211 18               ; ./multi_index_transform.hpp:211:18
	v_add_u32_e32 v116, v8, v7
.Ltmp430:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v6, v4, v116, v114
.Ltmp431:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v61, v6, v115, 1
.Ltmp432:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v7, v0, v100, v59
.Ltmp433:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v8, v7, v99, 1
.Ltmp434:
	.loc	12 210 34               ; ./multi_index_transform.hpp:210:34
	v_mul_hi_i32 v121, v110, s7
	v_add_u32_e32 v3, s9, v2
	v_add_u32_e32 v1, s10, v2
.Ltmp435:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v9, v3, v100, v59
	v_add3_u32 v10, v1, v100, v59
.Ltmp436:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v73, v9, v99, 1
	v_add_lshl_u32 v71, v10, v99, 1
.Ltmp437:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v9, v3, v116, v114
	v_add3_u32 v10, v1, v116, v114
.Ltmp438:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v48, v9, v115, 1
	v_add_lshl_u32 v9, v10, v115, 1
.Ltmp439:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_accvgpr_read_b32 v10, a63
	v_accvgpr_read_b32 v11, a60
.Ltmp440:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v89, a73
	v_accvgpr_read_b32 v90, a74
	v_accvgpr_read_b32 v94, a77
	v_accvgpr_read_b32 v95, a78
	v_accvgpr_read_b32 v103, a85
	v_accvgpr_read_b32 v104, a86
	v_accvgpr_read_b32 v117, a89
	v_accvgpr_read_b32 v120, a90
.Ltmp441:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_accvgpr_read_b32 v67, a64
	v_accvgpr_read_b32 v66, a67
	s_setreg_imm32_b32 hwreg(HW_REG_MODE, 2, 2), 0
.Ltmp442:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v67, v67
.Ltmp443:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v78, a66
.Ltmp444:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v66, v66
.Ltmp445:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v77, a65
.Ltmp446:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v78, v78
	v_cvt_f16_f32_e32 v77, v77
.Ltmp447:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_accvgpr_read_b32 v64, a68
	v_accvgpr_read_b32 v62, a71
.Ltmp448:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v64, v64
.Ltmp449:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v84, a70
.Ltmp450:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v62, v62
.Ltmp451:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v82, a69
.Ltmp452:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v84, v84
	v_cvt_f16_f32_e32 v82, v82
.Ltmp453:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_accvgpr_read_b32 v60, a72
	v_accvgpr_read_b32 v57, a75
.Ltmp454:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v60, v60
	v_cvt_f16_f32_e32 v57, v57
.Ltmp455:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_accvgpr_read_b32 v55, a76
	v_accvgpr_read_b32 v51, a79
.Ltmp456:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v55, v55
	v_cvt_f16_f32_e32 v51, v51
.Ltmp457:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_accvgpr_read_b32 v50, a80
	v_accvgpr_read_b32 v46, a83
.Ltmp458:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v50, v50
	v_cvt_f16_f32_e32 v46, v46
.Ltmp459:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_accvgpr_read_b32 v45, a84
	v_accvgpr_read_b32 v39, a87
.Ltmp460:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v45, v45
	v_cvt_f16_f32_e32 v39, v39
.Ltmp461:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_accvgpr_read_b32 v37, a88
	v_accvgpr_read_b32 v32, a91
.Ltmp462:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v37, v37
	v_cvt_f16_f32_e32 v32, v32
.Ltmp463:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_accvgpr_read_b32 v30, a92
	v_accvgpr_read_b32 v26, a95
.Ltmp464:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v30, v30
	v_cvt_f16_f32_e32 v26, v26
.Ltmp465:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_accvgpr_read_b32 v42, a32
	v_accvgpr_read_b32 v38, a35
.Ltmp466:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v42, v42
	v_cvt_f16_f32_e32 v38, v38
.Ltmp467:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_accvgpr_read_b32 v36, a36
	v_accvgpr_read_b32 v31, a39
.Ltmp468:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v36, v36
	v_cvt_f16_f32_e32 v31, v31
.Ltmp469:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_accvgpr_read_b32 v29, a40
	v_accvgpr_read_b32 v25, a43
.Ltmp470:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v29, v29
	v_cvt_f16_f32_e32 v25, v25
.Ltmp471:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_accvgpr_read_b32 v24, a44
.Ltmp472:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v24, v24
.Ltmp473:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_accvgpr_read_b32 v17, a51
.Ltmp474:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v17, v17
.Ltmp475:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_accvgpr_read_b32 v16, a52
	v_accvgpr_read_b32 v14, a55
.Ltmp476:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v16, v16
	v_cvt_f16_f32_e32 v14, v14
.Ltmp477:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_accvgpr_read_b32 v13, a56
	v_accvgpr_read_b32 v12, a59
.Ltmp478:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v13, v13
	v_cvt_f16_f32_e32 v12, v12
.Ltmp479:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp480:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	s_nop 0
	buffer_store_dword v5, off, s[0:3], 0 offset:16 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a1
.Ltmp481:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp482:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:20 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a2
.Ltmp483:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp484:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:24 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a3
.Ltmp485:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp486:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:28 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a4
.Ltmp487:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp488:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:32 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a5
.Ltmp489:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp490:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:36 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a6
.Ltmp491:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp492:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:40 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a7
.Ltmp493:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp494:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:44 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a8
.Ltmp495:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp496:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:48 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a9
.Ltmp497:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp498:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:52 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a10
.Ltmp499:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp500:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:56 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a11
.Ltmp501:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp502:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:60 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a12
.Ltmp503:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp504:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:64 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a13
.Ltmp505:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp506:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:68 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a14
.Ltmp507:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp508:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:72 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a15
.Ltmp509:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp510:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:76 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a16
.Ltmp511:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp512:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:80 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a17
.Ltmp513:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp514:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:84 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a18
.Ltmp515:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp516:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:88 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a19
.Ltmp517:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp518:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:92 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a20
.Ltmp519:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp520:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:96 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a21
.Ltmp521:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp522:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:100 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a22
.Ltmp523:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp524:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:104 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a23
.Ltmp525:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp526:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:108 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a24
.Ltmp527:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp528:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:112 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a25
.Ltmp529:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp530:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:116 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a26
.Ltmp531:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp532:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:120 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a27
.Ltmp533:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp534:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:124 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a28
.Ltmp535:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp536:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:128 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a29
.Ltmp537:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp538:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:132 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a30
.Ltmp539:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp540:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:136 ; 4-byte Folded Spill
	v_accvgpr_read_b32 v5, a31
.Ltmp541:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 1
.Ltmp542:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	buffer_store_dword v5, off, s[0:3], 0 offset:140 ; 4-byte Folded Spill
.Ltmp543:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v5, v2, v116, v114
.Ltmp544:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v68, v5, v115, 1
.Ltmp545:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[0:31], v[40:41], v[20:21], a[96:127] cbsz:1
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_accvgpr_read_b32 v21, a47
.Ltmp546:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v21, v21
.Ltmp547:
	.loc	10 687 16               ; ./amd_xdlops.hpp:687:16
	v_accvgpr_read_b32 v20, a48
.Ltmp548:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v20, v20
.Ltmp549:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp550:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:16 ; 4-byte Folded Reload
.Ltmp551:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 7
	s_nop 3
.Ltmp552:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_accvgpr_read_b32 v6, a0
.Ltmp553:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v6, v6
.Ltmp554:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v34, a2
	v_accvgpr_read_b32 v7, a1
.Ltmp555:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v34, v34
	v_cvt_f16_f32_e32 v7, v7
.Ltmp556:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_accvgpr_read_b32 v93, a7
	v_accvgpr_read_b32 v96, a4
.Ltmp557:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v108, a6
	v_accvgpr_read_b32 v107, a5
.Ltmp558:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v96, v96
	v_cvt_f16_f32_e32 v93, v93
	v_cvt_f16_f32_e32 v108, v108
	v_cvt_f16_f32_e32 v107, v107
.Ltmp559:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_accvgpr_read_b32 v88, a8
	v_accvgpr_read_b32 v87, a11
.Ltmp560:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v106, a10
	v_accvgpr_read_b32 v105, a9
.Ltmp561:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v87, v87
.Ltmp562:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_accvgpr_read_b32 v79, a12
	v_accvgpr_read_b32 v76, a15
.Ltmp563:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v102, a14
	v_accvgpr_read_b32 v101, a13
.Ltmp564:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v76, v76
	v_cvt_f16_f32_e32 v101, v101
.Ltmp565:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_accvgpr_read_b32 v74, a16
	v_accvgpr_read_b32 v72, a19
.Ltmp566:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v98, a18
	v_accvgpr_read_b32 v97, a17
.Ltmp567:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v72, v72
	v_cvt_f16_f32_e32 v97, v97
.Ltmp568:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_accvgpr_read_b32 v70, a20
	v_accvgpr_read_b32 v69, a23
.Ltmp569:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v92, a22
	v_accvgpr_read_b32 v91, a21
.Ltmp570:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v69, v69
	v_cvt_f16_f32_e32 v91, v91
.Ltmp571:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_accvgpr_read_b32 v63, a27
	v_accvgpr_read_b32 v65, a24
.Ltmp572:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v86, a26
	v_accvgpr_read_b32 v85, a25
.Ltmp573:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v65, v65
	v_cvt_f16_f32_e32 v63, v63
.Ltmp574:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_accvgpr_read_b32 v44, a31
	v_accvgpr_read_b32 v56, a28
.Ltmp575:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v81, a30
.Ltmp576:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v56, v56
	v_cvt_f16_f32_e32 v44, v44
.Ltmp577:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v80, a29
.Ltmp578:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v81, v81
	v_cvt_f16_f32_e32 v80, v80
.Ltmp579:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a96, v5
.Ltmp580:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp581:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:20 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a97, v5
.Ltmp582:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp583:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:24 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a98, v5
.Ltmp584:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp585:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:28 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a99, v5
.Ltmp586:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp587:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:32 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a100, v5
.Ltmp588:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp589:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:36 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a101, v5
.Ltmp590:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp591:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:40 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a102, v5
.Ltmp592:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp593:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:44 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a103, v5
.Ltmp594:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp595:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:48 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a104, v5
.Ltmp596:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp597:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:52 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a105, v5
.Ltmp598:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp599:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:56 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a106, v5
.Ltmp600:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp601:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:60 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a107, v5
.Ltmp602:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp603:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:64 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a108, v5
.Ltmp604:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp605:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:68 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a109, v5
.Ltmp606:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp607:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:72 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a110, v5
.Ltmp608:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp609:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:76 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a111, v5
.Ltmp610:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp611:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:80 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a112, v5
.Ltmp612:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp613:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:84 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a113, v5
.Ltmp614:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp615:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:88 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a114, v5
.Ltmp616:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp617:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:92 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a115, v5
.Ltmp618:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp619:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:96 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a116, v5
.Ltmp620:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp621:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:100 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a117, v5
.Ltmp622:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp623:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:104 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a118, v5
.Ltmp624:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp625:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:108 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a119, v5
.Ltmp626:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp627:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:112 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a120, v5
.Ltmp628:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp629:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:116 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a121, v5
.Ltmp630:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp631:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:120 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a122, v5
.Ltmp632:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp633:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:124 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a123, v5
.Ltmp634:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp635:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:128 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a124, v5
.Ltmp636:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp637:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:132 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a125, v5
.Ltmp638:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp639:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:136 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a126, v5
.Ltmp640:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp641:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	s_nop 0
	buffer_load_dword v5, off, s[0:3], 0 offset:140 ; 4-byte Folded Reload
	s_waitcnt vmcnt(0)
	v_accvgpr_write_b32 a127, v5
	v_accvgpr_read_b32 v5, a3
.Ltmp642:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v5, v5
.Ltmp643:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_mfma_f32_32x32x4f16 a[96:127], v[40:41], v[52:53], a[96:127] cbsz:1
.Ltmp644:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	s_nop 0
	s_nop 0
	buffer_store_short v6, off, s[0:3], 0 offset:8
	buffer_store_short v5, off, s[0:3], 0 offset:14
	buffer_store_short v34, off, s[0:3], 0 offset:12
	buffer_store_short v7, off, s[0:3], 0 offset:10
	v_add_u32_e32 v5, s8, v0
.Ltmp645:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v6, v5, v100, v59
.Ltmp646:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v34, v6, v99, 1
	v_add_u32_e32 v6, s9, v0
.Ltmp647:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v7, v6, v100, v59
.Ltmp648:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v43, v7, v99, 1
	v_add_u32_e32 v7, s10, v0
.Ltmp649:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v53, v7, v100, v59
	v_add3_u32 v59, v0, v116, v114
	v_add3_u32 v112, v5, v116, v114
	v_add3_u32 v113, v6, v116, v114
	v_add3_u32 v114, v7, v116, v114
.Ltmp650:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v59, v59, v115, 1
	v_add_lshl_u32 v112, v112, v115, 1
	v_add_lshl_u32 v113, v113, v115, 1
	v_add_lshl_u32 v114, v114, v115, 1
.Ltmp651:
	.loc	12 210 34               ; ./multi_index_transform.hpp:210:34
	v_add_u32_e32 v115, v119, v109
.Ltmp652:
	.loc	12 210 34 is_stmt 0     ; ./multi_index_transform.hpp:210:34
	v_lshrrev_b32_e32 v116, 31, v121
	v_ashrrev_i32_e32 v119, 6, v121
	v_add_u32_e32 v116, v119, v116
	.loc	12 211 18 is_stmt 1     ; ./multi_index_transform.hpp:211:18
	v_mul_lo_u32 v119, v116, s6
.Ltmp653:
	.loc	15 0 0 is_stmt 0        ; ./tensor_descriptor.hpp:0:0
	v_add_u32_e32 v116, s18, v116
	v_mul_lo_u32 v116, v116, s4
.Ltmp654:
	.loc	5 627 61 is_stmt 1      ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v53, v53, v99, 1
.Ltmp655:
	.loc	12 211 18               ; ./multi_index_transform.hpp:211:18
	v_add_u32_e32 v110, v119, v110
.Ltmp656:
	.loc	12 210 34               ; ./multi_index_transform.hpp:210:34
	v_mul_hi_i32 v119, v110, s5
.Ltmp657:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v99, a81
	v_accvgpr_read_b32 v100, a82
	v_accvgpr_read_b32 v124, a106
.Ltmp658:
	.loc	12 210 34               ; ./multi_index_transform.hpp:210:34
	v_add_u32_e32 v119, v119, v110
	v_lshrrev_b32_e32 v122, 31, v119
	v_ashrrev_i32_e32 v119, 3, v119
	v_add_u32_e32 v119, v119, v122
	.loc	12 211 18               ; ./multi_index_transform.hpp:211:18
	v_mul_lo_u32 v122, v119, -14
	v_mul_lo_u32 v119, v119, 14
.Ltmp659:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v125, a109
.Ltmp660:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_accvgpr_read_b32 v58, a96
.Ltmp661:
	.loc	12 211 18               ; ./multi_index_transform.hpp:211:18
	v_add_u32_e32 v122, v122, v110
.Ltmp662:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v110, v7, v122, v116
.Ltmp663:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v123, v110, v119, 1
.Ltmp664:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_accvgpr_read_b32 v54, a99
.Ltmp665:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v58, v58
	v_cvt_f16_f32_e32 v54, v54
.Ltmp666:
	.loc	12 210 34               ; ./multi_index_transform.hpp:210:34
	v_lshrrev_b32_e32 v121, 31, v115
	v_ashrrev_i32_e32 v115, 3, v115
	v_add_u32_e32 v115, v115, v121
	.loc	12 211 18               ; ./multi_index_transform.hpp:211:18
	v_mul_lo_u32 v121, v115, -14
	v_mul_lo_u32 v115, v115, 14
.Ltmp667:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_accvgpr_read_b32 v52, a100
	v_accvgpr_read_b32 v49, a103
.Ltmp668:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v52, v52
	v_cvt_f16_f32_e32 v49, v49
.Ltmp669:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_accvgpr_read_b32 v47, a104
	v_accvgpr_read_b32 v41, a107
.Ltmp670:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v47, v47
	v_cvt_f16_f32_e32 v41, v41
.Ltmp671:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_accvgpr_read_b32 v40, a108
	v_accvgpr_read_b32 v35, a111
.Ltmp672:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v40, v40
	v_cvt_f16_f32_e32 v35, v35
.Ltmp673:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_accvgpr_read_b32 v33, a112
	v_accvgpr_read_b32 v28, a115
.Ltmp674:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v33, v33
	v_cvt_f16_f32_e32 v28, v28
.Ltmp675:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_accvgpr_read_b32 v27, a116
	v_accvgpr_read_b32 v23, a119
.Ltmp676:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v27, v27
	v_cvt_f16_f32_e32 v23, v23
.Ltmp677:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_accvgpr_read_b32 v22, a120
	v_accvgpr_read_b32 v19, a123
.Ltmp678:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v22, v22
	v_cvt_f16_f32_e32 v19, v19
.Ltmp679:
	.loc	10 686 16               ; ./amd_xdlops.hpp:686:16
	v_accvgpr_read_b32 v18, a124
	v_accvgpr_read_b32 v15, a127
.Ltmp680:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v18, v18
	v_cvt_f16_f32_e32 v15, v15
.Ltmp681:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp682:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	s_nop 0
	buffer_load_dword v111, off, s[0:3], 0 offset:12
	buffer_load_dword v110, off, s[0:3], 0 offset:8
.Ltmp683:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp684:
	.loc	5 624 5                 ; ./amd_buffer_addressing.hpp:624:5
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[110:111], v83, s[20:23], 0 offen
.Ltmp685:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v96, off, s[0:3], 0 offset:8
	buffer_store_short v93, off, s[0:3], 0 offset:14
	buffer_store_short v108, off, s[0:3], 0 offset:12
	buffer_store_short v107, off, s[0:3], 0 offset:10
.Ltmp686:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v108, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v107, off, s[0:3], 0 offset:8
.Ltmp687:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v110, a94
	v_accvgpr_read_b32 v83, a93
.Ltmp688:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v110, v110
	v_cvt_f16_f32_e32 v83, v83
.Ltmp689:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v96, a98
	v_accvgpr_read_b32 v111, a97
.Ltmp690:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v96, v96
	v_cvt_f16_f32_e32 v111, v111
.Ltmp691:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v93, a101
.Ltmp692:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v93, v93
.Ltmp693:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp694:
	.loc	5 624 5                 ; ./amd_buffer_addressing.hpp:624:5
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[107:108], v75, s[20:23], 0 offen
.Ltmp695:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v75, v88
	v_cvt_f16_f32_e32 v88, v105
.Ltmp696:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v107, a102
.Ltmp697:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v107, v107
.Ltmp698:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v108, a105
.Ltmp699:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v108, v108
.Ltmp700:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v105, a110
.Ltmp701:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v105, v105
.Ltmp702:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp703:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	s_nop 0
	buffer_store_short v75, off, s[0:3], 0 offset:8
.Ltmp704:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v75, v106
.Ltmp705:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v106, a50
.Ltmp706:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v106, v106
.Ltmp707:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp708:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	s_nop 0
	buffer_store_short v87, off, s[0:3], 0 offset:14
	buffer_store_short v75, off, s[0:3], 0 offset:12
	buffer_store_short v88, off, s[0:3], 0 offset:10
.Ltmp709:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v88, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v87, off, s[0:3], 0 offset:8
.Ltmp710:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v75, v79
.Ltmp711:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v79, a114
.Ltmp712:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v79, v79
.Ltmp713:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp714:
	.loc	5 624 5                 ; ./amd_buffer_addressing.hpp:624:5
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[87:88], v73, s[20:23], 0 offen
.Ltmp715:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v75, off, s[0:3], 0 offset:8
.Ltmp716:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v75, v102
.Ltmp717:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v73, a113
.Ltmp718:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v73, v73
.Ltmp719:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v88, a118
	v_accvgpr_read_b32 v87, a117
.Ltmp720:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v88, v88
	v_cvt_f16_f32_e32 v87, v87
.Ltmp721:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v102, a121
.Ltmp722:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v102, v102
.Ltmp723:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp724:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	s_nop 0
	buffer_store_short v76, off, s[0:3], 0 offset:14
	buffer_store_short v75, off, s[0:3], 0 offset:12
	buffer_store_short v101, off, s[0:3], 0 offset:10
.Ltmp725:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v76, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v75, off, s[0:3], 0 offset:8
.Ltmp726:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v101, a33
.Ltmp727:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v101, v101
.Ltmp728:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp729:
	.loc	5 624 5                 ; ./amd_buffer_addressing.hpp:624:5
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[75:76], v71, s[20:23], 0 offen
.Ltmp730:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v71, v74
.Ltmp731:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v75, a122
.Ltmp732:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v75, v75
.Ltmp733:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v76, a126
	v_accvgpr_read_b32 v74, a125
.Ltmp734:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v76, v76
	v_cvt_f16_f32_e32 v74, v74
.Ltmp735:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp736:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	s_nop 0
	buffer_store_short v71, off, s[0:3], 0 offset:8
.Ltmp737:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v71, v98
.Ltmp738:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v98, a34
.Ltmp739:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v98, v98
.Ltmp740:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp741:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	s_nop 0
	buffer_store_short v72, off, s[0:3], 0 offset:14
	buffer_store_short v71, off, s[0:3], 0 offset:12
	buffer_store_short v97, off, s[0:3], 0 offset:10
.Ltmp742:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v72, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v71, off, s[0:3], 0 offset:8
.Ltmp743:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v97, a42
.Ltmp744:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v97, v97
.Ltmp745:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp746:
	.loc	5 624 5                 ; ./amd_buffer_addressing.hpp:624:5
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[71:72], v68, s[20:23], 0 offen
.Ltmp747:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v68, v70
.Ltmp748:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v70, a38
	v_accvgpr_read_b32 v71, a37
.Ltmp749:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v70, v70
	v_cvt_f16_f32_e32 v71, v71
.Ltmp750:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v72, a41
.Ltmp751:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v72, v72
.Ltmp752:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp753:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	s_nop 0
	buffer_store_short v68, off, s[0:3], 0 offset:8
.Ltmp754:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v68, v92
.Ltmp755:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v92, a45
.Ltmp756:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v92, v92
.Ltmp757:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp758:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	s_nop 0
	buffer_store_short v69, off, s[0:3], 0 offset:14
	buffer_store_short v68, off, s[0:3], 0 offset:12
	buffer_store_short v91, off, s[0:3], 0 offset:10
.Ltmp759:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v69, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v68, off, s[0:3], 0 offset:8
.Ltmp760:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v91, a49
.Ltmp761:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v91, v91
.Ltmp762:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp763:
	.loc	5 624 5                 ; ./amd_buffer_addressing.hpp:624:5
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[68:69], v61, s[20:23], 0 offen
.Ltmp764:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v69, v86
	v_cvt_f16_f32_e32 v68, v85
	v_cvt_f16_f32_e32 v85, v89
	v_cvt_f16_f32_e32 v86, v90
	v_cvt_f16_f32_e32 v89, v94
	v_cvt_f16_f32_e32 v90, v95
	v_cvt_f16_f32_e32 v94, v99
	v_cvt_f16_f32_e32 v95, v100
	v_cvt_f16_f32_e32 v99, v103
	v_cvt_f16_f32_e32 v100, v104
	v_cvt_f16_f32_e32 v103, v117
	v_cvt_f16_f32_e32 v104, v120
	v_cvt_f16_f32_e32 v117, v124
	v_cvt_f16_f32_e32 v120, v125
	v_cvt_f16_f32_e32 v124, v11
	v_cvt_f16_f32_e32 v125, v10
.Ltmp765:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v61, a46
.Ltmp766:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v61, v61
.Ltmp767:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp768:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	s_nop 0
	buffer_store_short v65, off, s[0:3], 0 offset:8
	buffer_store_short v63, off, s[0:3], 0 offset:14
	buffer_store_short v69, off, s[0:3], 0 offset:12
	buffer_store_short v68, off, s[0:3], 0 offset:10
.Ltmp769:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v69, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v68, off, s[0:3], 0 offset:8
.Ltmp770:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v63, a54
	v_accvgpr_read_b32 v65, a53
.Ltmp771:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v63, v63
	v_cvt_f16_f32_e32 v65, v65
.Ltmp772:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp773:
	.loc	5 624 5                 ; ./amd_buffer_addressing.hpp:624:5
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[68:69], v48, s[20:23], 0 offen
.Ltmp774:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v56, off, s[0:3], 0 offset:8
	buffer_store_short v44, off, s[0:3], 0 offset:14
	buffer_store_short v81, off, s[0:3], 0 offset:12
	buffer_store_short v80, off, s[0:3], 0 offset:10
.Ltmp775:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v11, off, s[0:3], 0 offset:12
	buffer_load_dword v10, off, s[0:3], 0 offset:8
.Ltmp776:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v68, a58
	v_accvgpr_read_b32 v48, a57
.Ltmp777:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v68, v68
	v_cvt_f16_f32_e32 v48, v48
.Ltmp778:
	.loc	16 133 64               ; ./threadwise_generic_tensor_slice_copy.hpp:133:64
	v_accvgpr_read_b32 v56, a62
	v_accvgpr_read_b32 v69, a61
.Ltmp779:
	.loc	4 271 31                ; ./float_type.hpp:271:31
	v_cvt_f16_f32_e32 v56, v56
	v_cvt_f16_f32_e32 v69, v69
.Ltmp780:
	.loc	5 624 5                 ; ./amd_buffer_addressing.hpp:624:5
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[10:11], v9, s[20:23], 0 offen
.Ltmp781:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v67, off, s[0:3], 0 offset:8
	buffer_store_short v66, off, s[0:3], 0 offset:14
	buffer_store_short v78, off, s[0:3], 0 offset:12
	buffer_store_short v77, off, s[0:3], 0 offset:10
.Ltmp782:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v10, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v9, off, s[0:3], 0 offset:8
	.loc	5 624 5 is_stmt 0       ; ./amd_buffer_addressing.hpp:624:5
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[9:10], v8, s[20:23], 0 offen
.Ltmp783:
	.loc	16 133 38 is_stmt 1     ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v64, off, s[0:3], 0 offset:8
	buffer_store_short v62, off, s[0:3], 0 offset:14
	buffer_store_short v84, off, s[0:3], 0 offset:12
	buffer_store_short v82, off, s[0:3], 0 offset:10
.Ltmp784:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v9, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v8, off, s[0:3], 0 offset:8
.Ltmp785:
	.loc	12 211 18               ; ./multi_index_transform.hpp:211:18
	v_add_u32_e32 v10, v121, v109
.Ltmp786:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v11, v2, v10, v118
.Ltmp787:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v11, v11, v115, 1
.Ltmp788:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v2, v2, v122, v116
.Ltmp789:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v2, v2, v119, 1
	.loc	5 624 5                 ; ./amd_buffer_addressing.hpp:624:5
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[8:9], v34, s[20:23], 0 offen
.Ltmp790:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v60, off, s[0:3], 0 offset:8
	buffer_store_short v57, off, s[0:3], 0 offset:14
	buffer_store_short v86, off, s[0:3], 0 offset:12
	buffer_store_short v85, off, s[0:3], 0 offset:10
.Ltmp791:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v9, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v8, off, s[0:3], 0 offset:8
	.loc	5 624 5 is_stmt 0       ; ./amd_buffer_addressing.hpp:624:5
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[8:9], v43, s[20:23], 0 offen
.Ltmp792:
	.loc	16 133 38 is_stmt 1     ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v55, off, s[0:3], 0 offset:8
	buffer_store_short v51, off, s[0:3], 0 offset:14
	buffer_store_short v90, off, s[0:3], 0 offset:12
	buffer_store_short v89, off, s[0:3], 0 offset:10
.Ltmp793:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v9, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v8, off, s[0:3], 0 offset:8
	.loc	5 624 5 is_stmt 0       ; ./amd_buffer_addressing.hpp:624:5
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[8:9], v53, s[20:23], 0 offen
.Ltmp794:
	.loc	16 133 38 is_stmt 1     ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v50, off, s[0:3], 0 offset:8
	buffer_store_short v46, off, s[0:3], 0 offset:14
	buffer_store_short v95, off, s[0:3], 0 offset:12
	buffer_store_short v94, off, s[0:3], 0 offset:10
.Ltmp795:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v9, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v8, off, s[0:3], 0 offset:8
	.loc	5 624 5 is_stmt 0       ; ./amd_buffer_addressing.hpp:624:5
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[8:9], v59, s[20:23], 0 offen
.Ltmp796:
	.loc	16 133 38 is_stmt 1     ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v45, off, s[0:3], 0 offset:8
	buffer_store_short v39, off, s[0:3], 0 offset:14
	buffer_store_short v100, off, s[0:3], 0 offset:12
	buffer_store_short v99, off, s[0:3], 0 offset:10
.Ltmp797:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v9, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v8, off, s[0:3], 0 offset:8
	.loc	5 624 5 is_stmt 0       ; ./amd_buffer_addressing.hpp:624:5
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[8:9], v112, s[20:23], 0 offen
.Ltmp798:
	.loc	16 133 38 is_stmt 1     ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v37, off, s[0:3], 0 offset:8
	buffer_store_short v32, off, s[0:3], 0 offset:14
	buffer_store_short v104, off, s[0:3], 0 offset:12
	buffer_store_short v103, off, s[0:3], 0 offset:10
.Ltmp799:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v9, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v8, off, s[0:3], 0 offset:8
	.loc	5 624 5 is_stmt 0       ; ./amd_buffer_addressing.hpp:624:5
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[8:9], v113, s[20:23], 0 offen
.Ltmp800:
	.loc	16 133 38 is_stmt 1     ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v30, off, s[0:3], 0 offset:8
	buffer_store_short v26, off, s[0:3], 0 offset:14
	buffer_store_short v110, off, s[0:3], 0 offset:12
	buffer_store_short v83, off, s[0:3], 0 offset:10
.Ltmp801:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v9, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v8, off, s[0:3], 0 offset:8
	.loc	5 624 5 is_stmt 0       ; ./amd_buffer_addressing.hpp:624:5
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[8:9], v114, s[20:23], 0 offen
.Ltmp802:
	.loc	16 133 38 is_stmt 1     ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v58, off, s[0:3], 0 offset:8
	buffer_store_short v54, off, s[0:3], 0 offset:14
	buffer_store_short v96, off, s[0:3], 0 offset:12
	buffer_store_short v111, off, s[0:3], 0 offset:10
.Ltmp803:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v9, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v8, off, s[0:3], 0 offset:8
	.loc	5 624 5 is_stmt 0       ; ./amd_buffer_addressing.hpp:624:5
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[8:9], v11, s[20:23], 0 offen
.Ltmp804:
	.loc	16 133 38 is_stmt 1     ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v52, off, s[0:3], 0 offset:8
	buffer_store_short v49, off, s[0:3], 0 offset:14
	buffer_store_short v107, off, s[0:3], 0 offset:12
	buffer_store_short v93, off, s[0:3], 0 offset:10
.Ltmp805:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v9, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v8, off, s[0:3], 0 offset:8
.Ltmp806:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v11, v4, v10, v118
.Ltmp807:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v11, v11, v115, 1
	.loc	5 624 5                 ; ./amd_buffer_addressing.hpp:624:5
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[8:9], v11, s[20:23], 0 offen
.Ltmp808:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v47, off, s[0:3], 0 offset:8
	buffer_store_short v41, off, s[0:3], 0 offset:14
	buffer_store_short v117, off, s[0:3], 0 offset:12
	buffer_store_short v108, off, s[0:3], 0 offset:10
.Ltmp809:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v9, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v8, off, s[0:3], 0 offset:8
.Ltmp810:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v11, v3, v10, v118
.Ltmp811:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v11, v11, v115, 1
	.loc	5 624 5                 ; ./amd_buffer_addressing.hpp:624:5
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[8:9], v11, s[20:23], 0 offen
.Ltmp812:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v40, off, s[0:3], 0 offset:8
	buffer_store_short v35, off, s[0:3], 0 offset:14
	buffer_store_short v105, off, s[0:3], 0 offset:12
	buffer_store_short v120, off, s[0:3], 0 offset:10
.Ltmp813:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v9, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v8, off, s[0:3], 0 offset:8
.Ltmp814:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v11, v1, v10, v118
.Ltmp815:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v11, v11, v115, 1
.Ltmp816:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v1, v1, v122, v116
.Ltmp817:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v1, v1, v119, 1
	.loc	5 624 5                 ; ./amd_buffer_addressing.hpp:624:5
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[8:9], v11, s[20:23], 0 offen
.Ltmp818:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v33, off, s[0:3], 0 offset:8
	buffer_store_short v28, off, s[0:3], 0 offset:14
	buffer_store_short v79, off, s[0:3], 0 offset:12
	buffer_store_short v73, off, s[0:3], 0 offset:10
.Ltmp819:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v9, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v8, off, s[0:3], 0 offset:8
	.loc	5 624 5 is_stmt 0       ; ./amd_buffer_addressing.hpp:624:5
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[8:9], v2, s[20:23], 0 offen
.Ltmp820:
	.loc	16 133 38 is_stmt 1     ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v27, off, s[0:3], 0 offset:8
	buffer_store_short v23, off, s[0:3], 0 offset:14
	buffer_store_short v88, off, s[0:3], 0 offset:12
	buffer_store_short v87, off, s[0:3], 0 offset:10
.Ltmp821:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v9, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v8, off, s[0:3], 0 offset:8
.Ltmp822:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v2, v4, v122, v116
.Ltmp823:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v2, v2, v119, 1
	.loc	5 624 5                 ; ./amd_buffer_addressing.hpp:624:5
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[8:9], v2, s[20:23], 0 offen
.Ltmp824:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v22, off, s[0:3], 0 offset:8
	buffer_store_short v19, off, s[0:3], 0 offset:14
	buffer_store_short v75, off, s[0:3], 0 offset:12
	buffer_store_short v102, off, s[0:3], 0 offset:10
.Ltmp825:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v9, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v8, off, s[0:3], 0 offset:8
.Ltmp826:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v2, v3, v122, v116
.Ltmp827:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v2, v2, v119, 1
	.loc	5 624 5                 ; ./amd_buffer_addressing.hpp:624:5
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[8:9], v2, s[20:23], 0 offen
.Ltmp828:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v18, off, s[0:3], 0 offset:8
	buffer_store_short v15, off, s[0:3], 0 offset:14
	buffer_store_short v76, off, s[0:3], 0 offset:12
	buffer_store_short v74, off, s[0:3], 0 offset:10
.Ltmp829:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v3, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v2, off, s[0:3], 0 offset:8
	.loc	5 624 5 is_stmt 0       ; ./amd_buffer_addressing.hpp:624:5
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[2:3], v1, s[20:23], 0 offen
.Ltmp830:
	.loc	16 133 38 is_stmt 1     ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v42, off, s[0:3], 0 offset:8
	buffer_store_short v38, off, s[0:3], 0 offset:14
	buffer_store_short v98, off, s[0:3], 0 offset:12
	buffer_store_short v101, off, s[0:3], 0 offset:10
.Ltmp831:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v2, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v1, off, s[0:3], 0 offset:8
.Ltmp832:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v3, v0, v10, v118
.Ltmp833:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v3, v3, v115, 1
.Ltmp834:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v0, v0, v122, v116
.Ltmp835:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v0, v0, v119, 1
	.loc	5 624 5                 ; ./amd_buffer_addressing.hpp:624:5
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[1:2], v3, s[20:23], 0 offen
.Ltmp836:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v36, off, s[0:3], 0 offset:8
	buffer_store_short v31, off, s[0:3], 0 offset:14
	buffer_store_short v70, off, s[0:3], 0 offset:12
	buffer_store_short v71, off, s[0:3], 0 offset:10
.Ltmp837:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v2, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v1, off, s[0:3], 0 offset:8
.Ltmp838:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v3, v5, v10, v118
.Ltmp839:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v3, v3, v115, 1
	.loc	5 624 5                 ; ./amd_buffer_addressing.hpp:624:5
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[1:2], v3, s[20:23], 0 offen
.Ltmp840:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v29, off, s[0:3], 0 offset:8
	buffer_store_short v25, off, s[0:3], 0 offset:14
	buffer_store_short v97, off, s[0:3], 0 offset:12
	buffer_store_short v72, off, s[0:3], 0 offset:10
.Ltmp841:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v2, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v1, off, s[0:3], 0 offset:8
.Ltmp842:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v3, v6, v10, v118
.Ltmp843:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v3, v3, v115, 1
	.loc	5 624 5                 ; ./amd_buffer_addressing.hpp:624:5
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[1:2], v3, s[20:23], 0 offen
.Ltmp844:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v24, off, s[0:3], 0 offset:8
	buffer_store_short v21, off, s[0:3], 0 offset:14
	buffer_store_short v61, off, s[0:3], 0 offset:12
	buffer_store_short v92, off, s[0:3], 0 offset:10
.Ltmp845:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v2, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v1, off, s[0:3], 0 offset:8
.Ltmp846:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v3, v7, v10, v118
.Ltmp847:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v3, v3, v115, 1
	.loc	5 624 5                 ; ./amd_buffer_addressing.hpp:624:5
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[1:2], v3, s[20:23], 0 offen
.Ltmp848:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v20, off, s[0:3], 0 offset:8
	buffer_store_short v17, off, s[0:3], 0 offset:14
	buffer_store_short v106, off, s[0:3], 0 offset:12
	buffer_store_short v91, off, s[0:3], 0 offset:10
.Ltmp849:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v2, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v1, off, s[0:3], 0 offset:8
	.loc	5 624 5 is_stmt 0       ; ./amd_buffer_addressing.hpp:624:5
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[1:2], v0, s[20:23], 0 offen
.Ltmp850:
	.loc	16 133 38 is_stmt 1     ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v16, off, s[0:3], 0 offset:8
	buffer_store_short v14, off, s[0:3], 0 offset:14
	buffer_store_short v63, off, s[0:3], 0 offset:12
	buffer_store_short v65, off, s[0:3], 0 offset:10
.Ltmp851:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v1, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v0, off, s[0:3], 0 offset:8
.Ltmp852:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v2, v5, v122, v116
.Ltmp853:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v2, v2, v119, 1
	.loc	5 624 5                 ; ./amd_buffer_addressing.hpp:624:5
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[0:1], v2, s[20:23], 0 offen
.Ltmp854:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v13, off, s[0:3], 0 offset:8
	buffer_store_short v12, off, s[0:3], 0 offset:14
	buffer_store_short v68, off, s[0:3], 0 offset:12
	buffer_store_short v48, off, s[0:3], 0 offset:10
.Ltmp855:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v1, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v0, off, s[0:3], 0 offset:8
.Ltmp856:
	.loc	15 85 58                ; ./tensor_descriptor.hpp:85:58
	v_add3_u32 v2, v6, v122, v116
.Ltmp857:
	.loc	5 627 61                ; ./amd_buffer_addressing.hpp:627:61
	v_add_lshl_u32 v2, v2, v119, 1
	.loc	5 624 5                 ; ./amd_buffer_addressing.hpp:624:5
	s_nop 0
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[0:1], v2, s[20:23], 0 offen
.Ltmp858:
	.loc	16 133 38               ; ./threadwise_generic_tensor_slice_copy.hpp:133:38
	buffer_store_short v124, off, s[0:3], 0 offset:8
	buffer_store_short v125, off, s[0:3], 0 offset:14
	buffer_store_short v56, off, s[0:3], 0 offset:12
	buffer_store_short v69, off, s[0:3], 0 offset:10
.Ltmp859:
	.loc	5 624 38                ; ./amd_buffer_addressing.hpp:624:38
	buffer_load_dword v1, off, s[0:3], 0 offset:12
	s_nop 0
	s_nop 0
	buffer_load_dword v0, off, s[0:3], 0 offset:8
.Ltmp860:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_nop 0
.Ltmp861:
	.loc	5 624 5                 ; ./amd_buffer_addressing.hpp:624:5
	s_waitcnt vmcnt(0)
	s_nop 0
	buffer_store_dwordx2 v[0:1], v123, s[20:23], 0 offen
.Ltmp862:
	.loc	11 216 1                ; gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp:216:1
	s_endpgm
.Ltmp863:
	.section	.rodata,#alloc
	.p2align	6
	.amdhsa_kernel gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw
		.amdhsa_group_segment_fixed_size 49152
		.amdhsa_private_segment_fixed_size 232
		.amdhsa_user_sgpr_private_segment_buffer 1
		.amdhsa_user_sgpr_dispatch_ptr 0
		.amdhsa_user_sgpr_queue_ptr 0
		.amdhsa_user_sgpr_kernarg_segment_ptr 1
		.amdhsa_user_sgpr_dispatch_id 0
		.amdhsa_user_sgpr_flat_scratch_init 1
		.amdhsa_user_sgpr_private_segment_size 0
		.amdhsa_system_sgpr_private_segment_wavefront_offset 1
		.amdhsa_system_sgpr_workgroup_id_x 1
		.amdhsa_system_sgpr_workgroup_id_y 0
		.amdhsa_system_sgpr_workgroup_id_z 0
		.amdhsa_system_sgpr_workgroup_info 0
		.amdhsa_system_vgpr_workitem_id 0
		.amdhsa_next_free_vgpr 128
		.amdhsa_next_free_sgpr 43
		.amdhsa_float_round_mode_32 0
		.amdhsa_float_round_mode_16_64 0
		.amdhsa_float_denorm_mode_32 3
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
.Lfunc_end77:
	.size	gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw, .Lfunc_end77-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw
	.file	20 "/nhwc_miopen/build/kevin/miopen-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp-500d-1bac-474f-b3b3/./gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_fp16_bfp16_gnchw_gkcyx_gnkhw.hpp"
	.file	21 "/nhwc_miopen/build/kevin/miopen-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp-500d-1bac-474f-b3b3/./tensor_descriptor_helper.hpp"
	.file	22 "/nhwc_miopen/build/kevin/miopen-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp-500d-1bac-474f-b3b3/./functional2.hpp"
	.file	23 "/nhwc_miopen/build/kevin/miopen-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp-500d-1bac-474f-b3b3/./blockwise_generic_tensor_slice_copy.hpp"
	.file	24 "/nhwc_miopen/build/kevin/miopen-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp-500d-1bac-474f-b3b3/./array.hpp"
	.file	25 "/nhwc_miopen/build/kevin/miopen-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp-500d-1bac-474f-b3b3/./functional3.hpp"
	.file	26 "/nhwc_miopen/build/kevin/miopen-gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.cpp-500d-1bac-474f-b3b3/./functional.hpp"
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 12760
; NumSgprs: 49
; NumVgprs: 128
; NumAgprs: 128
; TotalNumVgprs: 128
; ScratchSize: 232
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 49152 bytes/workgroup (compile time only)
; SGPRBlocks: 6
; VGPRBlocks: 31
; NumSGPRsForWavesPerEU: 49
; NumVGPRsForWavesPerEU: 128
; Occupancy: 2
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 8
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
	.amdgpu_metadata
---
amdhsa.kernels:
  - .args:
      - .address_space:  global
        .offset:         0
        .size:           8
        .value_kind:     global_buffer
        .value_type:     f16
      - .address_space:  global
        .offset:         8
        .size:           8
        .value_kind:     global_buffer
        .value_type:     f16
      - .address_space:  global
        .offset:         16
        .size:           8
        .value_kind:     global_buffer
        .value_type:     f16
      - .offset:         24
        .size:           8
        .value_kind:     hidden_global_offset_x
        .value_type:     i64
      - .offset:         32
        .size:           8
        .value_kind:     hidden_global_offset_y
        .value_type:     i64
      - .offset:         40
        .size:           8
        .value_kind:     hidden_global_offset_z
        .value_type:     i64
      - .address_space:  global
        .offset:         48
        .size:           8
        .value_kind:     hidden_none
        .value_type:     i8
      - .address_space:  global
        .offset:         56
        .size:           8
        .value_kind:     hidden_none
        .value_type:     i8
      - .address_space:  global
        .offset:         64
        .size:           8
        .value_kind:     hidden_none
        .value_type:     i8
      - .address_space:  global
        .offset:         72
        .size:           8
        .value_kind:     hidden_multigrid_sync_arg
        .value_type:     i8
    .group_segment_fixed_size: 49152
    .kernarg_segment_align: 8
    .kernarg_segment_size: 80
    .language:       OpenCL C
    .language_version:
      - 2
      - 0
    .max_flat_workgroup_size: 256
    .name:           gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw
    .private_segment_fixed_size: 232
    .sgpr_count:     49
    .sgpr_spill_count: 0
    .symbol:         gridwise_convolution_backward_data_implicit_gemm_v4r1_xdlops_gnchw_gkcyx_gnkhw.kd
    .vgpr_count:     128
    .vgpr_spill_count: 55
    .wavefront_size: 64
amdhsa.version:
  - 1
  - 0
...

	.end_amdgpu_metadata
;	.section	.debug_line
;.Lline_table_start0:
