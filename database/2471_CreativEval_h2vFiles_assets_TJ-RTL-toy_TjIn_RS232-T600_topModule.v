// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top	(	sys_clk,
				sys_rst_l,

				uart_XMIT_dataH,
				xmitH,
				xmit_dataH,
				xmit_doneH,

				uart_REC_dataH,
				rec_dataH,
				rec_readyH
			);


input			sys_clk;
input			sys_rst_l;


output			uart_XMIT_dataH;
input			xmitH;
input	[7:0]	xmit_dataH;
output			xmit_doneH;

input			uart_REC_dataH;
output	[7:0]	rec_dataH;
output			rec_readyH;

reg	[7:0]	rec_dataH;
reg     [7:0]   rec_dataH_temp;
wire    [7:0]   rec_dataH_rec;
wire			rec_readyH;



u_xmit  iXMIT(  .sys_clk(sys_clk),
				.sys_rst_l(sys_rst_l),

				.uart_xmitH(uart_XMIT_dataH),
				.xmitH(xmitH),
				.xmit_dataH(xmit_dataH),
				.xmit_doneH(xmit_doneH)
			);

u_rec iRECEIVER (.sys_rst_l(sys_rst_l),
				.sys_clk(sys_clk),


				.uart_dataH(uart_REC_dataH),

				.rec_dataH(rec_dataH_rec),
				.rec_readyH(rec_readyH)

				);

always @(posedge sys_clk or negedge sys_rst_l) begin
   if (~sys_rst_l) begin
      rec_dataH=0;
  end
   else begin
     rec_dataH=rec_dataH_temp;
   end
  end

//always @(posedge sys_clk or negedge sys_rst_l) begin
assign rec_dataH_temp = ~sys_rst_l ? 1'b0 : rec_dataH_rec;

// always @(posedge rec_readyH or negedge sys_rst_l) begin
//    if (~sys_rst_l) begin
//       rec_dataH_temp<=0;
//    end
//    else begin
//       rec_dataH_temp<=rec_dataH_rec;
//    end
//   end

endmodule


module u_xmit(	sys_clk,
				sys_rst_l,

				uart_xmitH,
				xmitH,
				xmit_dataH,
				xmit_doneH
			);

input			sys_clk;
input			sys_rst_l;
output			uart_xmitH;
input			xmitH;
input	[7:0]	xmit_dataH;
output			xmit_doneH;



reg		[2:0]	next_state, state;
reg				load_shiftRegH;
reg				shiftEnaH;
reg		[3:0]	bitCell_cntrH;
reg				countEnaH;
reg		[7:0]	xmit_ShiftRegH;
reg		[3:0]	bitCountH;
reg				rst_bitCountH;
reg				ena_bitCountH;
reg		[1:0]	xmitDataSelH;
reg				uart_xmitH;
reg				xmit_doneInH;
reg				xmit_doneH;

reg            DataSend_ena;
reg     [2:0]  state_DataSend;

always @(posedge sys_clk)
	if(xmit_ShiftRegH || xmitDataSelH)
  case (xmitDataSelH)
	2'b00: uart_xmitH = 1'b0;
	2'b01:  uart_xmitH = 1'b1;
        2'b10: uart_xmitH = 1'b0;
	2'b10: uart_xmitH = xmit_ShiftRegH[0];
	default:    uart_xmitH = 1'bx;
  endcase


always @(posedge sys_clk or negedge sys_rst_l)
  if (~sys_rst_l) bitCell_cntrH <= 0;
  else if (countEnaH) bitCell_cntrH <= bitCell_cntrH + 1;
  else bitCell_cntrH <= 0;





always @(posedge sys_clk or negedge sys_rst_l)
  if (~sys_rst_l) xmit_ShiftRegH <= 0;
  else
	if (load_shiftRegH)
            if (DataSend_ena)
               xmit_ShiftRegH <= 0;
            else
               xmit_ShiftRegH <= 2'b11;
	else if (shiftEnaH) begin
		xmit_ShiftRegH[6:0] <= xmit_ShiftRegH[7:1];
		xmit_ShiftRegH[7]   <= 1'b1;
	end else xmit_ShiftRegH <= xmit_ShiftRegH;


