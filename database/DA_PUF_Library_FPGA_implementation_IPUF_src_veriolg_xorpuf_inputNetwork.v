
module inputNetwork #(parameter N = 64, nSHIFT = 0)(x,y);

    input  [N-1:0] x;
    output [N-1:0] y;
    
	 wire [N-1:0] z;
	 
    assign z =  (nSHIFT ==0)? x : {x[N-nSHIFT-1:0],x[N-1: N-nSHIFT]};
	 
	 genvar i;
	 generate 
	 for(i=0; i< N-1; i=i+1) begin:net

		if(i==0) begin
			xor(y[N/2],z[i],1'b0);
	   end
		
		if((i%2)==0) begin 
			xor(y[i/2],z[i],z[i+1]);
	   end else begin 
		   xor(y[(N+i+1)/2],z[i],z[i+1]); 
	   end
		
	 end
	 endgenerate

endmodule
