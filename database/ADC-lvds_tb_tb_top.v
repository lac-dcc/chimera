// This program was cloned from: https://github.com/cjhonlyone/ADC-lvds
// License: GNU General Public License v3.0


`timescale 1ns/1ps

module tb_top; /* this is automatically generated */

	parameter        C_AdcChnls = 2;
	parameter      C_AdcWireInt = 2;
	parameter         C_AdcBits = 16;
	parameter C_AdcBytOrBitMode = 1;
	parameter  C_AdcMsbOrLsbFst = 1;
	
	// clock
	reg  TestClk;
	wire SysClk;
	reg  SysRst;
	
    wire                                   DCLK;
    wire                                   DCLK_90;
    wire                                   FCLK;
    reg [(C_AdcChnls*C_AdcWireInt)-1 : 0] DATA;

	wire                                   TestClk_p_pin;
    wire                                   TestClk_n_pin;
    
	initial begin
		TestClk = 0;
		forever #(5) TestClk = ~TestClk;
	end

    OBUFDS Inst_TestClk_OBUFDS(.I(TestClk),.O(TestClk_p_pin),.OB(TestClk_n_pin));
    wire MMCM_Rst;
    MMCM2 Inst_MMCM
     (
         // Clock in ports
        .CLK_IN1_p(TestClk_p_pin),
        .CLK_IN1_n(TestClk_n_pin),
          // Clock out ports
        .CLK_OUT1(FCLK),
        .CLK_OUT2(DCLK),
        .CLK_OUT3(SysClk),
        .CLK_OUT4(DCLK_90),
          // Status and control signals
        .RESET(1'b0),
        .LOCKED(MMCM_Rst)
     );
     
	// synchronous reset
	
	initial begin
		SysRst <= 0;
		repeat(10)@(posedge SysClk)
		SysRst <= 1;
	end
	
	// (*NOTE*) replace reset, clock, others
	wire                                   DCLK_p_pin;
	wire                                   DCLK_n_pin;
	wire                                   FCLK_p_pin;
	wire                                   FCLK_n_pin;
	wire [(C_AdcChnls*C_AdcWireInt)-1 : 0] DATA_p_pin;
	wire [(C_AdcChnls*C_AdcWireInt)-1 : 0] DATA_n_pin;
	wire                                   SysClk_p_pin;
	wire                                   SysClk_n_pin;

    OBUFDS Inst_SysClk_OBUFDS(.I(SysClk),.O(SysClk_p_pin),.OB(SysClk_n_pin));
	OBUFDS Inst_DCLK_OBUFDS(.I(DCLK_90),.O(DCLK_p_pin),.OB(DCLK_n_pin));
    OBUFDS Inst_FCLK_OBUFDS(.I(FCLK),.O(FCLK_p_pin),.OB(FCLK_n_pin));
    
    genvar i;
    generate
        for (i = 0;i<(C_AdcChnls*C_AdcWireInt);i=i+1)
        begin
            OBUFDS Inst_DATA_OBUFDS(.I(DATA[i]),.O(DATA_p_pin[i]),.OB(DATA_n_pin[i]));
        end
    endgenerate

	top #(
			.C_AdcChnls(C_AdcChnls),
			.C_AdcWireInt(C_AdcWireInt),
			.C_AdcBits(C_AdcBits),
			.C_AdcBytOrBitMode(C_AdcBytOrBitMode),
			.C_AdcMsbOrLsbFst(C_AdcMsbOrLsbFst)
		) inst_top (
			.DCLK_p_pin   (DCLK_p_pin),
			.DCLK_n_pin   (DCLK_n_pin),
			.FCLK_p_pin   (FCLK_p_pin),
			.FCLK_n_pin   (FCLK_n_pin),
			.DATA_p_pin   (DATA_p_pin),
			.DATA_n_pin   (DATA_n_pin),
			.SysClk_p_pin (SysClk_p_pin),
			.SysClk_n_pin (SysClk_n_pin),
			.SysRst       (SysRst)
		);
    
    reg [15:0] Adc_data[8191:0];
    initial begin
        $readmemh("D:\\Adc_data.txt",Adc_data);
    end

    
    reg [13:0] Adc_data_Frame ;
    reg [3:0] Adc_data_Bit;
    wire [13:0] Adc_data_dbg = Adc_data[Adc_data_Frame];
    
    integer ii;
    initial
        begin
        DATA[0] <= 0;
        DATA[1] <= 1;
        DATA[2] <= 0;
        DATA[3] <= 1;
        Adc_data_Frame <= 0;
        Adc_data_Bit <= 0;
        wait (MMCM_Rst == 1);
        
        while(1) begin
            ii <= 0;
            @(posedge FCLK or negedge FCLK);
            DATA[0] <= Adc_data[Adc_data_Frame][0+ii];
            DATA[1] <= Adc_data[Adc_data_Frame][7+ii];
            DATA[2] <= Adc_data_Frame[0+ii];
            DATA[3] <= Adc_data_Frame[7+ii];
            for (ii = 1;ii<7;ii=ii+1) begin
                @(posedge DCLK or negedge DCLK);
                DATA[0] <= Adc_data[Adc_data_Frame][0+ii];
                DATA[1] <= Adc_data[Adc_data_Frame][7+ii];
                DATA[2] <= Adc_data_Frame[0+ii];
                DATA[3] <= Adc_data_Frame[7+ii];
            end
            Adc_data_Frame <= Adc_data_Frame + 1;
        end
    end

endmodule

//(* CORE_GENERATION_INFO = "dcm,clk_wiz_v3_6,{component_name=dcm,use_phase_alignment=true,use_min_o_jitter=false,use_max_i_jitter=false,use_dyn_phase_shift=false,use_inclk_switchover=false,use_dyn_reconfig=false,feedback_source=FDBK_AUTO,primtype_sel=MMCM_ADV,num_out_clk=1,clkin1_period=8.000,clkin2_period=10.000,use_power_down=false,use_reset=true,use_locked=true,use_inclk_stopped=false,use_status=false,use_freeze=false,use_clk_valid=false,feedback_type=SINGLE,clock_mgr_type=MANUAL,manual_override=false}" *)
module MMCM2
 (// Clock in ports
  input         CLK_IN1_p,
  input         CLK_IN1_n,
  // Clock out ports
  output        CLK_OUT1,
  output        CLK_OUT2,
  output        CLK_OUT3,
  output        CLK_OUT4,
  // Status and control signals
  input         RESET,
  output        LOCKED
 );
 
 wire clkin1;
 wire clkout0;
 wire clkout1;
 wire clkout2;
wire clkout3;
 // Input buffering
  //------------------------------------
  IBUFDS clkin1_buf
   (.O (clkin1),
    .I (CLK_IN1_p),
    .IB (CLK_IN1_n));


  // Clocking primitive
  //------------------------------------
  // Instantiation of the MMCM primitive
  //    * Unused inputs are tied off
  //    * Unused outputs are labeled unused
  wire [15:0] do_unused;
  wire        drdy_unused;
  wire        psdone_unused;
  wire        clkfbout;
  wire        clkfbout_buf;
  wire        clkfboutb_unused;
  wire        clkout0b_unused;
  wire        clkout1b_unused;
  wire        clkout2b_unused;
  wire        clkout3_unused;
  wire        clkout3b_unused;
  wire        clkout4_unused;
  wire        clkout5_unused;
  wire        clkout6_unused;
  wire        clkfbstopped_unused;
  wire        clkinstopped_unused;

  MMCME2_ADV
  #(.BANDWIDTH            ("OPTIMIZED"),
    .CLKOUT4_CASCADE      ("FALSE"),
    .COMPENSATION         ("ZHOLD"),
    .STARTUP_WAIT         ("FALSE"),
    .DIVCLK_DIVIDE        (1),
    .CLKFBOUT_MULT_F      (14.000),
    .CLKFBOUT_PHASE       (0.000),
    .CLKFBOUT_USE_FINE_PS ("FALSE"),

    .CLKOUT0_DIVIDE_F     (28.000),
    .CLKOUT0_PHASE        (0.000),
    .CLKOUT0_DUTY_CYCLE   (0.500),
    .CLKOUT0_USE_FINE_PS  ("FALSE"),

    .CLKOUT1_DIVIDE       (4.000),
    .CLKOUT1_PHASE        (0.000),
    .CLKOUT1_DUTY_CYCLE   (0.500),
    .CLKOUT1_USE_FINE_PS  ("FALSE"),

    .CLKOUT2_DIVIDE       (14.000),
    .CLKOUT2_PHASE        (0.000),
    .CLKOUT2_DUTY_CYCLE   (0.500),
    .CLKOUT2_USE_FINE_PS  ("FALSE"),

    .CLKOUT3_DIVIDE       (4.000),
    .CLKOUT3_PHASE        (90.000),
    .CLKOUT3_DUTY_CYCLE   (0.500),
    .CLKOUT3_USE_FINE_PS  ("FALSE"),
    
    .CLKIN1_PERIOD        (10.000),
    .REF_JITTER1          (0.010))
  mmcm_adv_inst
    // Output clocks
   (.CLKFBOUT            (clkfbout),
    .CLKFBOUTB           (clkfboutb_unused),
    .CLKOUT0             (clkout0),
    .CLKOUT0B            (clkout0b_unused),
    .CLKOUT1             (clkout1),
    .CLKOUT1B            (clkout1b_unused),
    .CLKOUT2             (clkout2),
    .CLKOUT2B            (clkout2b_unused),
    .CLKOUT3             (clkout3),
    .CLKOUT3B            (clkout3b_unused),
    .CLKOUT4             (clkout4_unused),
    .CLKOUT5             (clkout5_unused),
    .CLKOUT6             (clkout6_unused),
     // Input clock control
    .CLKFBIN             (clkfbout_buf),
    .CLKIN1              (clkin1),
    .CLKIN2              (1'b0),
     // Tied to always select the primary input clock
    .CLKINSEL            (1'b1),
    // Ports for dynamic reconfiguration
    .DADDR               (7'h0),
    .DCLK                (1'b0),
    .DEN                 (1'b0),
    .DI                  (16'h0),
    .DO                  (do_unused),
    .DRDY                (drdy_unused),
    .DWE                 (1'b0),
    // Ports for dynamic phase shift
    .PSCLK               (1'b0),
    .PSEN                (1'b0),
    .PSINCDEC            (1'b0),
    .PSDONE              (psdone_unused),
    // Other control and status signals
    .LOCKED              (LOCKED),
    .CLKINSTOPPED        (clkinstopped_unused),
    .CLKFBSTOPPED        (clkfbstopped_unused),
    .PWRDWN              (1'b0),
    .RST                 (RESET));

  // Output buffering
  //-----------------------------------
  BUFG clkf_buf
   (.O (clkfbout_buf),
    .I (clkfbout));

  BUFG clkout1_buf
   (.O   (CLK_OUT1),
    .I   (clkout0));

  BUFG clkout2_buf
   (.O   (CLK_OUT2),
    .I   (clkout1));

  BUFG clkout3_buf
   (.O   (CLK_OUT3),
    .I   (clkout2));

  BUFG clkout4_buf
   (.O   (CLK_OUT4),
    .I   (clkout3));
    
endmodule
