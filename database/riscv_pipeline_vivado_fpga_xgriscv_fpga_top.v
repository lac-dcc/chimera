// This program was cloned from: https://github.com/Crzax/riscv_pipeline
// License: MIT License

`timescale 1ns / 1ps

module IP2SOC_Top(
  input         clk,
  input         rstn,
  input [15:0]  sw_i,
  output [7:0]  disp_seg_o, disp_an_o
  );
  
  wire          Clk_CPU;
  wire [31:0]   instr;
  wire [31:0]   PC;
  wire          MemWrite;
  wire [31:0]   dm_din, dm_dout;

  wire          rst;
  assign rst = ~rstn;

  wire [31:0]   seg7_data; 
  wire [6:0]    ram_addr;
  wire [3:0]    cpu_data_amp, ram_amp;
  wire          ram_we;
  wire          seg7_we;

  wire [31:0]   cpu_data_out;       // data from CPU
  wire [31:0]   cpu_data_addr;
  wire [31:0]   ram_data_out;
  wire [31:0]   cpu_data_in;
  wire [31:0]   cpuseg7_data;
  wire [31:0]   reg_data;
   

  imem  U_IM( // instruction memory
    .a(PC[8:2]), .spo(instr)
    );

  dmem U_dmem(
    .clk(Clk_CPU), 
    .we(ram_we), 
    .amp(ram_amp), 
    .a(ram_addr), 
    .wd(dm_din),
    .rd(dm_dout)
    );

  MIO_BUS  U_MIO (
    .sw_i(sw_i),
    .mem_w(MemWrite),
    .cpu_data_amp(cpu_data_amp),
    .cpu_data_addr(cpu_data_addr),
    .cpu_data_out(cpu_data_out),
    .ram_data_out(dm_dout),
    .cpu_data_in(cpu_data_in),
    .ram_data_in(dm_din),
    .ram_addr(ram_addr),
    .cpuseg7_data(cpuseg7_data),
    .ram_we(ram_we),
    .ram_amp(ram_amp),
    .seg7_we(seg7_we)
   );

  MULTI_CH32 U_Multi (
    .clk(clk),
    .rst(rst),
    .EN(seg7_we),                //Write EN
    .ctrl(sw_i[5:0]),            //SW[5:0]
    .Data0(cpuseg7_data),
     //disp_cpudata
    .data1({2'b0,PC[31:2]}),
    .data2(PC),
    .data3(instr),
    .data4(cpu_data_addr),
    .data5(cpu_data_out),
    .data6(dm_dout),
    .data7({ram_addr, 2'b00}),
    .reg_data(reg_data),
    .seg7_data(seg7_data)
    );

   xgriscv_480  U_xgriscv(
    .clk(Clk_CPU), 
    .reset(rst), 
    .pc(PC), 
    .instr(instr), 
    .memwrite(MemWrite), 
    .amp(cpu_data_amp), 
    .daddr(cpu_data_addr), 
    .writedata(cpu_data_out), 
    .readdata(cpu_data_in),
    .reg_sel(sw_i[4:0]),
    .reg_data(reg_data)
    );         
         
  SEG7x16 U_7SEG(
    .clk(clk), 
    .rst(rst),
    .cs(1'b1),
    .i_data(seg7_data),
    .o_seg(disp_seg_o),
    .o_sel(disp_an_o)
    );

  CLK_DIV U_CLKDIV( 
    .clk(clk),
    .rst(rst),
    .SW15(sw_i[15]),
    .Clk_CPU(Clk_CPU)
    );

endmodule
