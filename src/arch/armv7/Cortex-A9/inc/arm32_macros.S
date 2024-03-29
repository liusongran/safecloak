/* SPDX-License-Identifier: BSD-2-Clause */
/*
 * Copyright (c) 2014, STMicroelectronics International N.V.
 */

	/* Please keep them sorted based on the CRn register */


/** system control registers when CRn is c0*/
	.macro read_midr reg	@ Read main ID register
	mrc     p15, 0, \reg, c0, c0, 0
	.endm

	.macro read_ctr reg		@ Read cache type register 
	mrc	p15, 0, \reg, c0, c0, 1
	.endm

	.macro read_mpidr reg	@ Read multi-processor affinity register
	mrc	p15, 0, \reg, c0, c0, 5
	.endm

	.macro read_idpfr1 reg	@ Read processor feature register1
	mrc	p15, 0, \reg, c0, c1, 1
	.endm


/** system control registers when CRn is c1*/
	.macro read_sctlr reg	@ System Control Register
	mrc	p15, 0, \reg, c1, c0, 0
	.endm

	.macro write_sctlr reg	
	mcr	p15, 0, \reg, c1, c0, 0
	.endm

	.macro write_actlr reg	@ Auxiliary Control Register
	mcr	p15, 0, \reg, c1, c0, 1
	.endm

	.macro read_actlr reg	
	mrc	p15, 0, \reg, c1, c0, 1
	.endm

	.macro write_cpacr reg	@ Coprocessor access control register
	mcr	p15, 0, \reg, c1, c0, 2
	.endm

	.macro read_cpacr reg	
	mrc	p15, 0, \reg, c1, c0, 2
	.endm

	.macro read_scr reg		@ Secure Configuration Register
	mrc	p15, 0, \reg, c1, c1, 0
	.endm

	.macro write_scr reg
	mcr	p15, 0, \reg, c1, c1, 0
	.endm

	.macro write_nsacr reg	@ Non-secure access control register
	mcr	p15, 0, \reg, c1, c1, 2
	.endm

	.macro read_nsacr reg
	mrc	p15, 0, \reg, c1, c1, 2
	.endm


/** system control registers when CRn is c2*/
	.macro write_ttbr0 reg
	mcr	p15, 0, \reg, c2, c0, 0
	.endm

	.macro write_ttbr0_64bit reg0, reg1
	mcrr	p15, 0, \reg0, \reg1, cr2
	.endm

	.macro read_ttbr0 reg
	mrc	p15, 0, \reg, c2, c0, 0
	.endm

	.macro read_ttbr0_64bit reg0, reg1
	mrrc	p15, 0, \reg0, \reg1, cr2
	.endm

	.macro write_ttbr1 reg
	mcr	p15, 0, \reg, c2, c0, 1
	.endm

	.macro read_ttbr1 reg
	mrc	p15, 0, \reg, c2, c0, 1
	.endm

	.macro write_ttbcr reg
	mcr	p15, 0, \reg, c2, c0, 2
	.endm

	.macro read_ttbcr reg
	mrc	p15, 0, \reg, c2, c0, 2
	.endm


/** system control registers when CRn is c3*/
	.macro write_dacr reg
	mcr	p15, 0, \reg, c3, c0, 0
	.endm

	.macro read_dacr reg
	mrc	p15, 0, \reg, c3, c0, 0
	.endm


/** system control registers when CRn is c5*/
	.macro read_dfsr reg
	mrc	p15, 0, \reg, c5, c0, 0
	.endm


/** system control registers when CRn is c7*/
	.macro write_icialluis
	/*
	 * Invalidate all instruction caches to PoU, Inner Shareable
	 * (register ignored)
	 */
	mcr	p15, 0, r0, c7, c1, 0
	.endm

	.macro write_bpiallis
	/*
	 * Invalidate entire branch predictor array, Inner Shareable
	 * (register ignored)
	 */
	mcr	p15, 0, r0, c7, c1, 6
	.endm

	.macro write_iciallu
	/* Invalidate all instruction caches to PoU (register ignored) */
	mcr	p15, 0, r0, c7, c5, 0
	.endm

	.macro write_icimvau reg
	/* Instruction cache invalidate by MVA */
	mcr	p15, 0, \reg, c7, c5, 1
	.endm

	.macro write_bpiall
	/* Invalidate entire branch predictor array (register ignored) */
	mcr	p15, 0, r0, c7, c5, 6
	.endm

	.macro write_dcimvac reg
	/* Data cache invalidate by MVA */
	mcr	p15, 0, \reg, c7, c6, 1
	.endm

	.macro write_dcisw reg
	/* Data cache invalidate by set/way */
	mcr	p15, 0, \reg, c7, c6, 2
	.endm

	.macro write_dccmvac reg
	/* Data cache clean by MVA */
	mcr	p15, 0, \reg, c7, c10, 1
	.endm

	.macro write_dccsw reg
	/* Data cache clean by set/way */
	mcr	p15, 0, \reg, c7, c10, 2
	.endm

	.macro write_dccimvac reg
	/* Data cache invalidate by MVA */
	mcr	p15, 0, \reg, c7, c14, 1
	.endm

	.macro write_dccisw reg
	/* Data cache clean and invalidate by set/way */
	mcr	p15, 0, \reg, c7, c14, 2
	.endm


