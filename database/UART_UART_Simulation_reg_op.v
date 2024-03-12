////////////////////////////////////////
//file name: reg_op.v
//author: fengzhaomao
//data: 2015-11-28
////////////////////////////////////////

// wirte reg
task  write_reg;
input  [3:0]    addr;
input  [31:0]   wdata;
begin
    @(negedge top.clk) begin end
    wait(!top.r_state);
    top.w_state  <= 1'b1;
    @(posedge top.clk) begin end
    top.paddr    <= addr;
    top.psel     <= 1'b1;
    top.pwrite   <= 1'b1;
    top.penable  <= 1'b0;
    @(posedge top.clk) begin   end 
    top.penable  <= 1'b1;
    top.pwdata   <= wdata;
    @(posedge top.clk) begin end
    top.psel     <= 1'b0;
    top.penable  <= 1'b0;
    top.w_state  <= 1'b0;
end
endtask

// read reg
task  read_reg;
input  [3:0]    addr;
output [31:0]   rdata;
begin
    @(posedge top.clk) begin end
    wait(!top.w_state);
    top.r_state      <= 1'b1;
    @(posedge top.clk) begin end
    top.paddr    <= addr;
    top.psel     <= 1'b1;
    top.pwrite   <= 1'b0;
    top.penable  <= 1'b0;
    @(posedge top.clk) begin end
    top.penable  <= 1'b1;
    @(posedge top.clk) begin end
    top.psel     <= 1'b0;
    top.penable  <= 1'b0;
    rdata        <= top.prdata;  // <= ??
    top.r_state  <= 1'b0;
    #1ps;
end
endtask