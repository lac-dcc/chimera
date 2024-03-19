module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    reg [100:0]cin1;


    generate
    genvar i;
    for(i=0;i<100;i=i+1) begin:adds
        
        if(i==0) begin        
		    add ins(a[i],b[i],cin,sum[i],cout[i]);            
            assign cin1[i+1]=cout[i];
        end            
        else begin
            add ins(a[i],b[i],cin1[i],sum[i],cout[i]);
            assign cin1[i+1]=cout[i];
            
        end
    end
    endgenerate
endmodule

module add(input a, input b, input cin, output sum, output cout);
    assign {cout,sum}=a+b+cin;
endmodule