/** system control registers when CRn is c8*/
	.macro write_tlbiall
	/* Invalidate entire unified TLB (register ignored) */
	mcr	p15, 0, r0, c8, c7, 0
	.endm

	.macro write_tlbiallis
	/* Invalidate entire unified TLB Inner Sharable (register ignored) */
	mcr	p15, 0, r0, c8, c3, 0
	.endm

	.macro write_tlbiasidis reg
	/* Invalidate unified TLB by ASID Inner Sharable */
	mcr	p15, 0, \reg, c8, c3, 2
	.endm

	.macro write_tlbimvaais reg
	/* Invalidate unified TLB by MVA all ASID Inner Sharable */
	mcr	p15, 0, \reg, c8, c3, 3
	.endm


/** system control registers when CRn is c10*/
	.macro write_prrr reg
	mcr	p15, 0, \reg, c10, c2, 0
	.endm

	.macro read_prrr reg
	mrc	p15, 0, \reg, c10, c2, 0
	.endm

	.macro write_nmrr reg
	mcr	p15, 0, \reg, c10, c2, 1
	.endm

	.macro read_nmrr reg
	mrc	p15, 0, \reg, c10, c2, 1
	.endm


/** system control registers when CRn is c12*/
	.macro read_vbar reg	@ Vector Base Address Register
	mrc	p15, 0, \reg, c12, c0, 0
	.endm

	.macro write_vbar reg
	mcr	p15, 0, \reg, c12, c0, 0
	.endm

	.macro write_mvbar reg	@ Monitor Vector Base Address Register
	mcr	p15, 0, \reg, c12, c0, 1
	.endm

	.macro read_mvbar reg
	mrc	p15, 0, \reg, c12, c0, 1
	.endm


/** system control registers when CRn is c13*/
	.macro write_fcseidr reg
	mcr	p15, 0, \reg, c13, c0, 0
	.endm

	.macro read_fcseidr reg
	mrc	p15, 0, \reg, c13, c0, 0
	.endm

	.macro write_contextidr reg
	mcr	p15, 0, \reg, c13, c0, 1
	.endm

	.macro read_contextidr reg
	mrc	p15, 0, \reg, c13, c0, 1
	.endm

	.macro write_tpidruro reg
	mcr	p15, 0, \reg, c13, c0, 3
	.endm

	.macro read_tpidruro reg
	mrc	p15, 0, \reg, c13, c0, 3
	.endm

	.macro write_tpidrprw reg
	mcr	p15, 0, \reg, c13, c0, 4
	.endm

	.macro read_tpidrprw reg
	mrc	p15, 0, \reg, c13, c0, 4
	.endm

	.macro write_cntvoff reg0, reg1
	mcrr  p15, 4, \reg0, \reg1, c14
	.endm

	.macro read_clidr reg
	/* Cache Level ID Register */
	mrc	p15, 1, \reg, c0, c0, 1
	.endm

	.macro read_ccsidr reg
	/* Cache Size ID Registers */
	mrc	p15, 1, \reg, c0, c0, 0
	.endm

	.macro write_csselr reg
	/* Cache Size Selection Register */
	mcr	p15, 2, \reg, c0, c0, 0
	.endm

	.macro mov_imm reg, val
		.if ((\val) & 0xffff0000) == 0
			movw	\reg, #(\val)
		.else
			movw	\reg, #((\val) & 0xffff)
			movt	\reg, #((\val) >> 16)
		.endif
	.endm

	
/** arm32_macros_cortex_a9.S */
	.macro write_pcr reg
	mcr  p15, 0, \reg, c15, c0, 0
	.endm

	.macro read_pcr reg
	mrc  p15, 0, \reg, c15, c0, 0
	.endm

	.macro write_diag reg
	mcr  p15, 0, \reg, c15, c0, 1
	.endm

	.macro read_diag reg
	mrc  p15, 0, \reg, c15, c0, 1
	.endm

