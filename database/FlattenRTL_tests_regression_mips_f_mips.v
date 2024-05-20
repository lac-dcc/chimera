// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module alu (
  input [15:0] a,
  input [15:0] b,
  input [2:0] cmd,
  output reg  [15:0] r) ; 
  always @(*)
       begin 
         case (cmd)
          3 'bxxx:
             r =16'bx;
          3 'b000:
             r =a+b;
          3 'b001:
             r =a-b;
          3 'b010:
             r =a&b;
          3 'b011:
             r =a|b;
          3 'b100:
             r =a^b;
          3 'b101:
             r =a<<b;
          3 'b110:
             r ={{16{a[15]}},a}>>b;
          3 'b111:
             r ={16'b0,a}>>b;
          default :
             begin 
               r =0;$display("ERROR: Unknown alu cmd: %b \n",cmd);
             end 
         endcase 
       end
  
endmodule
 
module EX_stage (
  input clk,
  input rst,
  input [56:0] pipeline_reg_in,
  output reg  [37:0] pipeline_reg_out,
  output [2:0] ex_op_dest) ; 
   wire [2:0] alu_cmd=pipeline_reg_in[56:54] ;  
   wire [15:0] alu_src1=pipeline_reg_in[53:38] ;  
   wire [15:0] alu_src2=pipeline_reg_in[37:22] ;  
   wire [15:0] ex_alu_result ;  
  alu alu_inst(.a(alu_src1),.b(alu_src2),.cmd(alu_cmd),.r(ex_alu_result)); 
  always @( posedge clk)
       begin 
         if (rst)
            begin 
              pipeline_reg_out [37:0]<=0;
            end 
          else 
            begin 
              pipeline_reg_out [37:22]<=ex_alu_result;
              pipeline_reg_out [21:0]<=pipeline_reg_in[21:0];
            end 
       end
  
  assign ex_op_dest=pipeline_reg_in[3:1]; 
endmodule
 
module instruction_mem (
  input clk,
  input [8-1:0] pc,
  output [15:0] instruction) ; 
   reg [15:0] rom[2**8-1:0] ;  
   wire [8-1:0] rom_addr=pc[8-1:0] ;  
  assign instruction=rom[rom_addr]; 
endmodule
 
module MEM_stage (
  input clk,
  input rst,
  input [37:0] pipeline_reg_in,
  output reg  [36:0] pipeline_reg_out,
  output [2:0] mem_op_dest) ; 
   wire [15:0] ex_alu_result=pipeline_reg_in[37:22] ;  
   wire mem_write_en=pipeline_reg_in[21] ;  
   wire [15:0] mem_write_data=pipeline_reg_in[20:5] ;  
   wire [15:0] mem_read_data ;  
  data_mem dmem(.clk(clk),.mem_access_addr(ex_alu_result),.mem_write_data(mem_write_data),.mem_write_en(mem_write_en),.mem_read_data(mem_read_data)); 
  always @( posedge clk)
       begin 
         if (rst)
            begin 
              pipeline_reg_out [36:0]<=0;
            end 
          else 
            begin 
              pipeline_reg_out [36:21]<=ex_alu_result;
              pipeline_reg_out [20:5]<=mem_read_data;
              pipeline_reg_out [4:0]<=pipeline_reg_in[4:0];
            end 
       end
  
  assign mem_op_dest=pipeline_reg_in[3:1]; 
endmodule
 
module ID_stage (
  input clk,
  input rst,
  input instruction_decode_en,
  output reg  [56:0] pipeline_reg_out,
  input [15:0] instruction,
  output [5:0] branch_offset_imm,
  output reg  branch_taken,
  output [2:0] reg_read_addr_1,
  output [2:0] reg_read_addr_2,
  input [15:0] reg_read_data_1,
  input [15:0] reg_read_data_2,
  output [2:0] decoding_op_src1,
  output [2:0] decoding_op_src2) ; 
   reg [15:0] instruction_reg ;  
   wire [3:0] ir_op_code ;  
   wire [2:0] ir_dest ;  
   wire [2:0] ir_src1 ;  
   wire [2:0] ir_src2 ;  
   wire [5:0] ir_imm ;  
   reg write_back_en ;  
   wire [2:0] write_back_dest ;  
   reg write_back_result_mux ;  
   wire mem_write_en ;  
   wire [15:0] mem_write_data ;  
   reg [2:0] ex_alu_cmd ;  
   wire [15:0] ex_alu_src1 ;  
   wire [15:0] ex_alu_src2 ;  
   reg alu_src2_mux ;  
   wire decoding_op_is_branch ;  
   wire decoding_op_is_store ;  
   wire [3:0] ir_op_code_with_bubble ;  
   wire [2:0] ir_dest_with_bubble ;  
  always @(  posedge clk or  posedge rst)
       begin 
         if (rst)
            begin 
              instruction_reg <=0;
            end 
          else 
            begin 
              if (instruction_decode_en)
                 begin 
                   instruction_reg <=instruction;
                 end 
            end 
       end
  
  assign ir_op_code=instruction_reg[15:12]; 
  assign ir_dest=instruction_reg[11:9]; 
  assign ir_src1=instruction_reg[8:6]; 
  assign ir_src2=(decoding_op_is_store)?instruction_reg[11:9]:instruction_reg[5:3]; 
  assign ir_imm=instruction_reg[5:0]; 
  assign ir_op_code_with_bubble=(instruction_decode_en)?ir_op_code:0; 
  assign ir_dest_with_bubble=(instruction_decode_en)?ir_dest:0; 
  always @(*)
       begin 
         if (rst)
            begin 
              write_back_en =0;
              write_back_result_mux =0;
              ex_alu_cmd =0;
              alu_src2_mux =0;
            end 
          else 
            begin 
              case (ir_op_code_with_bubble)
               4 'b0000:
                  begin 
                    write_back_en =0;
                    write_back_result_mux =1'bx;
                    ex_alu_cmd =3'bxxx;
                    alu_src2_mux =1'bx;
                  end 
               4 'b0001:
                  begin 
                    write_back_en =1;
                    write_back_result_mux =0;
                    ex_alu_cmd =3'b000;
                    alu_src2_mux =0;
                  end 
               4 'b0010:
                  begin 
                    write_back_en =1;
                    write_back_result_mux =0;
                    ex_alu_cmd =3'b001;
                    alu_src2_mux =0;
                  end 
               4 'b0011:
                  begin 
                    write_back_en =1;
                    write_back_result_mux =0;
                    ex_alu_cmd =3'b010;
                    alu_src2_mux =0;
                  end 
               4 'b0100:
                  begin 
                    write_back_en =1;
                    write_back_result_mux =0;
                    ex_alu_cmd =3'b011;
                    alu_src2_mux =0;
                  end 
               4 'b0101:
                  begin 
                    write_back_en =1;
                    write_back_result_mux =0;
                    ex_alu_cmd =3'b100;
                    alu_src2_mux =1'bx;
                  end 
               4 'b0110:
                  begin 
                    write_back_en =1;
                    write_back_result_mux =0;
                    ex_alu_cmd =3'b101;
                    alu_src2_mux =0;
                  end 
               4 'b0111:
                  begin 
                    write_back_en =1;
                    write_back_result_mux =0;
                    ex_alu_cmd =3'b110;
                    alu_src2_mux =0;
                  end 
               4 'b1000:
                  begin 
                    write_back_en =1;
                    write_back_result_mux =0;
                    ex_alu_cmd =3'b111;
                    alu_src2_mux =0;
                  end 
               4 'b1001:
                  begin 
                    write_back_en =1;
                    write_back_result_mux =0;
                    ex_alu_cmd =3'b000;
                    alu_src2_mux =1;
                  end 
               4 'b1010:
                  begin 
                    write_back_en =1;
                    write_back_result_mux =1;
                    ex_alu_cmd =3'b000;
                    alu_src2_mux =1;
                  end 
               4 'b1011:
                  begin 
                    write_back_en =0;
                    write_back_result_mux =1'bx;
                    ex_alu_cmd =3'b000;
                    alu_src2_mux =1;
                  end 
               4 'b1100:
                  begin 
                    write_back_en =0;
                    write_back_result_mux =1'bx;
                    ex_alu_cmd =3'bxxx;
                    alu_src2_mux =1;
                  end 
               default :
                  begin 
                    write_back_en =0;
                    write_back_result_mux =1'bx;
                    ex_alu_cmd =3'bxxx;
                    alu_src2_mux =1'bx;$display("ERROR: Unknown Instruction: %b",ir_op_code_with_bubble);
                  end 
              endcase 
            end 
       end
  
  assign decoding_op_is_branch=(ir_op_code==4'b1100)?1:0; 
  assign decoding_op_is_store=(ir_op_code==4'b1011)?1:0; 
  assign mem_write_data=reg_read_data_2; 
  assign mem_write_en=decoding_op_is_store; 
  assign write_back_dest=ir_dest_with_bubble; 
  assign ex_alu_src1=reg_read_data_1; 
  assign ex_alu_src2=(alu_src2_mux)?{{10{ir_imm[5]}},ir_imm}:reg_read_data_2; 
  always @(  posedge clk or  posedge rst)
       begin 
         if (rst)
            begin 
              pipeline_reg_out [56:0]<=0;
            end 
          else 
            begin 
              pipeline_reg_out [56:0]<={ex_alu_cmd[2:0],ex_alu_src1[15:0],ex_alu_src2[15:0],mem_write_en,mem_write_data[15:0],write_back_en,write_back_dest[2:0],write_back_result_mux};
            end 
       end
  
  assign reg_read_addr_1=ir_src1; 
  assign reg_read_addr_2=ir_src2; 
  always @(*)
       begin 
         if (decoding_op_is_branch)
            begin 
              case (ir_dest_with_bubble)
               3 'b000:
                  begin 
                    if (reg_read_data_1==0)
                       branch_taken =1;
                     else 
                       branch_taken =0;
                  end 
               default :
                  begin 
                    branch_taken =0;$display("ERROR: Unknown branch condition %b, in branch instruction %b \n",ir_dest_with_bubble,ir_op_code_with_bubble);
                  end 
              endcase 
            end 
          else 
            begin 
              branch_taken =0;
            end 
       end
  
  assign branch_offset_imm=ir_imm; 
  assign decoding_op_src1=ir_src1; 
  assign decoding_op_src2=(ir_op_code==4'b0000||ir_op_code==4'b1001||ir_op_code==4'b1010||ir_op_code==4'b1100)?3'b000:ir_src2; 
endmodule
 
module IF_stage (
  input clk,
  input rst,
  input instruction_fetch_en,
  input [5:0] branch_offset_imm,
  input branch_taken,
  output reg  [8-1:0] pc,
  output [15:0] instruction) ; 
  always @(  posedge clk or  posedge rst)
       begin 
         if (rst)
            begin 
              pc <=8'b0;
            end 
          else 
            begin 
              if (instruction_fetch_en)
                 begin 
                   if (branch_taken)
                      pc <=pc+{{(8-6){branch_offset_imm[5]}},branch_offset_imm[5:0]};
                    else 
                      pc <=pc+8'd1;
                 end 
            end 
       end
  
  instruction_mem imem(.clk(clk),.pc(pc),.instruction(instruction)); 
endmodule
 
module WB_stage (
  input [36:0] pipeline_reg_in,
  output reg_write_en,
  output [2:0] reg_write_dest,
  output [15:0] reg_write_data,
  output [2:0] wb_op_dest) ; 
   wire [15:0] ex_alu_result=pipeline_reg_in[36:21] ;  
   wire [15:0] mem_read_data=pipeline_reg_in[20:5] ;  
   wire write_back_en=pipeline_reg_in[4] ;  
   wire [2:0] write_back_dest=pipeline_reg_in[3:1] ;  
   wire write_back_result_mux=pipeline_reg_in[0] ;  
  assign reg_write_en=write_back_en; 
  assign reg_write_dest=write_back_dest; 
  assign reg_write_data=(write_back_result_mux)?mem_read_data:ex_alu_result; 
  assign wb_op_dest=pipeline_reg_in[3:1]; 
endmodule
 
module hazard_detection_unit (
  input [2:0] decoding_op_src1,
  input [2:0] decoding_op_src2,
  input [2:0] ex_op_dest,
  input [2:0] mem_op_dest,
  input [2:0] wb_op_dest,
  output reg  pipeline_stall_n) ; 
  always @(*)
       begin 
         pipeline_stall_n =1;
         if (decoding_op_src1!=0&&(decoding_op_src1==ex_op_dest||decoding_op_src1==mem_op_dest||decoding_op_src1==wb_op_dest))
            pipeline_stall_n =0;
         if (decoding_op_src2!=0&&(decoding_op_src2==ex_op_dest||decoding_op_src2==mem_op_dest||decoding_op_src2==wb_op_dest))
            pipeline_stall_n =0;
       end
  
endmodule
 
module mips_16_core_top (
  input clk,
  input rst,
  output [8-1:0] pc) ; 
   wire pipeline_stall_n ;  
   wire [5:0] branch_offset_imm ;  
   wire branch_taken ;  
   wire [15:0] instruction ;  
   wire [56:0] ID_pipeline_reg_out ;  
   wire [37:0] EX_pipeline_reg_out ;  
   wire [36:0] MEM_pipeline_reg_out ;  
   wire [2:0] reg_read_addr_1 ;  
   wire [2:0] reg_read_addr_2 ;  
   wire [15:0] reg_read_data_1 ;  
   wire [15:0] reg_read_data_2 ;  
   wire [2:0] decoding_op_src1 ;  
   wire [2:0] decoding_op_src2 ;  
   wire [2:0] ex_op_dest ;  
   wire [2:0] mem_op_dest ;  
   wire [2:0] wb_op_dest ;  
   wire reg_write_en ;  
   wire [2:0] reg_write_dest ;  
   wire [15:0] reg_write_data ;  
  IF_stage IF_stage_inst(.clk(clk),.rst(rst),.instruction_fetch_en(pipeline_stall_n),.branch_offset_imm(branch_offset_imm),.branch_taken(branch_taken),.pc(pc),.instruction(instruction)); 
  ID_stage ID_stage_inst(.clk(clk),.rst(rst),.instruction_decode_en(pipeline_stall_n),.pipeline_reg_out(ID_pipeline_reg_out),.instruction(instruction),.branch_offset_imm(branch_offset_imm),.branch_taken(branch_taken),.reg_read_addr_1(reg_read_addr_1),.reg_read_addr_2(reg_read_addr_2),.reg_read_data_1(reg_read_data_1),.reg_read_data_2(reg_read_data_2),.decoding_op_src1(decoding_op_src1),.decoding_op_src2(decoding_op_src2)); 
  EX_stage EX_stage_inst(.clk(clk),.rst(rst),.pipeline_reg_in(ID_pipeline_reg_out),.pipeline_reg_out(EX_pipeline_reg_out),.ex_op_dest(ex_op_dest)); 
  MEM_stage MEM_stage_inst(.clk(clk),.rst(rst),.pipeline_reg_in(EX_pipeline_reg_out),.pipeline_reg_out(MEM_pipeline_reg_out),.mem_op_dest(mem_op_dest)); 
  WB_stage WB_stage_inst(.pipeline_reg_in(MEM_pipeline_reg_out),.reg_write_en(reg_write_en),.reg_write_dest(reg_write_dest),.reg_write_data(reg_write_data),.wb_op_dest(wb_op_dest)); 
  register_file register_file_inst(.clk(clk),.rst(rst),.reg_write_en(reg_write_en),.reg_write_dest(reg_write_dest),.reg_write_data(reg_write_data),.reg_read_addr_1(reg_read_addr_1),.reg_read_data_1(reg_read_data_1),.reg_read_addr_2(reg_read_addr_2),.reg_read_data_2(reg_read_data_2)); 
  hazard_detection_unit hazard_detection_unit_inst(.decoding_op_src1(decoding_op_src1),.decoding_op_src2(decoding_op_src2),.ex_op_dest(ex_op_dest),.mem_op_dest(mem_op_dest),.wb_op_dest(wb_op_dest),.pipeline_stall_n(pipeline_stall_n)); 
endmodule
 
module data_mem (
  input clk,
  input [15:0] mem_access_addr,
  input [15:0] mem_write_data,
  input mem_write_en,
  output [15:0] mem_read_data) ; 
   reg [15:0] ram[(2**8)-1:0] ;  
   wire [8-1:0] ram_addr=mem_access_addr[8-1:0] ;  
  always @( posedge clk)
       if (mem_write_en)
          ram [ram_addr]<=mem_write_data;
 
  assign mem_read_data=ram[ram_addr]; 
endmodule
 
module register_file (
  input clk,
  input rst,
  input reg_write_en,
  input [2:0] reg_write_dest,
  input [15:0] reg_write_data,
  input [2:0] reg_read_addr_1,
  output [15:0] reg_read_data_1,
  input [2:0] reg_read_addr_2,
  output [15:0] reg_read_data_2) ; 
   reg [15:0] reg_array[7:0] ;  
  always @(  posedge clk or  posedge rst)
       begin 
         if (rst)
            begin 
              reg_array [0]<=15'b0;
              reg_array [1]<=15'b0;
              reg_array [2]<=15'b0;
              reg_array [3]<=15'b0;
              reg_array [4]<=15'b0;
              reg_array [5]<=15'b0;
              reg_array [6]<=15'b0;
              reg_array [7]<=15'b0;
            end 
          else 
            begin 
              if (reg_write_en)
                 begin 
                   reg_array [reg_write_dest]<=reg_write_data;
                 end 
            end 
       end
  
  assign reg_read_data_1=(reg_read_addr_1==0)?15'b0:reg_array[reg_read_addr_1]; 
  assign reg_read_data_2=(reg_read_addr_2==0)?15'b0:reg_array[reg_read_addr_2]; 
endmodule
 
