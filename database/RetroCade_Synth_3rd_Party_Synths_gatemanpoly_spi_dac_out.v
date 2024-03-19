// spi_dac_out.v: spi dac driver for Spartan 3E starter kit
// 2006-06-21 E. Brombaugh
//
// Published on www.fpga.synth.net with permission
//
// 2007-11-14 Modified by Scott Gravenhorst to accept a value which defines
//            the number of no-operation cycles to include after the SPI
//            conversation terminates.  This will effectively alter the sample
//            rate and the pitch of the synthesizer.

module spi_dac_out(clk, reset, spi_sck, spi_sdo, spi_dac_cs, ena_out, deltaS_out, data_in, cycles);
	input clk;
	input reset;
	output spi_sck;
	output spi_sdo;
	output spi_dac_cs;
	output ena_out;
	output deltaS_out;
	input [11:0] data_in;
	input [11:0] cycles;             // total number of clocks between each DAC ena
  
	wire [3:0] cmd = 4'b0011;	// write & update
	wire [3:0] add = 4'b0000;	// DAC A
	
  wire [11:0] cycles;
  
	// SPI_sck      = 0      Clock is Low (required)
	// SPI_dac_cs   = 1      Deselect D/A

dac delta_sigma (
    .DACout(deltaS_out), 
    .DACin(data_in), 
    .Clk(clk), 
    .Reset(reset)
    );
	
	// SPI clock is system clock/2
	reg half_clk;
	always @ ( posedge clk )
		if ( reset )
			half_clk <= 1'b0;
		else
			half_clk <= ~half_clk;
	
	// synchronous counter sequences the spi bits
  reg [11:0] state, next_state;    // extended to allow longer delay
	
  always @ ( posedge clk) 
		if ( reset )
			state <= 12'd0;
		else
			if ( half_clk )
				state <= next_state;
	
	reg ck_ena = 1'b1;
  reg sdo;
  reg dac_cs = 1'b0;
	
	// compute next state and spi outputs
	always @ ( state or cycles )    // 'or cycles' added by SRG.  Eliminates an XST warning and does not change the functionality
	begin
		next_state <= state + 1;
		
		case ( state )
			12'd0:	// 1st cycle: CS high
        begin
				ck_ena <= 1'b0;
				dac_cs <= 1'b1;
        end
			
      12'd1:  begin ck_ena <= 1'b1; dac_cs <= 1'b0; end
      12'd2:  begin ck_ena <= 1'b1; dac_cs <= 1'b0; end
      12'd3:  begin ck_ena <= 1'b1; dac_cs <= 1'b0; end
      12'd4:  begin ck_ena <= 1'b1; dac_cs <= 1'b0; end
      12'd5:  begin ck_ena <= 1'b1; dac_cs <= 1'b0; end
      12'd6:  begin ck_ena <= 1'b1; dac_cs <= 1'b0; end
      12'd7:  begin ck_ena <= 1'b1; dac_cs <= 1'b0; end
      12'd8:  begin ck_ena <= 1'b1; dac_cs <= 1'b0; end
      12'd9:  begin ck_ena <= 1'b1; dac_cs <= 1'b0; end
      12'd10: begin ck_ena <= 1'b1; dac_cs <= 1'b0; end
      12'd11: begin ck_ena <= 1'b1; dac_cs <= 1'b0; end
      12'd12: begin ck_ena <= 1'b1; dac_cs <= 1'b0; end
      12'd13: begin ck_ena <= 1'b1; dac_cs <= 1'b0; end
      12'd14: begin ck_ena <= 1'b1; dac_cs <= 1'b0; end
      12'd15: begin ck_ena <= 1'b1; dac_cs <= 1'b0; end
      12'd16: begin ck_ena <= 1'b1; dac_cs <= 1'b0; end
      12'd17: begin ck_ena <= 1'b1; dac_cs <= 1'b0; end
      12'd18: begin ck_ena <= 1'b1; dac_cs <= 1'b0; end
      12'd19: begin ck_ena <= 1'b1; dac_cs <= 1'b0; end
      12'd20: begin ck_ena <= 1'b1; dac_cs <= 1'b0; end
      12'd21: begin ck_ena <= 1'b1; dac_cs <= 1'b0; end
      12'd22: begin ck_ena <= 1'b1; dac_cs <= 1'b0; end
      12'd23: begin ck_ena <= 1'b1; dac_cs <= 1'b0; end
      12'd24: begin ck_ena <= 1'b1; dac_cs <= 1'b0; end

      12'd25: begin ck_ena <= 1'b0; dac_cs <= 1'b1; end        
        
      default:
        begin
        if ( state == cycles ) next_state <= 12'd0;
        end
        
		endcase
	end
	
	// Data register
	reg [23:0] ser_reg;
	always @ ( posedge clk )
		if( ck_ena )
		  begin
			if ( half_clk == 1'b1 )
				ser_reg <= {ser_reg[22:0],1'b0};
		  end
		else
      begin
			ser_reg <= {cmd,add,data_in,4'h0};
      end
	
	// Output registers
	reg spi_sck, spi_sdo, spi_dac_cs, ena_out;
	always @ ( posedge clk )
	begin
		spi_sck <= half_clk & ck_ena;
		spi_sdo <= ser_reg[23];
		spi_dac_cs <= dac_cs;
	end		

  reg ck_ena_old = 1'b0;
  always @ ( posedge clk )
    begin
    ck_ena_old <= ck_ena;
    
    if ( (ck_ena_old ^ ck_ena) == 1'b1 && ck_ena == 1'b0 ) ena_out <= 1'b1;
    else                                                   ena_out <= 1'b0;
    
    end
endmodule
