//`timescale 10 ns / 1 ns

module testbench;
    
    reg Clk;
    reg Rst;
    
    integer i;

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0,testbench);
        // $readmemh("./code/xdb_1.txt",mips.IM.im_128k,32'H0C00,32'H0C0e);
        $readmemh("./code/P6_function.txt",mips.IM.im_128k,32'H0C00,32'H0C8F);
        Clk = 0;
        forever #10 Clk=!Clk;
    end

    initial begin
            Rst = 1;
        #20 Rst = 0;
        $display("Rst信号被设置为0 开始运行Code.txt");
        #2500 begin
            $display("寄存器内容:");
            for (i=0; i<32; i=i+1) begin
                 $display("Register[%2d] = %h",i,mips.RF.rf[i]);
            end
            $display("DM内容:"); 
            for (i=0; i<'h80; i=i+4) begin
                 $display("DM[%3d] = %h%h%h%h",i,mips.DM.dm_4k[i+3],mips.DM.dm_4k[i+2],mips.DM.dm_4k[i+1],mips.DM.dm_4k[i+0]);
            end          
        end
        #10 $finish;   
    end  

    // always @(posedge Clk ) begin
    //     if ( (mips.im_IF != 32'b0) | ($time == 200) ) begin
    //         $display("\n========================================");
    //         $display("time = %d",$time);
    //         $display("指令指针: pc = %h",mips.pc[31:0]);
    //         $display("指令内容: im = %h",mips.im_IF);
    //         $display("指令内容: op = %b rs = %b rt = %b immediate = %b",mips.im_IF[31:26],mips.im_IF[25:21],mips.im_IF[20:16],mips.im_IF[15:0]);
            
    //         $display("S寄存器内容:");
    //         for (i=16; i<24; i=i+1) begin
    //              $display("Register[%d] = %h",i,mips.RF.rf[i]);
    //         end

    //         $display("========================================"); 
    //     end
    // end

    mips mips(Clk,Rst);

endmodule
