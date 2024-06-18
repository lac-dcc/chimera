// This program was cloned from: https://github.com/DangerousPrototypes/BusPirateUltraHDL
// License: GNU General Public License v3.0

//------------------------------------------------------------------
//-- Bus Pirate peripheral tests
//--
//-- sram interface test
//------------------------------------------------------------------



module top #(
  parameter MC_DATA_WIDTH = 16,
  parameter MC_ADD_WIDTH = 6
) (
  input wire clock,
  input wire reset,
  input wire mc_oe, mc_ce, mc_we,
  input wire [MC_ADD_WIDTH-1:0] mc_add,
  inout wire [MC_DATA_WIDTH-1:0] mc_data

);

	// Tristate pin handling
	// Memory controller interface
	wire [MC_DATA_WIDTH-1:0] mc_din;
  reg [MC_DATA_WIDTH-1:0] mc_dout_d;
  wire [MC_DATA_WIDTH-1:0] mc_dout;
  assign mc_dout=mc_dout_d;


	// memory regs
	reg [MC_DATA_WIDTH-1:0] SRAM [32:0];
	initial begin
		SRAM[6'b00000] <= 16'b0101101001011010;				// test values
		SRAM[6'b00001] <= 16'b1010010110100101;
		SRAM[6'b00010] <= 16'b0101101001011010;
		SRAM[6'b00011] <= 16'b1010010110100101;
		SRAM[6'b00100] <= 16'b0101101001011010;
		SRAM[6'b00101] <= 16'b1010010110100101;
		SRAM[6'b00110] <= 16'b0101101001011010;
		SRAM[6'b00111] <= 16'b1010010110100101;
		SRAM[6'b01000] <= 16'b0101101001011010;
		SRAM[6'b01001] <= 16'b1010010110100101;
		SRAM[6'b01010] <= 16'b0101101001011010;
		SRAM[6'b01011] <= 16'b1010010110100101;
		SRAM[6'b01100] <= 16'b0101101001011010;
		SRAM[6'b01101] <= 16'b1010010110100101;
		SRAM[6'b01110] <= 16'b0101101001011010;
		SRAM[6'b01111] <= 16'b1010010110100101;
		SRAM[6'b10000] <= 16'b0101101001011010;
		SRAM[6'b10001] <= 16'b1010010110100101;
		SRAM[6'b10010] <= 16'b0101101001011010;
		SRAM[6'b10011] <= 16'b1010010110100101;
		SRAM[6'b10100] <= 16'b0101101001011010;
		SRAM[6'b10101] <= 16'b1010010110100101;
		SRAM[6'b10110] <= 16'b0101101001011010;
		SRAM[6'b10111] <= 16'b1010010110100101;
		SRAM[6'b11000] <= 16'b0101101001011010;
		SRAM[6'b11001] <= 16'b1010010110100101;
		SRAM[6'b11010] <= 16'b0101101001011010;
		SRAM[6'b11011] <= 16'b1010010110100101;
		SRAM[6'b11100] <= 16'b0101101001011010;
		SRAM[6'b11101] <= 16'b1010010110100101;
		SRAM[6'b11110] <= 16'b0101101001011010;
		SRAM[6'b11111] <= 16'b1010010110100101;
	end

	always @(negedge clock)
		begin
			if ((mc_we == 1'b0) && (mc_oe==1'b1))			// write (proper)
			begin
				SRAM [mc_add] <= mc_din; //16'hFFFF;
			end
      else if ((mc_we == 1'b0)&& (mc_oe==1'b0))			// write (OE not toggled)
      begin
        SRAM [mc_add] <= 16'hffff; //mc_din; //16'hFFFF;
      end
			else if ((mc_we == 1'b1) && mc_oe==1'b0)		// read
			begin
				mc_dout_d <= SRAM [mc_add];
			end
      else
      begin
      mc_dout_d <= 16'h00ff;
      end
	end



    //define the tristate data pin explicitly in the top module

    // Memory controller data pins
    SB_IO #(
      .PIN_TYPE(6'b1010_01),
      .PULLUP(1'b0)
    ) mc_io [MC_DATA_WIDTH-1:0] (
      .PACKAGE_PIN(mc_data),
      .OUTPUT_ENABLE(!mc_oe),
      .D_OUT_0(mc_dout),
      .D_IN_0(mc_din)
    );

endmodule
