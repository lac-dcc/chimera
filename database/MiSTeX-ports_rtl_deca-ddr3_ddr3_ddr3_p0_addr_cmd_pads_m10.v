// This program was cloned from: https://github.com/MiSTeX-devel/MiSTeX-ports
// License: BSD 3-Clause "New" or "Revised" License

// (C) 2001-2023 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.



`timescale 1 ps / 1 ps

module ddr3_p0_addr_cmd_pads_m10(
    reset_n,
    pll_afi_clk,
    pll_mem_clk,
    pll_mem_clk_ddio,
    pll_write_clk,
    enable_mem_clk,
    phy_ddio_address,
    phy_ddio_cke,
    phy_ddio_cs_n,
    phy_ddio_bank,
    phy_ddio_odt,
    phy_ddio_we_n,
    phy_ddio_ras_n,
    phy_ddio_cas_n,
    phy_mem_bank,
    phy_mem_odt,
    phy_mem_we_n,
    phy_mem_ras_n,
    phy_mem_cas_n,
    phy_ddio_reset_n,
    phy_mem_reset_n,
    phy_mem_address,
    phy_mem_cs_n,
    phy_mem_cke,
    phy_mem_ck,
    phy_mem_ck_n,
    mimic_clock
);

// *****************************************************************
// BEGIN PARAMETER SECTION
// All parameters default to "" will have their values passed in 
// from higher level wrapper with the controller and driver
//Global parameters
parameter DEVICE_FAMILY = "";

// Width of the addr/cmd signals going out to the external memory
parameter MEM_ADDRESS_WIDTH     = ""; 
parameter MEM_CONTROL_WIDTH     = ""; 
parameter INVERT_OUTPUT_CLOCK   = "";
parameter MEM_CHIP_SELECT_WIDTH = ""; 
parameter MEM_CLK_EN_WIDTH      = ""; 

parameter MEM_BANK_WIDTH        = ""; 
parameter MEM_CK_WIDTH          = ""; 
parameter MEM_ODT_WIDTH         = ""; 

// Width of the addr/cmd signals coming in from the AFI
parameter AFI_ADDRESS_WIDTH         = ""; 
parameter AFI_CONTROL_WIDTH         = ""; 
parameter AFI_CHIP_SELECT_WIDTH     = ""; 
parameter AFI_CLK_EN_WIDTH          = ""; 

parameter AFI_BANK_WIDTH            = ""; 
parameter AFI_ODT_WIDTH             = ""; 

// *****************************************************************
// BEGIN PORT SECTION

input   reset_n;
input   pll_afi_clk;
input   pll_mem_clk;
input   pll_mem_clk_ddio;
input   pll_write_clk;
input   [MEM_CK_WIDTH-1:0]              enable_mem_clk;
input   [AFI_ADDRESS_WIDTH-1:0]         phy_ddio_address;
input   [AFI_CHIP_SELECT_WIDTH-1:0]     phy_ddio_cs_n;
input   [AFI_CLK_EN_WIDTH-1:0]          phy_ddio_cke;

output  [MEM_ADDRESS_WIDTH-1:0]         phy_mem_address;
output  [MEM_CHIP_SELECT_WIDTH-1:0]     phy_mem_cs_n;
output  [MEM_CLK_EN_WIDTH-1:0]          phy_mem_cke;
inout   [MEM_CK_WIDTH-1:0]              phy_mem_ck;
inout   [MEM_CK_WIDTH-1:0]              phy_mem_ck_n;
output  mimic_clock;
input   [AFI_BANK_WIDTH-1:0]            phy_ddio_bank;
input   [AFI_ODT_WIDTH-1:0]             phy_ddio_odt;
input   [AFI_CONTROL_WIDTH-1:0]         phy_ddio_ras_n;
input   [AFI_CONTROL_WIDTH-1:0]         phy_ddio_cas_n;
input   [AFI_CONTROL_WIDTH-1:0]         phy_ddio_we_n;

output  [MEM_BANK_WIDTH-1:0]            phy_mem_bank;
output  [MEM_ODT_WIDTH-1:0]             phy_mem_odt;
output  [MEM_CONTROL_WIDTH-1:0]         phy_mem_we_n;
output  [MEM_CONTROL_WIDTH-1:0]         phy_mem_ras_n;
output  [MEM_CONTROL_WIDTH-1:0]         phy_mem_cas_n;
input   [AFI_CONTROL_WIDTH-1:0]         phy_ddio_reset_n;
output                                  phy_mem_reset_n;

// The rest of this file performs HR->FR conversion for HR interfaces, and
// FR-SDR->FR-DDR for protocols that require it.

wire    [MEM_CHIP_SELECT_WIDTH-1:0]     phy_ddio_cs_n_l;
wire    [MEM_CHIP_SELECT_WIDTH-1:0]     phy_ddio_cs_n_h;
wire    [MEM_CLK_EN_WIDTH-1:0]          phy_ddio_cke_l;
wire    [MEM_CLK_EN_WIDTH-1:0]          phy_ddio_cke_h;

wire    [MEM_ADDRESS_WIDTH-1:0]         phy_ddio_address_l;
wire    [MEM_ADDRESS_WIDTH-1:0]         phy_ddio_address_h;
wire    [MEM_BANK_WIDTH-1:0]            phy_ddio_bank_l;
wire    [MEM_BANK_WIDTH-1:0]            phy_ddio_bank_h;
wire    [MEM_ODT_WIDTH-1:0]             phy_ddio_odt_l;
wire    [MEM_ODT_WIDTH-1:0]             phy_ddio_odt_h;
wire    [MEM_CONTROL_WIDTH-1:0]         phy_ddio_ras_n_l;
wire    [MEM_CONTROL_WIDTH-1:0]         phy_ddio_ras_n_h;
wire    [MEM_CONTROL_WIDTH-1:0]         phy_ddio_cas_n_l;
wire    [MEM_CONTROL_WIDTH-1:0]         phy_ddio_cas_n_h;
wire    [MEM_CONTROL_WIDTH-1:0]         phy_ddio_we_n_l;
wire    [MEM_CONTROL_WIDTH-1:0]         phy_ddio_we_n_h;
wire    [MEM_CONTROL_WIDTH-1:0]         phy_ddio_reset_n_l;
wire    [MEM_CONTROL_WIDTH-1:0]         phy_ddio_reset_n_h;

// each signal has a high and a low portion,
// connecting to the high and low inputs of the DDIO_OUT,
// for the purpose of creating double data rate
    assign phy_ddio_cke_l           = phy_ddio_cke[MEM_CLK_EN_WIDTH-1:0];
    assign phy_ddio_cs_n_l          = phy_ddio_cs_n[MEM_CHIP_SELECT_WIDTH-1:0];
    assign phy_ddio_address_l       = phy_ddio_address[MEM_ADDRESS_WIDTH-1:0];
    assign phy_ddio_bank_l          = phy_ddio_bank[MEM_BANK_WIDTH-1:0];
    assign phy_ddio_odt_l           = phy_ddio_odt[MEM_ODT_WIDTH-1:0];
    assign phy_ddio_we_n_l          = phy_ddio_we_n[MEM_CONTROL_WIDTH-1:0];
    assign phy_ddio_ras_n_l         = phy_ddio_ras_n[MEM_CONTROL_WIDTH-1:0];
    assign phy_ddio_cas_n_l         = phy_ddio_cas_n[MEM_CONTROL_WIDTH-1:0];
    assign phy_ddio_reset_n_l       = phy_ddio_reset_n[MEM_CONTROL_WIDTH-1:0];

    assign phy_ddio_cke_h           = phy_ddio_cke[2*MEM_CLK_EN_WIDTH-1:MEM_CLK_EN_WIDTH];
    assign phy_ddio_cs_n_h          = phy_ddio_cs_n[2*MEM_CHIP_SELECT_WIDTH-1:MEM_CHIP_SELECT_WIDTH];
    assign phy_ddio_address_h       = phy_ddio_address[2*MEM_ADDRESS_WIDTH-1:MEM_ADDRESS_WIDTH];
    assign phy_ddio_bank_h          = phy_ddio_bank[2*MEM_BANK_WIDTH-1:MEM_BANK_WIDTH];
    assign phy_ddio_odt_h           = phy_ddio_odt[2*MEM_ODT_WIDTH-1:MEM_ODT_WIDTH];
    assign phy_ddio_we_n_h          = phy_ddio_we_n[2*MEM_CONTROL_WIDTH-1:MEM_CONTROL_WIDTH];
    assign phy_ddio_ras_n_h         = phy_ddio_ras_n[2*MEM_CONTROL_WIDTH-1:MEM_CONTROL_WIDTH];
    assign phy_ddio_cas_n_h         = phy_ddio_cas_n[2*MEM_CONTROL_WIDTH-1:MEM_CONTROL_WIDTH];
    assign phy_ddio_reset_n_h       = phy_ddio_reset_n[2*MEM_CONTROL_WIDTH-1:MEM_CONTROL_WIDTH];

// Generate MUXSEL for ADC 

reg gen_muxsel_r1;
reg gen_muxsel_r2;
reg muxsel;

always @ (posedge pll_mem_clk)
begin
    gen_muxsel_r1 <= reset_n;
    gen_muxsel_r2 <= gen_muxsel_r1;
end

generate
begin: gen_adc_sel
    always @ (posedge pll_mem_clk)
        begin
            if (gen_muxsel_r1 & ~gen_muxsel_r2)
                muxsel <= 1'b0;
            else
                muxsel <= ~muxsel;
        end
end
endgenerate

//if "half_rate_mode = true" in a DDIO_OUT, datain_l is sent out first and datain_h is sent out next
//if "half_rate_mode = false" in a DDIO_OUT, datain_h is sent out first and datain_l is sent out next
//in this file (addr_cmd_pads.v), all the address and command pads are instantiated using altddio_out (i.e. half_rate_mode = false)
//inside io_pads (altdqdqs is used), the output signals to be the memory are sent using 2 layers of DDIO_OUT,
//first layer with half_rate_mode = true and second layer with half_rate_mode = false
//so for all the memory write interface signals, datain_l will be sent out first
//in order to be consistent, address and commands should also follow the same order (i.e. datain_l is sent out first)
//therefore, phy_ddio_*_h is mapped to datain_l and phy_ddio_*_l is mapped to datain_h for all the altddio_out in this file

    genvar i;
    generate
    for (i = 0; i < MEM_ADDRESS_WIDTH; i = i + 1)
    begin :address_gen
        addr_cmd_pad_m10 uaddress_pad (
            .muxsel             (muxsel),
            .pll_afi_clk        (pll_afi_clk),
            .pll_mem_clk        (pll_mem_clk),
            .pll_mem_clk_ddio   (pll_mem_clk_ddio),
            .pll_write_clk      (pll_write_clk),
            .datain_hi          ({phy_ddio_address_h[i], phy_ddio_address_l[i]}),
            .datain_lo          ({phy_ddio_address_h[i], phy_ddio_address_l[i]}),
            .enable             (|enable_mem_clk),
            .pad                (phy_mem_address[i])
        );
        defparam uaddress_pad.INVERT_OUTPUT_CLOCK = INVERT_OUTPUT_CLOCK;
    end
    endgenerate

    generate
    for (i = 0; i < MEM_CHIP_SELECT_WIDTH; i = i + 1)
    begin :cs_n_gen
        addr_cmd_pad_m10 ucs_n_pad (
            .muxsel             (muxsel),
            .pll_afi_clk        (pll_afi_clk),
            .pll_mem_clk        (pll_mem_clk),
            .pll_mem_clk_ddio   (pll_mem_clk_ddio),
            .pll_write_clk      (pll_write_clk),
            .datain_hi          ({phy_ddio_cs_n_h[i], phy_ddio_cs_n_l[i]}),
            .datain_lo          ({phy_ddio_cs_n_h[i], phy_ddio_cs_n_l[i]}),
            .enable             (|enable_mem_clk),
            .pad                (phy_mem_cs_n[i])
        );
        defparam ucs_n_pad.INVERT_OUTPUT_CLOCK = INVERT_OUTPUT_CLOCK;
    end
    endgenerate

    generate
    for (i = 0; i < MEM_CLK_EN_WIDTH; i = i + 1)
    begin :cke_gen
        addr_cmd_pad_m10 ucke_pad (
            .muxsel             (muxsel),
            .pll_afi_clk        (pll_afi_clk),
            .pll_mem_clk        (pll_mem_clk),
            .pll_mem_clk_ddio   (pll_mem_clk_ddio),
            .pll_write_clk      (pll_write_clk),
            .datain_hi          ({phy_ddio_cke_h[i], phy_ddio_cke_l[i]}),
            .datain_lo          ({phy_ddio_cke_h[i], phy_ddio_cke_l[i]}),
            .enable             (1'b1),
            .pad                (phy_mem_cke[i])
        );
        defparam ucke_pad.INVERT_OUTPUT_CLOCK = INVERT_OUTPUT_CLOCK;
        end
        endgenerate


    generate
    for (i = 0; i < MEM_BANK_WIDTH; i = i + 1)
    begin :bank_gen
        addr_cmd_pad_m10 ubank_pad (
            .muxsel             (muxsel),
            .pll_afi_clk        (pll_afi_clk),
            .pll_mem_clk        (pll_mem_clk),
            .pll_mem_clk_ddio   (pll_mem_clk_ddio),
            .pll_write_clk      (pll_write_clk),
            .datain_hi          ({phy_ddio_bank_h[i], phy_ddio_bank_l[i]}),
            .datain_lo          ({phy_ddio_bank_h[i], phy_ddio_bank_l[i]}),
            .enable             (|enable_mem_clk),
            .pad                (phy_mem_bank[i])
        );
        defparam ubank_pad.INVERT_OUTPUT_CLOCK = INVERT_OUTPUT_CLOCK;
    end
    endgenerate

        generate
    for (i = 0; i < MEM_CONTROL_WIDTH; i = i + 1)
    begin :odt_gen
        addr_cmd_pad_m10 uodt_pad (
            .muxsel             (muxsel),
            .pll_afi_clk        (pll_afi_clk),
            .pll_mem_clk        (pll_mem_clk),
            .pll_mem_clk_ddio   (pll_mem_clk_ddio),
            .pll_write_clk      (pll_write_clk),
            .datain_hi          ({phy_ddio_odt_h[i], phy_ddio_odt_l[i]}),
            .datain_lo          ({phy_ddio_odt_h[i], phy_ddio_odt_l[i]}),
            .enable             (|enable_mem_clk),
            .pad                (phy_mem_odt[i])
        );
        defparam uodt_pad.INVERT_OUTPUT_CLOCK = INVERT_OUTPUT_CLOCK;
        end
        endgenerate

    generate
    for (i = 0; i < MEM_CONTROL_WIDTH; i = i + 1)
    begin :we_n_gen
        addr_cmd_pad_m10 uwe_n_pad (
            .muxsel             (muxsel),
            .pll_afi_clk        (pll_afi_clk),
            .pll_mem_clk        (pll_mem_clk),
            .pll_mem_clk_ddio   (pll_mem_clk_ddio),
            .pll_write_clk      (pll_write_clk),
            .datain_hi          ({phy_ddio_we_n_h[i], phy_ddio_we_n_l[i]}),
            .datain_lo          ({phy_ddio_we_n_h[i], phy_ddio_we_n_l[i]}),
            .enable             (|enable_mem_clk),
            .pad                (phy_mem_we_n[i])
        );
        defparam uwe_n_pad.INVERT_OUTPUT_CLOCK = INVERT_OUTPUT_CLOCK;
        end
        endgenerate

    generate
    for (i = 0; i < MEM_CONTROL_WIDTH; i = i + 1)
    begin :ras_n_gen
        addr_cmd_pad_m10 uras_n_pad (
            .muxsel             (muxsel),
            .pll_afi_clk        (pll_afi_clk),
            .pll_mem_clk        (pll_mem_clk),
            .pll_mem_clk_ddio   (pll_mem_clk_ddio),
            .pll_write_clk      (pll_write_clk),
            .datain_hi          ({phy_ddio_ras_n_h[i], phy_ddio_ras_n_l[i]}),
            .datain_lo          ({phy_ddio_ras_n_h[i], phy_ddio_ras_n_l[i]}),
            .enable             (|enable_mem_clk),
            .pad                (phy_mem_ras_n[i])
        );
        defparam uras_n_pad.INVERT_OUTPUT_CLOCK = INVERT_OUTPUT_CLOCK;
        end
        endgenerate

    generate
    for (i = 0; i < MEM_CONTROL_WIDTH; i = i + 1)
    begin :cas_n_gen
        addr_cmd_pad_m10 ucas_n_pad (
            .muxsel             (muxsel),
            .pll_afi_clk        (pll_afi_clk),
            .pll_mem_clk        (pll_mem_clk),
            .pll_mem_clk_ddio   (pll_mem_clk_ddio),
            .pll_write_clk      (pll_write_clk),
            .datain_hi          ({phy_ddio_cas_n_h[i], phy_ddio_cas_n_l[i]}),
            .datain_lo          ({phy_ddio_cas_n_h[i], phy_ddio_cas_n_l[i]}),
            .enable             (|enable_mem_clk),
            .pad                (phy_mem_cas_n[i])
        );
        defparam ucas_n_pad.INVERT_OUTPUT_CLOCK = INVERT_OUTPUT_CLOCK;
        end
        endgenerate

    generate
    for (i = 0; i < MEM_CONTROL_WIDTH; i = i + 1)
    begin :reset_n_gen
        addr_cmd_pad_m10 ureset_n_pad (
            .muxsel             (muxsel),
            .pll_afi_clk        (pll_afi_clk),
            .pll_mem_clk        (pll_mem_clk),
            .pll_mem_clk_ddio   (pll_mem_clk_ddio),
            .pll_write_clk      (pll_write_clk),
            .datain_hi          ({phy_ddio_reset_n_h[i], phy_ddio_reset_n_l[i]}),
            .datain_lo          ({phy_ddio_reset_n_h[i], phy_ddio_reset_n_l[i]}),
            .enable             (1'b1),
            .pad                (phy_mem_reset_n)
        );
        defparam ureset_n_pad.INVERT_OUTPUT_CLOCK = INVERT_OUTPUT_CLOCK;
        end
        endgenerate


  wire    [MEM_CK_WIDTH-1:0] mem_ck;


//An address/cmd CPS was used to generate mem_ck clock. However, this would only work as 
//long as the mem_ck clock has same phase as an address/command clock. If they require 
//different phase setttings (e.g., LPDDR), the fitter cannot merge them and mem_ck cannot 
//be placed in the same DQSLB as the addr/cmd pins. A DQS CPS is now used for mem_ck to 
//make its placement flexible (case:31912). Setting the following parameter to 'true' 
//will turn on the legacy behavior.
localparam USE_ADDR_CMD_CPS_FOR_MEM_CK = "true";


generate
genvar clock_width;
        for (clock_width=0; clock_width<MEM_CK_WIDTH; clock_width=clock_width+1)
        begin: clock_gen

        altera_gpio_lite #(
            .PIN_TYPE                  ("bidir"),
            .SIZE                      (1),
            .REGISTER_MODE             ("ddr"),
            .BUFFER_TYPE               ("pseudo_differential"),
            .ASYNC_MODE                ("none"),
            .SYNC_MODE                 ("none"),
            .BUS_HOLD                  ("false"),
            .OPEN_DRAIN_OUTPUT         ("false"),
            .SET_REGISTER_OUTPUTS_HIGH ("false"),
            .INVERT_OUTPUT             ("false"),
            .INVERT_INPUT_CLOCK        ("false"),
            .INVERT_OUTPUT_CLOCK       ("false"),
            .INVERT_OE_INCLOCK         ("false"),
            .USE_ONE_REG_TO_DRIVE_OE   ("false"),
            .USE_DDIO_REG_TO_DRIVE_OE  ("false"),
            .USE_ADVANCED_DDR_FEATURES ("false"),
            .INVERT_CLKDIV_INPUT_CLOCK ("false"),
            .ENABLE_HR_CLOCK           ("false"),
            .ENABLE_OE_HALF_CYCLE_DELAY("false"),
            .ENABLE_PHASE_INVERT_CTRL_PORT ("false"),
            .ENABLE_PHASE_DETECTOR_FOR_CK  ("true")

        ) umem_ck_pad (
            .sclr                      (1'b0),
            .outclock                  (pll_mem_clk_ddio),
            .din                       ({1'b0, enable_mem_clk[clock_width]}),
            .outclocken                (1'b1),     
            .inclock                   (1'b0),     
            .inclocken                 (1'b0),     
            .fr_clock                  (),         
            .hr_clock                  (),         
            .invert_hr_clock           (1'b0),     
            .phy_mem_clock             (pll_mem_clk_ddio),
            .dout                      (),         
            .pad_io                    (phy_mem_ck[clock_width]),
            .pad_io_b                  (phy_mem_ck_n[clock_width]),
            .pad_in                    (1'b0),     
            .pad_in_b                  (1'b0),     
            .aset                      (1'b0),     
            .aclr                      (1'b0),     
            .oe                        (1'b1),     
            .mimic_clock               (mimic_clock)
        );

    end
endgenerate

endmodule

module addr_cmd_pad_m10 (
        pll_afi_clk,
        pll_mem_clk,
        pll_mem_clk_ddio,
        pll_write_clk,
        muxsel,
        datain_hi,
        datain_lo,
        enable,
        pad
);

parameter INVERT_OUTPUT_CLOCK = "";

input           muxsel;
input            pll_afi_clk;
input            pll_mem_clk;
input            pll_mem_clk_ddio;
input            pll_write_clk;
input [1:0]     datain_hi;
input [1:0]     datain_lo;
input           enable;
output          pad;

wire datain_h;
wire datain_l;

        ddr3_p0_simple_ddio_out_m10    # (
            .DATA_WIDTH (1)
        ) hr_to_fr_lo (
            .hr_clk         (pll_afi_clk),
            .fr_clk         (pll_mem_clk),
            .datain_rise    (datain_hi[1]),
            .datain_fall    (datain_hi[0]),
            .muxsel         (muxsel),
            .dataout        (datain_l)
        );

        ddr3_p0_simple_ddio_out_m10    # (
            .DATA_WIDTH (1)
        ) hr_to_fr_hi (
            .hr_clk         (pll_afi_clk),
            .fr_clk         (pll_mem_clk),
            .datain_rise    (datain_lo[1]),
            .datain_fall    (datain_lo[0]),
            .muxsel         (muxsel),
            .dataout        (datain_h)
        );

        altera_gpio_lite #(
            .PIN_TYPE                  ("output"),
            .SIZE                      (1),
            .REGISTER_MODE             ("ddr"),
            .BUFFER_TYPE               ("single-ended"),
            .ASYNC_MODE                ("none"),
            .SYNC_MODE                 ("none"),
            .BUS_HOLD                  ("false"),
            .OPEN_DRAIN_OUTPUT         ("false"),
            .SET_REGISTER_OUTPUTS_HIGH ("false"),
            .INVERT_OUTPUT             ("false"),
            .INVERT_INPUT_CLOCK        ("false"),
            .INVERT_OUTPUT_CLOCK       (INVERT_OUTPUT_CLOCK),
            .INVERT_OE_INCLOCK         ("false"),
            .USE_ONE_REG_TO_DRIVE_OE   ("false"),
            .USE_DDIO_REG_TO_DRIVE_OE  ("false"),
            .USE_ADVANCED_DDR_FEATURES ("true"),
            .INVERT_CLKDIV_INPUT_CLOCK ("false"),
            .ENABLE_HR_CLOCK           ("false"),
            .ENABLE_OE_HALF_CYCLE_DELAY("false"),
            .ENABLE_PHASE_INVERT_CTRL_PORT ("false"),
            .ENABLE_OE_PORT            ("true")
        ) uadc_pad (
            .sclr                      (1'b0),
            .outclock                  (pll_write_clk),
            .phy_mem_clock             (pll_mem_clk_ddio),
            .din                       ({datain_h, datain_l}),
            .pad_out                   (pad),
            .aclr                      (1'b0),          
            .outclocken                (1'b1),          
            .inclock                   (1'b0),          
            .inclocken                 (1'b0),          
            .fr_clock                  (),              
            .hr_clock                  (),              
            .invert_hr_clock           (1'b0),          
            .dout                      (),              
            .pad_io                    (),              
            .pad_io_b                  (),              
            .pad_in                    (1'b0),          
            .pad_in_b                  (1'b0),          
            .pad_out_b                 (),              
            .aset                      (1'b0),          
            .oe                        (enable)
        );

endmodule

