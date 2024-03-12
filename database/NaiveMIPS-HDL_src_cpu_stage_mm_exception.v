`default_nettype none
module exception(/*autoport*/
//output
           flush,
           cp0_wr_exp,
           cp0_clean_exl,
           exp_epc,
           exp_code,
           exp_bad_vaddr,
           cp0_badv_we,
           exception_new_pc,
           exp_asid,
           cp0_exp_asid_we,
//input
           iaddr_exp_miss,
           daddr_exp_miss,
           iaddr_exp_invalid,
           daddr_exp_invalid,
           iaddr_exp_illegal,
           daddr_exp_illegal,
           daddr_exp_dirty,
           data_we,
           invalid_inst,
           syscall,
           break_inst,
           eret,
           pc_value,
           mem_access_vaddr,
           in_delayslot,
           overflow,
           interrupt_flags,
           allow_int,
           ebase_in,
           epc_in,
           restrict_priv_inst,
           special_int_vec,
           boot_exp_vec,
           if_asid,
           mm_asid,
           if_exl,
           mm_exl,
           is_real_inst);

input wire iaddr_exp_miss;
input wire daddr_exp_miss;
input wire iaddr_exp_invalid;
input wire daddr_exp_invalid;
input wire iaddr_exp_illegal;
input wire daddr_exp_illegal;
input wire daddr_exp_dirty;
input wire data_we;
input wire invalid_inst;
input wire syscall;
input wire break_inst;
input wire eret;
input wire [31:0]pc_value;
input wire [31:0]mem_access_vaddr;
input wire in_delayslot;
input wire overflow;
input wire [7:0]interrupt_flags;
input wire allow_int;
input wire[19:0] ebase_in;
input wire[31:0] epc_in;
input wire restrict_priv_inst;
input wire special_int_vec;
input wire boot_exp_vec;
input wire[7:0] if_asid;
input wire[7:0] mm_asid;
input wire if_exl;
input wire mm_exl;
input wire is_real_inst;

output reg flush;
output reg cp0_wr_exp;
output reg cp0_clean_exl;
output reg[31:0] exp_epc;
output reg[4:0] exp_code;
output reg[31:0] exp_bad_vaddr;
output reg cp0_badv_we;
output reg[31:0] exception_new_pc;
output reg[7:0] exp_asid;
output reg cp0_exp_asid_we;

wire[31:0] exception_base;

//For MIPS32R2
assign exception_base = boot_exp_vec ? 32'hBFC00200 : {ebase_in, 12'b0};
//For MIPS32R1
// assign exception_base = boot_exp_vec ? 32'hBFC00200 : 32'h80000000;

always @(*) begin
    exp_asid <= 8'b0;
    cp0_wr_exp <= 1'b1;
    cp0_clean_exl <= 1'b0;
    cp0_badv_we <= 1'b0;
    cp0_exp_asid_we <= 1'b0;
    flush <= 1'b1;
    exp_epc <= in_delayslot ? (pc_value-32'd4) : pc_value;
    exp_bad_vaddr <= 32'b0;
    exception_new_pc <= exception_base + 32'h180;
    if(is_real_inst && allow_int && (interrupt_flags!=8'h0)) begin
        if(special_int_vec)
            exception_new_pc <= exception_base + 32'h200;
        exp_code <= 5'h00;
        $display("Exception: Interrupt=%x",interrupt_flags);
    end
    else if(iaddr_exp_illegal) begin
        exp_bad_vaddr <= pc_value;
        cp0_badv_we <= 1'b1;
        exp_code <= 5'h04; //AdEL
        $display("Exception: Instruction address illegal");
    end
    else if(iaddr_exp_miss) begin
        if(!if_exl)
            exception_new_pc <= exception_base + 32'h0;
        exp_asid <= if_asid;
        cp0_exp_asid_we <= 1'b1;
        exp_bad_vaddr <= pc_value;
        cp0_badv_we <= 1'b1;
        exp_code <= 5'h02; //TLBL
        $display("Exception: Instruction TLB miss");
    end
    else if(iaddr_exp_invalid) begin
        exp_asid <= if_asid;
        cp0_exp_asid_we <= 1'b1;
        exp_bad_vaddr <= pc_value;
        cp0_badv_we <= 1'b1;
        exp_code <= 5'h02; //TLBL
        $display("Exception: Instruction TLB invalid");
    end
    else if(syscall) begin
        exp_code <= 5'h08;
        $display("Exception: Syscall");
    end
    else if(break_inst) begin
        exp_code <= 5'h09;
        $display("Exception: Breakpoint");
    end
    else if(invalid_inst) begin
        exp_code <= 5'h0a;
        $display("Exception: RI");
    end
    else if(restrict_priv_inst) begin
        exp_code <= 5'h0b;
        $display("Exception: CpU");
    end
    else if(overflow) begin
        exp_code <= 5'h0c;
        $display("Exception: Ov");
    end
    else if(eret) begin    //ERET is not a real exception
        exp_code <= 5'h00;
        cp0_wr_exp <= 1'b0;
        cp0_clean_exl <= 1'b1;
        exception_new_pc <= epc_in;
        $display("Pseudo Exception: ERET");
    end
    else if(daddr_exp_illegal) begin
        exp_bad_vaddr <= mem_access_vaddr;
        cp0_badv_we <= 1'b1;
        exp_code <= data_we ? 5'h05 : 5'h04; //AdES : AdEL
        $display("Exception: Data address illegal, WE=%d",data_we);
    end
    else if(daddr_exp_miss) begin
        if(!mm_exl)
            exception_new_pc <= exception_base + 32'h0;
        exp_asid <= mm_asid;
        cp0_exp_asid_we <= 1'b1;
        exp_bad_vaddr <= mem_access_vaddr;
        cp0_badv_we <= 1'b1;
        exp_code <= data_we ? 5'h03 : 5'h02; //TLBS : TLBL
        $display("Exception: Data TLB miss, WE=%d",data_we);
    end
    else if(daddr_exp_invalid) begin
        exp_asid <= mm_asid;
        cp0_exp_asid_we <= 1'b1;
        exp_bad_vaddr <= mem_access_vaddr;
        cp0_badv_we <= 1'b1;
        exp_code <= data_we ? 5'h03 : 5'h02; //TLBS : TLBL
        $display("Exception: Data TLB invalid, WE=%d",data_we);
    end
    else if(daddr_exp_dirty) begin
        exp_asid <= mm_asid;
        cp0_exp_asid_we <= 1'b1;
        exp_bad_vaddr <= mem_access_vaddr;
        cp0_badv_we <= 1'b1;
        exp_code <= 5'h1; //Mod
        $display("Exception: Data TLB Mod");
    end
    else begin
        cp0_wr_exp <= 1'b0;
        flush <= 1'b0;
        exp_code <= 5'h00;
    end
end

endmodule
