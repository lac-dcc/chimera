`default_nettype none
module cp0(/*autoport*/
//output
         data_o,
         timer_int,
         user_mode,
         ebase,
         epc,
         tlb_config,
         allow_int,
         software_int_o,
         interrupt_mask,
         special_int_vec,
         boot_exp_vec,
         asid,
         in_exl,
         kseg0_uncached,
         debugger_data_o,
//input
         clk,
         rst_n,
         rd_addr,
         rd_sel,
         we,
         wr_addr,
         wr_sel,
         data_i,
         hardware_int,
         clean_exl,
         en_exp_i,
         exp_epc,
         exp_bd,
         exp_code,
         exp_bad_vaddr,
         exp_badv_we,
         exp_asid,
         exp_asid_we,
         we_probe,
         probe_result,
         debugger_rd_addr,
         debugger_rd_sel);

`define CP0_Index {5'd0,3'd0}
`define CP0_EntryLo0 {5'd2,3'd0}
`define CP0_EntryLo1 {5'd3,3'd0}
`define CP0_Context {5'd4,3'd0}
`define CP0_BadVAddr {5'd8,3'd0}
`define CP0_Count {5'd9,3'd0}
`define CP0_EntryHi {5'd10,3'd0}
`define CP0_Compare {5'd11,3'd0}
`define CP0_Status {5'd12,3'd0}
`define CP0_Cause {5'd13,3'd0}
`define CP0_EPC {5'd14,3'd0}
`define CP0_PRId {5'd15,3'd0}
`define CP0_EBase {5'd15,3'd1}
`define CP0_Config {5'd16,3'd0}
`define CP0_Config1 {5'd16,3'd1}

input wire clk;
input wire rst_n;

input wire[4:0] rd_addr;
input wire[2:0] rd_sel;
output wire[31:0] data_o;
input wire we;
input wire[4:0] wr_addr;
input wire[2:0] wr_sel;
input wire[31:0] data_i;
input wire[5:0] hardware_int;
output reg timer_int;

output wire user_mode;
output wire[19:0] ebase;
output wire[31:0] epc;
output wire[89:0] tlb_config;
output wire allow_int;
output wire[1:0] software_int_o;
output wire[7:0] interrupt_mask;
output wire special_int_vec;
output wire boot_exp_vec;
output wire[7:0] asid;
output wire in_exl;
output reg kseg0_uncached;

input wire clean_exl;
input wire en_exp_i;
input wire[31:0] exp_epc;
input wire exp_bd;
input wire[4:0] exp_code;
input wire[31:0] exp_bad_vaddr;
input wire exp_badv_we;
input wire[7:0] exp_asid;
input wire exp_asid_we;

input wire we_probe;
input wire[31:0] probe_result;

input wire[4:0] debugger_rd_addr;
input wire[2:0] debugger_rd_sel;
output wire[31:0] debugger_data_o;

reg[31:0] cp0_regs_Status;
reg[31:0] cp0_regs_Cause;
reg[31:0] cp0_regs_Count;
reg[31:0] cp0_regs_Compare;
reg[31:0] cp0_regs_Context;
reg[31:0] cp0_regs_EPC;
reg[31:0] cp0_regs_EBase;
reg[31:0] cp0_regs_EntryLo1;
reg[31:0] cp0_regs_EntryLo0;
reg[31:0] cp0_regs_EntryHi;
reg[31:0] cp0_regs_Index;
reg[31:0] cp0_regs_BadVAddr;
reg[31:0] cp0_regs_Config;

wire[7:0] rd_addr_internal[0:1];
reg[31:0] data_o_internal[0:1];

reg[7:0] timer_count;

assign rd_addr_internal[0] = {rd_addr,rd_sel};
assign data_o = data_o_internal[0];
assign rd_addr_internal[1] = {debugger_rd_addr,debugger_rd_sel};
assign debugger_data_o = data_o_internal[1];

