
module outputNetwork  #(parameter K=10,X=K-1,M=K-1,S=0) (in,out);

	input [K-1:0] in;
	output [M-1:0] out;
	
	genvar i;
	generate
		for(i=0; i<M; i=i+1) begin: OUT
		
			if( (i+S+X-1) < K ) begin
			
				(*KEEP_HIERARCHY="TRUE"*)
				xor_vec #(.X(X)) XG(
					.x(in[(i+S+X-1)%K:i]), 
					.y(out[i])
				);
				
				initial 
			  $display ("<in[%d:%d]>", (i+S+X-1)%K, i);
				
			end else begin
			
				(*KEEP_HIERARCHY="TRUE"*)
				xor_vec #(.X(X)) XG(
					.x({in[K-1:i],in[(i+S+X-1)%K:0]}), 
					.y(out[i])
				);
				
			  initial 
			  $display ("<in[%d:%d] in[%d:0]>",K-1,i,(i+S+X-1)%K);
			end
			
		end
	endgenerate


endmodule
