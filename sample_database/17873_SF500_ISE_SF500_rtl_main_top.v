// This program was cloned from: https://github.com/jbilander/SF500
// License: Creative Commons Attribution Share Alike 4.0 International

`timescale 1ns / 1ps

module main_top(
	input SW1,
	input JP2,
	input JP4,
	input C7M,
	input C14M,
	input RESET_n,
	input CFGIN_n,
	input [23:16] A_HIGH,
	input A12,
	input A13,
	input [6:1] A_LOW,
	input RW_n,
	input UDS_n,
	input LDS_n,
	input VPA_n,
	input [2:0] FC,
	input AS_CPU_n,
	input DTACK_MB_n,
	input BGACK_n,
	input BG_n,
	input HALT_n,
	output CFGOUT_n,
	output CLKCPU,
	output E,
	output VMA_n,
	output OE_BANK0_n,
	output OE_BANK1_n,
	output WE_BANK0_ODD_n,
	output WE_BANK1_ODD_n,
	output WE_BANK0_EVEN_n,
	output WE_BANK1_EVEN_n,
	output ROM_OE_n,
	output IDE_IOR_n,
	output IDE_IOW_n,
	output [1:0] IDE_CS_n,
	inout [15:12] D,
	inout DTACK_CPU_n,
	inout AS_MB_n
);

reg as_n = 1'b1;	// Address Strobe from CPU or Motherboard (other bus master e.g. A590)
reg as_mobo_n = 1'b1;
reg dmareq_n = 1'b1;
reg cpu_speed_switch = 1'b1;

wire [7:5] base_ram;	// base address for the RAM_CARD in Z2-space. (A23-A21)
wire [7:0] base_ide;	// base address for the IDE_CARD in Z2-space. (A23-A16)

wire ram_configured_n;	// keeps track if RAM_CARD is autoconfigured ok.
wire ram_access;	// keeps track if local SRAM is being accessed.
wire ide_configured_n;	// keeps track if IDE_CARD is autoconfigured ok.
wire ide_access;	// keeps track if the IDE is being accessed.

wire ds_n = LDS_n & UDS_n;	//Data Strobe
wire fast_dtack_n = !AS_CPU_n && (ram_access || ide_access) ? 1'b0 : 1'b1;

wire m6800_dtack_n;
wire dtack_n = DTACK_MB_n & m6800_dtack_n & fast_dtack_n;
wire dma_n = dmareq_n && BGACK_n && HALT_n;


//Fast Rise Time Method of Driving 5V, drive to 3V3 then High-Z and let 1k pull-up do the rest
assign DTACK_CPU_n = ((dtack_n & DTACK_CPU_n) == 1'b0) ? dtack_n : 1'bZ; 

assign CLKCPU = cpu_speed_switch ? C7M : C14M;
assign AS_MB_n = as_mobo_n;


always @(posedge C14M) begin

	//Wait until bus-cycle has reached (S7) before hot-switching to new cpu speed
	if (AS_CPU_n && dtack_n) begin
		cpu_speed_switch <= SW1;
	end

	//Bus arbitration: BG_n = 0 and wait for current cycle to complete, AS_n = 1, DTACK_n = 1, (BGACK_n = 1).
	//2-Wire Bus Arbitration: External device takes control on BG_n = 0 and relinquish bus by negating BR_n, CPU then negates BG_n.
	//3-Wire Bus Arbitration: External device will set BGACK_n = 0 to take control of bus and relinquish bus by negating BGACK_n
	if (!BG_n) begin
		if (AS_CPU_n && dtack_n) begin
			dmareq_n <= 1'b0; 
		end 
	end else begin
		dmareq_n <= 1'b1; 
	end
	
	as_mobo_n <= dma_n ? AS_CPU_n : 1'bZ;
	as_n <= dma_n ? AS_CPU_n : AS_MB_n;
	
end

m6800 m6800_bus(
	.C7M(C7M),
	.RESET_n(RESET_n),
	.VPA_n(VPA_n),
	.CPUSPACE(&FC),
	.AS_CPU_n(AS_CPU_n),
	.E(E),
	.VMA_n(VMA_n),
	.M6800_DTACK_n(m6800_dtack_n)
);

autoconfig_zii autoconfig(
	.C7M(C7M),
	.CFGIN_n(CFGIN_n),
	.JP2(JP2),
	.JP4(JP4),
	.AS_CPU_n(AS_CPU_n),
	.RESET_n(RESET_n),
	.DS_n(ds_n),
	.RW_n(RW_n),
	.A_HIGH(A_HIGH[23:16]),
	.A_LOW(A_LOW[6:1]),
	.D(D[15:12]),
	.BASE_RAM(base_ram[7:5]),
	.BASE_IDE(base_ide[7:0]),
	.RAM_CONFIGURED_n(ram_configured_n),
	.IDE_CONFIGURED_n(ide_configured_n),
	.CFGOUT_n(CFGOUT_n)
);

fastram ramcontrol(
	.A(A_HIGH[23:21]),
	.JP2(JP2),
	.RW_n(RW_n),
	.UDS_n(UDS_n),
	.LDS_n(LDS_n),
	.AS_n(as_n),
	.DS_n(ds_n),
	.BASE_RAM(base_ram[7:5]),
	.RAM_CONFIGURED_n(ram_configured_n),
	.OE_BANK0_n(OE_BANK0_n),
	.OE_BANK1_n(OE_BANK1_n),
	.WE_BANK0_ODD_n(WE_BANK0_ODD_n),
	.WE_BANK1_ODD_n(WE_BANK1_ODD_n),
	.WE_BANK0_EVEN_n(WE_BANK0_EVEN_n),
	.WE_BANK1_EVEN_n(WE_BANK1_EVEN_n),
	.RAM_ACCESS(ram_access)
);

ata idecontrol(
	.C14M(C14M),
	.RESET_n(RESET_n),
	.A_HIGH(A_HIGH[23:16]),
	.A12(A12),
	.A13(A13),
	.RW_n(RW_n),
	.AS_CPU_n(AS_CPU_n),
	.BASE_IDE(base_ide[7:0]),
	.IDE_CONFIGURED_n(ide_configured_n),
	.ROM_OE_n(ROM_OE_n),
	.IDE_IOR_n(IDE_IOR_n),
	.IDE_IOW_n(IDE_IOW_n),
	.IDE_CS_n(IDE_CS_n[1:0]),
	.IDE_ACCESS(ide_access)
);

endmodule
