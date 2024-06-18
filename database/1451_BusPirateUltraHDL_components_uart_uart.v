// This program was cloned from: https://github.com/DangerousPrototypes/BusPirateUltraHDL
// License: GNU General Public License v3.0




module top (
rst,
clk,
go,
txbusy,
txdata,
rxdata,
txd,
rxd,
frameerror
);

input rst;
input clk;
input go;
output reg txbusy;
input [7:0] txdata;
output reg [7:0]rxdata;
output reg txd;
input rxd;
output reg frameerror;

// internals
reg [3:0] txbitcount;
reg [1:0] txstate;
reg [1:0] txdivider;

reg [3:0] rxbitcount;
reg [1:0] rxstate;
reg [2:0] rxdivider;

reg lastrxd;

// transmit logic
always @ (posedge clk or posedge rst)
if (rst)
begin
	txd <= 1'b1;
	txbusy <= 1'b0;
	txstate <= 2'b0;
	txdivider <= 2'b0;
	frameerror <= 1'b0;
end
else
begin
	if(txstate==2'b00)							// wait for go
	begin
		if(go == 1'b1)
		begin
			txstate <= 2'b01;
			txbitcount <= 4'd8;
			txdivider <= 2'b00;
		end
	end
	
	if((txdivider == 2'b00)&&(txstate!=2'b00))
	begin
		case (txstate)
		2'b00:	begin							// isn't handled here
				end
		2'b01:	begin							// startbit
					txd <= 1'b0;
					txstate <= 2'b10;
				end
		2'b10:	begin							// 8 bit
					if(txbitcount == 3'b0)
					begin
						txstate <= 2'b11;	
					end
					else
					begin
						txd <= txdata[txbitcount-1];
						txbitcount <= txbitcount-1;
					end
				end
		2'b11:	begin							// stopbit
					txd <= 1'b1;
					txstate <= 2'b00;
				end
		endcase
		txdivider <= txdivider+1;
	end
	else
	begin
		txdivider <= txdivider+1;
	end

	txbusy <= (txstate>0);
end

// rx logic
always @ (posedge clk or posedge rst)
if (rst)
begin
	rxstate <= 2'b0;
	rxdivider <= 2'b0;
	lastrxd <= rxd;
end
else
begin
	if(rxstate==2'b00)
	begin
		if((lastrxd==1'b1)&&(rxd==1'b0))
		begin
			rxstate<=2'b01;
			rxdivider<=3'd4;
			rxbitcount<=4'd8;
			frameerror<=1'b0;
		end
	end
	else
	begin
	if((rxdivider == 3'b000)&&(rxstate!=2'b00))
	begin
		case (rxstate)
		2'b00:	begin							// isn't handled here
				end
		2'b01:	begin							// startbit
					rxstate <= 2'b10;
				end
		2'b10:	begin							// 8 bit
					if(rxbitcount == 3'b0)
					begin
						rxstate <= 2'b11;
						rxdivider <= 3'd0;
						if(rxd!=1'b1)
							frameerror<=1'b1;
					end
					else
					begin
						rxdata[rxbitcount-1]<= rxd;
						rxbitcount <= rxbitcount-1;
						rxdivider <= 3'd3;
					end
				end
		2'b11:	begin							// stopbit
					rxstate <= 2'b00;
				end
		endcase
//		rxdivider <= rxdivider-1;
	end
	else
	begin
		rxdivider <= rxdivider-1;
	end
	end
	lastrxd<=rxd;
end

endmodule