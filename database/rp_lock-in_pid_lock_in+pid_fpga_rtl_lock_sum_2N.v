//////////////////////////////////////////////////////////////////////////////////
//
//
// Keep adding input to memory until clk sums 2**N ticks.
// Then updates the mean and out regs. Out is the sum, mean is the mean of that 2**N values.
//
//
//////////////////////////////////////////////////////////////////////////////////


module sum_2N
#(parameter R=8 , N=3)
(
	input  clk, rst, 
	input  wire signed  [R-1  :0] in,   // input vl
        output reg  signed  [R+N-1:0] out,  // sum  val
        output reg  signed  [R-1  :0] mean, // mean val
	output wire                   tick  // output tick
);

//signal declaration
reg        [N-1  :0] cnt;
reg        [N-1  :0] cnt_next; 

reg signed [R-1  :0] mean_next;
reg signed [R+N-1:0] sum, sum_next, out_next;

wire         state;

localparam  // 2 posible states
        summing     = 1'd0,
        store       = 1'd1;

// body
always @(posedge clk)
	if (rst) begin
                cnt           <=  {N{1'b0}} ;
                mean          <=  {R{1'b0}} ;
                sum           <=  {R+N{1'b0}} ;
                out           <=  {R+N{1'b0}} ;
                
        end
	else begin
		cnt           <=   cnt_next;
                mean          <=   mean_next ;
                sum           <=   sum_next ;
                out           <=   out_next ;
        end


assign state = &cnt ;

// next-state logic 
always @*
begin
        if(state==1'b0) begin
                cnt_next      = cnt +1'b1  ;
                mean_next     = mean;
                sum_next      = $signed(sum) + $signed(in) ;
                out_next      = out ;
        end
        else begin
                cnt_next      = {N{1'b0}};
                mean_next     = $signed(sum[R+N-1:N]);
                sum_next      = $signed( { {N{1'b0}}  , in } ) ;
                out_next      = sum ;
        end
end


// output logic

assign tick = (cnt=={N{1'b0}}) ;


endmodule