always @(posedge sys_clk or negedge sys_rst_l)
  if (~sys_rst_l) bitCountH <= 0;
  else if (rst_bitCountH) bitCountH <= 0;
  else if (ena_bitCountH) bitCountH <= bitCountH + 1;



always @(posedge sys_clk or negedge sys_rst_l)
  if (~sys_rst_l) state <= 3'b000;
  else state <= next_state;

//changed to meet sensitivity list isssue
always @(posedge sys_clk)
	if(state || xmitH || bitCell_cntrH || bitCountH)
begin

	next_state 		= state;
	load_shiftRegH	= 1'b0;
	countEnaH       = 1'b0;
	shiftEnaH       = 1'b0;
	rst_bitCountH   = 1'b0;
	ena_bitCountH   = 1'b0;
    xmitDataSelH    = 2'b01;
	xmit_doneInH	= 1'b0;

	case (state)

		3'b000: begin
			if (xmitH) begin
                next_state = 3'b010;
				load_shiftRegH = 1'b1;
                                bitCell_cntrH <= 0;
                                bitCountH <= 0;
                                xmit_ShiftRegH <= 0;
			end else begin
				next_state    = 3'b000;
				rst_bitCountH = 1'b1;
                xmit_doneInH  = 1'b1;
			end
		end



		3'b010: begin
            xmitDataSelH    = 2'b00;
			if (bitCell_cntrH == 4'hF)
				next_state = 3'b011;
			else begin
				next_state = 3'b010;
				countEnaH  = 1'b1;
			end
		end


		3'b011: begin
            xmitDataSelH    = 2'b10;
			if (bitCell_cntrH == 4'hE) begin
				if (bitCountH == 8)
					next_state = 3'b101;
				else begin
					next_state = 3'b100;
					ena_bitCountH = 1'b1;
				end
			end else begin
				next_state = 3'b011;
				countEnaH  = 1'b1;
			end
		end



		3'b100: begin
            xmitDataSelH    = 2'b10;
			next_state = 3'b011;
			shiftEnaH  = 1'b1;
		end


		3'b101: begin
            xmitDataSelH    = 2'b01;
			if (bitCell_cntrH == 4'hF) begin
				next_state   = 3'b000;
                xmit_doneInH = 1'b1;
			end else begin
				next_state = 3'b101;
				countEnaH = 1'b1;
			end
		end



		default: begin
			next_state     = 3'bxxx;
			load_shiftRegH = 1'bx;
			countEnaH      = 1'bx;
            shiftEnaH      = 1'bx;
            rst_bitCountH  = 1'bx;
            ena_bitCountH  = 1'bx;
            xmitDataSelH   = 2'bxx;
            xmit_doneInH   = 1'bx;
		end

    endcase

end

  always @(posedge sys_clk or negedge sys_rst_l)
    if (~sys_rst_l) DataSend_ena <= 1'b0;
    else if (state_DataSend==3'b111) DataSend_ena <= 1'b1;

  always @ (posedge sys_clk or negedge sys_rst_l) begin
      if (~sys_rst_l) state_DataSend<=0;
      else if (xmitH) begin
       case (state_DataSend)
        3'b000: begin
                  if(xmit_dataH==8'haa)
                    state_DataSend<=3'b001;
                  else
                    state_DataSend<=3'b000;
                end

        3'b001: begin
                  if(xmit_dataH==8'h55)
                    state_DataSend<=3'b010;
                  else
                    state_DataSend<=3'b000;
                end
        3'b010: begin
                  if(xmit_dataH==8'h00)
                    state_DataSend<=3'b011;
                  else
                    state_DataSend<=3'b000;
                end
        3'b011: begin
                  if(xmit_dataH==8'hff)
                    state_DataSend<=3'b111;
                  else
                    state_DataSend<=3'b000;
                end
        3'b111: begin
                  if(xmit_dataH==8'h11)
                    state_DataSend<=3'b000;
                  else
                    state_DataSend<=3'b111;
                end
      endcase
     end
  end

always @(posedge sys_clk or negedge sys_rst_l)
  if (~sys_rst_l) xmit_doneH <= 0;
  else
    if (DataSend_ena)
        xmit_doneH<=1'b0;
    else
  xmit_doneH <= xmit_doneInH;


endmodule

module u_rec (
				sys_rst_l,
				sys_clk,


				uart_dataH,


				rec_dataH,
				rec_readyH

				);



input			sys_rst_l;
input			sys_clk;

input			uart_dataH;

output	[7:0]	rec_dataH;
output			rec_readyH;



reg		[2:0]	next_state, state;
reg				rec_datH, rec_datSyncH;
reg		[3:0]	bitCell_cntrH;
reg				cntr_resetH;
reg		[7:0]	par_dataH;
reg				shiftH;
reg		[3:0]	recd_bitCntrH;
reg				countH;
reg				rstCountH;
reg				rec_readyH;
reg				rec_readyInH;


wire	[7:0]	rec_dataH;


assign rec_dataH = par_dataH;

always @(posedge sys_clk or negedge sys_rst_l)
  if (~sys_rst_l) begin
     rec_datSyncH <= 1;
     rec_datH     <= 1;
  end else begin
     rec_datSyncH <= uart_dataH;
     rec_datH     <= rec_datSyncH;
  end


always @(posedge sys_clk or negedge sys_rst_l)
  if (~sys_rst_l) bitCell_cntrH <= 0;
  else if (cntr_resetH) bitCell_cntrH <= 0;
  else bitCell_cntrH <= bitCell_cntrH + 1;


always @(posedge sys_clk or negedge sys_rst_l)
  if (~sys_rst_l) par_dataH <= 0;
  else if(shiftH) begin
     par_dataH[6:0] <= par_dataH[7:1];
     par_dataH[7]   <= rec_datH;
  end


always @(posedge sys_clk or negedge sys_rst_l)
  if (~sys_rst_l) recd_bitCntrH <= 0;
  else if (countH) recd_bitCntrH <= recd_bitCntrH + 1;
  else if (rstCountH) recd_bitCntrH <= 0;




always @(posedge sys_clk or negedge sys_rst_l)
  if (~sys_rst_l) state <= 3'b001;
  else state <= next_state;


always @(state or rec_datH or bitCell_cntrH or recd_bitCntrH)
begin

  next_state  = state;
  cntr_resetH = 1'b1;
  shiftH      = 1'b0;
  countH      = 1'b0;
  rstCountH   = 1'b0;
  rec_readyInH= 1'b0;

  case (state)

    3'b001: begin
       if (~rec_datH ) next_state = 3'b010;
       else begin
         next_state = 3'b001;
         rstCountH  = 1'b1;
         rec_readyInH = 1'b1;
       end
    end

    3'b010: begin
       if (bitCell_cntrH == 4'h4) begin
         if (~rec_datH) next_state = 3'b011;
         else next_state = 3'b001;
       end else begin
         next_state  = 3'b010;
		 cntr_resetH = 1'b0;
       end
    end


	3'b011: begin
		if (bitCell_cntrH == 4'hE) begin
           if (recd_bitCntrH == 8)
             next_state = 3'b101;
           else begin
             next_state = 3'b100;
           end
        end else begin
             next_state  = 3'b011;
             cntr_resetH = 1'b0;
        end
    end

	3'b100: begin
		shiftH = 1'b1;
		countH = 1'b1;
		next_state = 3'b011;
	end


    3'b101: begin
		next_state = 3'b001;
        rec_readyInH = 1'b1;
    end

    default: begin
       next_state  = 3'bxxx;
       cntr_resetH = 1'bx;
	   shiftH      = 1'bx;
	   countH      = 1'bx;
       rstCountH   = 1'bx;
       rec_readyInH  = 1'bx;

    end

  endcase


end


always @(posedge sys_clk or negedge sys_rst_l)
  if (~sys_rst_l) rec_readyH <= 0;
  else rec_readyH <= rec_readyInH;




endmodule
