// This program was cloned from: https://github.com/habibagamal/SoC_Automation
// License: GNU General Public License v2.0

/*******************************************************************
 *
 * Module: APB2PWM.v
 * Author: mshalan
 * Description: Raptor simple 32-bit PWM APB wrapper with the
                following resisters:
                  + PWMPRE (RW - 16): clock prescalar (tmer_clk = clk / (PRE+1))
                	+ PWMCMP1 (RW - 4): PWM Compare register 1 -- period
                	+ PWMCMP2 (RW - 8): PWM Compare register 1 -- duty cycle
                  + PWMCTRL (RW - 32): bit0: Enable
 **********************************************************************/

module APB2PWM(

    input wire PCLK,
    input wire PRESETn,
    input wire PWRITE,
    input wire [31:0] PWDATA,
    input wire [31:0] PADDR,
    input wire PENABLE,

    input PSEL,

    output wire PREADY,
    output wire [31:0] PRDATA,

    output wire PWMO

);

  reg   [31:0]  PWMCMP1, PWMCMP2, PWMPRE;
  reg   [0:0]   PWMCTRL;

  // TMR PRESCALAR - RO, Addr:16
  always @(posedge PCLK, negedge PRESETn)
  begin
    if(!PRESETn)
    begin
      PWMPRE <= 32'b0;
    end
    else if(PENABLE & PWRITE & PREADY & PSEL & PADDR[4])
      PWMPRE <= PWDATA[31:0];
  end

  // TMR Compare Register 1 - RW, Addr:4
  always @(posedge PCLK, negedge PRESETn)
  begin
    if(!PRESETn)
    begin
      PWMCMP1 <= 32'b0;
    end
    else if(PENABLE & PWRITE & PREADY & PSEL & PADDR[2])
      PWMCMP1 <= PWDATA[31:0];
  end

  // TMR Compare Register 1 - RW, Addr:8
  always @(posedge PCLK, negedge PRESETn)
  begin
    if(!PRESETn)
    begin
      PWMCMP2 <= 32'b0;
    end
    else if(PENABLE & PWRITE & PREADY & PSEL & PADDR[3])
      PWMCMP2 <= PWDATA[31:0];
  end

  // TMR Control Register - RW, Addr:32
  always @(posedge PCLK, negedge PRESETn)
  begin
    if(!PRESETn)
    begin
      PWMCTRL <= 1'b0;
    end
    else if(PENABLE & PWRITE & PREADY & PSEL & PADDR[5])
      PWMCTRL <= PWDATA[0:0];
  end

  assign PRDATA[31:0] = (PADDR[2]) ? {PWMCMP1}           :
                        (PADDR[3]) ? {PWMCMP2}           :
                        (PADDR[4]) ? {PWMPRE}            :
                        (PADDR[5]) ? {31'd0,PWMCTRL}     :
                        32'b0;

  assign PREADY = 1'b1;


  pwm PWM (
    .clk(PCLK),
    .rst(~PRESETn),
    .PRE(PWMPRE),
    .TMRCMP1(PWMCMP1),
  	.TMRCMP2(PWMCMP2),
  	.TMREN(PWMCTRL[0]),
    .pwm(PWMO)
  	);

endmodule