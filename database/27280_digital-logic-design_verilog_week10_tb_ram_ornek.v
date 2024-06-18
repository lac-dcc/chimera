// This program was cloned from: https://github.com/mbaykenar/digital-logic-design
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2022 02:35:45 PM
// Design Name: 
// Module Name: tb_ram_ornek
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


module tb_ram_ornek;

parameter RAM_WIDTH = 8;              
parameter RAM_DEPTH = 4096;                  

reg clk                                     ;                                  
reg rst_n                                   ;
reg yaz_komut_i                             ;
reg [RAM_WIDTH-1:0] yaz_veri_i              ;
reg [clogb2(RAM_DEPTH-1)-1:0] yaz_adres_i   ;
reg oku_komut_i                             ;
wire [RAM_WIDTH-1:0] oku_veri_o             ;
reg [clogb2(RAM_DEPTH-1)-1:0] oku_adres_i   ;
wire yaz_hata_o                             ;                              
wire oku_hata_o                             ;

localparam real c_clk_period = 10;

ram_ornek 
#(
.RAM_WIDTH(RAM_WIDTH),                    
.RAM_DEPTH(RAM_DEPTH)                     
)
DUT
(
.clk            (clk        ),                                          
.rst_n          (rst_n      ),     
.yaz_komut_i    (yaz_komut_i),        
.yaz_veri_i     (yaz_veri_i ),
.yaz_adres_i    (yaz_adres_i),    
.oku_komut_i    (oku_komut_i),    
.oku_veri_o     (oku_veri_o ),
.oku_adres_i    (oku_adres_i),    
.yaz_hata_o     (yaz_hata_o ),                
.oku_hata_o     (oku_hata_o )
);

always begin
    #(c_clk_period/2) clk = !clk;
end

initial begin
clk = 1'b0;
rst_n = 1'b0;
yaz_komut_i = 0;
yaz_veri_i = 0;
yaz_adres_i = 0;
oku_komut_i = 0;
oku_adres_i = 0;
#40;
rst_n = 1'b1;
#20;
oku_adres_i = 12'h010;
oku_komut_i = 1'b1;
#20;
oku_adres_i = 12'h500;
#10;
oku_komut_i = 1'b0;
#10;
oku_komut_i = 1'b1;
#10;
oku_adres_i = 12'h804;
#10;
oku_komut_i = 1'b0;
#10;
oku_komut_i = 1'b1;
#20;
oku_komut_i = 1'b0;
yaz_adres_i = 12'h004;
yaz_veri_i = 8'hBA;
#10;
yaz_komut_i = 1'b1;
#10;
yaz_komut_i = 1'b0;
yaz_adres_i = 12'h404;
#10;
yaz_komut_i = 1'b1;
#10;
yaz_adres_i = 12'h804;
yaz_komut_i = 1'b0;
#10;
yaz_komut_i = 1'b1;
#20;
$finish;
end

//  The following function calculates the address width based on specified RAM depth
function integer clogb2;
input integer depth;
  for (clogb2=0; depth>0; clogb2=clogb2+1)
    depth = depth >> 1;
endfunction

endmodule