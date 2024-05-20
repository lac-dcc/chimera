// This program was cloned from: https://github.com/abdelazeem201/SoC-FPGA
// License: MIT License

//*********************************************************************
//* ASIC Fresh Board                                                   *
//*  UART2SD                                                    *
//*  Top File : sd_write.v                                                *
//*  Author: abdelazeem                                               *
//*  Revision 0.1                                                     *
//*  Date     2024/01/26                                               *
//*  Email : a.abdelazeem201@gmail.com                                * 
//*********************************************************************
`timescale  1ns/1ns
module  sd_ctrl
(
    input   wire            sys_clk         ,   
    input   wire            sys_clk_shift   ,   
    input   wire            sys_rst_n       ,   
 
    input   wire            sd_miso         ,   
    output  wire            sd_clk          ,   
    output  reg             sd_cs_n         ,   
    output  reg             sd_mosi         ,   
 
    input   wire            wr_en           ,   
    input   wire    [31:0]  wr_addr         ,   
    input   wire    [15:0]  wr_data         ,   
    output  wire            wr_busy         ,   
    output  wire            wr_req          ,   
   
    input   wire            rd_en           ,   
    input   wire    [31:0]  rd_addr         ,   
    output  wire            rd_busy         ,   
    output  wire            rd_data_en      ,   
    output  wire    [15:0]  rd_data         ,   

    output  wire            init_end            
);

wire            init_cs_n   ;   
wire            init_mosi   ;   
wire            wr_cs_n     ;   
wire            wr_mosi     ;   
wire            rd_cs_n     ;   
wire            rd_mosi     ;   

assign  sd_clk = sys_clk_shift;


always@(*)
    if(init_end == 1'b0)
        begin
            sd_cs_n <=  init_cs_n;
            sd_mosi <=  init_mosi;
        end
    else    if(wr_busy == 1'b1)
        begin
            sd_cs_n <=  wr_cs_n;
            sd_mosi <=  wr_mosi;
        end
    else    if(rd_busy == 1'b1)
        begin
            sd_cs_n <= rd_cs_n;
            sd_mosi <= rd_mosi;
        end
    else
        begin
            sd_cs_n <=  1'b1;
            sd_mosi <=  1'b1;
        end


sd_init sd_init_inst
(
    .sys_clk        (sys_clk        ),  
    .sys_clk_shift  (sys_clk_shift  ),  
    .sys_rst_n      (sys_rst_n      ),  
    .miso           (sd_miso        ),  

    .cs_n           (init_cs_n      ),  
    .mosi           (init_mosi      ),  
    .init_end       (init_end       )   
);


sd_write    sd_write_inst
(
    .sys_clk        (sys_clk            ),  
    .sys_clk_shift  (sys_clk_shift      ),  
    .sys_rst_n      (sys_rst_n          ),  
    .miso           (sd_miso            ),  
    .wr_en          (wr_en && init_end  ),  
    .wr_addr        (wr_addr            ),  
    .wr_data        (wr_data            ),  

    .cs_n           (wr_cs_n            ),  
    .mosi           (wr_mosi            ),  
    .wr_busy        (wr_busy            ),  
    .wr_req         (wr_req             )   
);


sd_read sd_read_inst
(
    .sys_clk        (sys_clk            ),  
    .sys_clk_shift  (sys_clk_shift      ),  
    .sys_rst_n      (sys_rst_n          ),  
    .miso           (sd_miso            ),  
    .rd_en          (rd_en & init_end   ),  
    .rd_addr        (rd_addr            ),  

    .rd_busy        (rd_busy            ),  
    .rd_data_en     (rd_data_en         ),  
    .rd_data        (rd_data            ),  
    .cs_n           (rd_cs_n            ),  
    .mosi           (rd_mosi            )   
);

endmodule
