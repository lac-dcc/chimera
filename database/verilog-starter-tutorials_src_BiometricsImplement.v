module authorization(auth,check,checkhash);
    input [7:0] auth;
    input [7:0] checkhash;
    output reg check;
    always @(*)
    begin
    // Simple logic of hash-match or not
    if(auth==checkhash) 
	    check=1;
    else
	    check=0;
    end 
endmodule

module test;
    wire check;
    reg [0:7]auth;
    reg [0:7]checkhash;
    authorization authen(auth,check,checkhash);
    initial
    begin
    $dumpfile("vcd/BiometricsImplement.vcd");
    $dumpvars(0,test);
    $display("Bytes \t Checker");
    $monitor("%b %b",auth,check);

    checkhash=8'b11101101;
    auth=8'b10010110;
    #10 auth=8'b10110010;
    #10 auth=8'b11101101;
    $finish;
    end
endmodule
