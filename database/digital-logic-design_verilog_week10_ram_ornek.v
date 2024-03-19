`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2022 11:33:09 AM
// Design Name: 
// Module Name: ram_ornek
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ram_ornek
#(
parameter RAM_WIDTH = 8,                    
parameter RAM_DEPTH = 4096                  
) 
(
input clk,                                  
input rst_n,
input yaz_komut_i,
input [RAM_WIDTH-1:0] yaz_veri_i,
input [clogb2(RAM_DEPTH-1)-1:0] yaz_adres_i,
input oku_komut_i,
output [RAM_WIDTH-1:0] oku_veri_o,
input [clogb2(RAM_DEPTH-1)-1:0] oku_adres_i,
output yaz_hata_o,                              
output oku_hata_o
);

reg we;  
reg [clogb2(RAM_DEPTH-1)-1:0] addr;
reg [RAM_WIDTH-1:0] din;
wire [RAM_WIDTH-1:0] dout;

reg yaz_komut_ff;
reg oku_komut_ff;
reg yaz_hata;
reg oku_hata;

ram
#(
.RAM_WIDTH(RAM_WIDTH),                    
.RAM_DEPTH(RAM_DEPTH)                     
)
ram_i
(
.clk    (clk),
.we_i   (we),
.addr_i (addr),
.din_i  (din),
.dout_o (dout) 
);

always @(posedge clk, negedge rst_n) begin

    if (rst_n == 1'b0) begin
        we      <= 1'b0;
        addr    <= {clogb2(RAM_DEPTH-1){1'b0}};
        din     <= {RAM_WIDTH{1'b0}};
        yaz_komut_ff    <= 1'b0;
        oku_komut_ff    <= 1'b0;
        yaz_hata        <= 1'b0;
        oku_hata        <= 1'b0;
    end
    else begin

        yaz_hata    <= 1'b0;
        oku_hata    <= 1'b0;
        we          <= 1'b0;

        yaz_komut_ff    <= yaz_komut_i;
        oku_komut_ff    <= oku_komut_i;

        if (yaz_komut_ff == 1'b0 && yaz_komut_i == 1'b1) begin
            if (yaz_adres_i < 12'h800) begin
                yaz_hata    <= 1'b1;
            end
            else begin
                we      <= 1'b1;
                addr    <= yaz_adres_i;
                din     <= yaz_veri_i;
            end
        end
        else if (oku_komut_ff == 1'b0 && oku_komut_i == 1'b1) begin
            if (oku_adres_i < 12'h400 || oku_adres_i > 12'h7FF) begin
                oku_hata    <= 1'b1;
            end
            else begin
                addr    <= oku_adres_i;
            end
        end
    end
    
end

assign oku_veri_o = dout;
assign yaz_hata_o = yaz_hata;
assign oku_hata_o = oku_hata;

//  The following function calculates the address width based on specified RAM depth
function integer clogb2;
input integer depth;
  for (clogb2=0; depth>0; clogb2=clogb2+1)
    depth = depth >> 1;
endfunction

endmodule