assign user_mode = cp0_regs_Status[4:1]==4'b1000;
assign ebase = {2'b10, cp0_regs_EBase[29:12]};
assign epc = cp0_regs_EPC;
assign tlb_config = {
    cp0_regs_EntryLo0[5:3],
    cp0_regs_EntryLo1[5:3],
    cp0_regs_EntryHi[7:0],
    cp0_regs_EntryLo1[0] & cp0_regs_EntryLo0[0],
    cp0_regs_EntryHi[31:13],
    cp0_regs_EntryLo1[29:6],
    cp0_regs_EntryLo1[2:1],
    cp0_regs_EntryLo0[29:6],
    cp0_regs_EntryLo0[2:1],
    cp0_regs_Index[3:0]
};
assign allow_int = cp0_regs_Status[2:0]==3'b001;
assign software_int_o = cp0_regs_Cause[9:8];
assign interrupt_mask = cp0_regs_Status[15:8];
assign special_int_vec = cp0_regs_Cause[23];
assign boot_exp_vec = cp0_regs_Status[22];
assign asid = cp0_regs_EntryHi[7:0];
assign in_exl = cp0_regs_Status[1];

genvar read_i;
generate
for (read_i = 0; read_i < 2; read_i=read_i+1) begin : cp0_read
    
    always @(*) begin
        if (!rst_n) begin
            data_o_internal[read_i] <= 32'b0;
        end
        else 
            case(rd_addr_internal[read_i])
            `CP0_Compare: begin
                data_o_internal[read_i] <= cp0_regs_Compare;
            end
            `CP0_Count: begin
                data_o_internal[read_i] <= cp0_regs_Count;
            end
            `CP0_EBase: begin
                data_o_internal[read_i] <= {2'b10, cp0_regs_EBase[29:12], 12'b0};
            end
            `CP0_EPC: begin
                data_o_internal[read_i] <= cp0_regs_EPC;
            end
            `CP0_BadVAddr: begin
                data_o_internal[read_i] <= cp0_regs_BadVAddr;
            end
            `CP0_Cause: begin
                data_o_internal[read_i] <= {cp0_regs_Cause[31],7'b0,cp0_regs_Cause[23],7'b0, hardware_int, cp0_regs_Cause[9:8], 1'b0, cp0_regs_Cause[6:2], 2'b00};
            end
            `CP0_Status: begin
                data_o_internal[read_i] <= cp0_regs_Status;
            end
            `CP0_Context: begin
                data_o_internal[read_i] <= {cp0_regs_Context[31:4], 4'b0};
            end
            `CP0_EntryHi: begin
                data_o_internal[read_i] <= {cp0_regs_EntryHi[31:13], 5'b0, cp0_regs_EntryHi[7:0]};
            end
            `CP0_EntryLo0: begin
                data_o_internal[read_i] <= {2'b0, cp0_regs_EntryLo0[29:0]};
            end
            `CP0_EntryLo1: begin
                data_o_internal[read_i] <= {2'b0, cp0_regs_EntryLo1[29:0]};
            end
            `CP0_Index: begin
                data_o_internal[read_i] <= {cp0_regs_Index[31], 27'b0, cp0_regs_Index[3:0]};
            end
            `CP0_PRId: begin 
                data_o_internal[read_i] <= {8'b0, 8'b1, 16'h8000}; //MIPS32 4Kc
            end
            `CP0_Config: begin 
                data_o_internal[read_i] <= {1'b1, 21'b0, 3'b1, 4'b0, cp0_regs_Config[2:0]}; //Release 1
            end
            `CP0_Config1: begin 
                //Cache Size:                            I:128-64B-direct, D:256-64B-direct
                data_o_internal[read_i] <= {1'b0, 6'd15, 3'd1, 3'd5, 3'd0, 3'd2, 3'd5, 3'd0, 7'd0}; 
            end
            default:
                data_o_internal[read_i] <= 32'b0;
            endcase
    end

end //for
endgenerate

always @(posedge clk) begin
    if (!rst_n) begin
        cp0_regs_Count <= 32'b0;
        cp0_regs_Compare <= 32'b0;
        cp0_regs_Status <= 32'h10400004; //BEV=1,ERL=1 is required
        cp0_regs_EBase <= 32'h80000000;
        cp0_regs_Cause[9:8] <= 2'b0;
        cp0_regs_Cause[23] <= 1'b0;
        timer_int <= 1'b0;
        timer_count <= 'b0;
        kseg0_uncached <= 1'b0;
    end
    else begin
        cp0_regs_Count <= cp0_regs_Count+1'b1;
        timer_count <= timer_count + 'b1;
        if(cp0_regs_Compare != 32'b0 && cp0_regs_Compare==cp0_regs_Count)
            timer_int <= 1'b1;
        if(we) begin
            case({wr_addr,wr_sel})
            `CP0_Compare: begin
                timer_int <= 1'b0;
                cp0_regs_Compare <= data_i;
            end
            `CP0_Count: begin
                cp0_regs_Count <= data_i;
            end
            `CP0_EBase: begin
                cp0_regs_EBase[29:12] <= data_i[29:12]; //only bits 29..12 is writable
            end
            `CP0_EPC: begin
                cp0_regs_EPC <= data_i;
            end
            `CP0_Cause: begin
                cp0_regs_Cause[9:8] <= data_i[9:8];
                cp0_regs_Cause[23] <= data_i[23]; //IV
            end
            `CP0_Status: begin
                cp0_regs_Status[28] <= data_i[28]; //CU0
                cp0_regs_Status[22] <= data_i[22]; //BEV
                cp0_regs_Status[15:8] <= data_i[15:8]; //IM
                cp0_regs_Status[4] <= data_i[4]; //UM
                cp0_regs_Status[2:0] <= data_i[2:0]; //ERL, EXL, IE
            end
            `CP0_EntryHi: begin
                cp0_regs_EntryHi[31:13] <= data_i[31:13];
                cp0_regs_EntryHi[7:0] <= data_i[7:0];
            end
            `CP0_EntryLo0: begin
                cp0_regs_EntryLo0[29:0] <= data_i[29:0];
            end
            `CP0_EntryLo1: begin
                cp0_regs_EntryLo1[29:0] <= data_i[29:0];
            end
            `CP0_Index: begin
                cp0_regs_Index[3:0] <= data_i[3:0];
            end
            `CP0_Context: begin
                cp0_regs_Context[31:23] <= data_i[31:23];
            end
            `CP0_Config: begin 
                cp0_regs_Config[2:0] <= data_i[2:0];
                kseg0_uncached <= data_i[2:0]==3'd2;
            end

            endcase
        end
        if(we_probe)
            cp0_regs_Index <= probe_result;
        if(en_exp_i) begin
            if(exp_badv_we)
                cp0_regs_BadVAddr <= exp_bad_vaddr;
            cp0_regs_Context[22:4] <= exp_bad_vaddr[31:13];
            cp0_regs_EntryHi[31:13] <= exp_bad_vaddr[31:13];
            if(exp_asid_we)
                cp0_regs_EntryHi[7:0] <= exp_asid;
            cp0_regs_Status[1] <= 1'b1;
            cp0_regs_Cause[31] <= exp_bd;
            cp0_regs_Cause[6:2] <= exp_code;
            cp0_regs_EPC <= exp_epc;
        end
        if(clean_exl) begin
            cp0_regs_Status[1] <= 1'b0;
        end
    end
end

endmodule
