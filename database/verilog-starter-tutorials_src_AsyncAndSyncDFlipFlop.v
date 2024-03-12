module sync_async(in1,in2,out1,out2,reset,clock);
    input in1;
    input in2;
    output out1;
    output out2; 
    input reset; 
    input clock;
    reg out1,out2;

    // Synchronous : Depend on clock.
    always @(posedge clock)
    begin
	    if(reset)
            out1=0;
        else
            out1=in1;
    end

    // Asynchronous : Independent of clock.
    always @(posedge clock or reset) 
    begin
	    if(reset)
		out2=0;
	else
		out2=in2;
	end

endmodule

module test;
    integer i;
    reg in1,in2,reset,clock;
    wire out1,out2;
    sync_async a1(in1,in2,out1,out2,reset,clock);
    initial 
    begin
        $dumpfile("vcd/SyncAndAsyncDFlipFlop.vcd");
        $dumpvars(0,test);
        $display("in1 in2 out1 out2 reset clock");
        $monitor("%b %b %b %b %b %b ",in1,in2,out1,out2,reset,clock);

        in1= 0;
        in2=0;
        reset=0;
        #10
        in1= 0;
        in2=1;
        reset=0;
        #10
        in1 = 1;
        in2=0;
        reset=0;
        #10
        in1=1;
        in2=1;
        reset=0;
        #10
        in1= 0;
        in2=0;
        reset=1;
        #10
        in1= 0;
        in2=1;
        reset=1;
        #10
        in1 = 1;
        in2=0;
        reset=1;
        #10
        in1=1;
        in2=1;
        reset=1;
    $finish;
    end

    initial begin
        clock = 0;
        for(i=0;i<20;i=i+1)
            #4 clock = ~clock;
    end
    
endmodule
