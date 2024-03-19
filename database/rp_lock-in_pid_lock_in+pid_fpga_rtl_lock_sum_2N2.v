//////////////////////////////////////////////////////////////////////////////////
//
//
// Keep adding input to memory until clk sums 2**N ticks.
// Then updates the mean and out regs. Out is the sum, mean is the mean of that 2**N values.
//
//
//////////////////////////////////////////////////////////////////////////////////


module sum_2N2
#(parameter R1=8 , R2=8 , N=3)
(
	input  clk, rst, 
	input  wire signed  [R1-1  :0] in1,   // input vl
        output reg  signed  [R1+N-1:0] out1,  // sum  val
        output reg  signed  [R1-1  :0] mean1, // mean val
        input  wire signed  [R2-1  :0] in2,   // input vl
        output reg  signed  [R2+N-1:0] out2,  // sum  val
        output reg  signed  [R2-1  :0] mean2, // mean val
	output wire                    tick  // output tick
);

//signal declaration
reg        [N-1  :0] cnt;
reg        [N-1  :0] cnt_next; 

reg signed [R1-1  :0] mean1_next;
reg signed [R1+N-1:0] sum1, sum1_next, out1_next;

reg signed [R2-1  :0] mean2_next;
reg signed [R2+N-1:0] sum2, sum2_next, out2_next;

wire         state;

localparam  // 2 posible states
        summing     = 1'd0,
        store       = 1'd1;

// body
always @(posedge clk)
	if (rst) begin
                cnt           <=  {N{1'b0}} ;
                mean1         <=  {R1{1'b0}} ;
                sum1          <=  {R1+N{1'b0}} ;
                out1          <=  {R1+N{1'b0}} ;
                mean2         <=  {R2{1'b0}} ;
                sum2          <=  {R2+N{1'b0}} ;
                out2          <=  {R2+N{1'b0}} ;
                
        end
	else begin
		cnt           <=   cnt_next;
                mean1         <=   mean1_next ;
                sum1          <=   sum1_next ;
                out1          <=   out1_next ;
                mean2         <=   mean2_next ;
                sum2          <=   sum2_next ;
                out2          <=   out2_next ;
        end


assign state = &cnt ;

// next-state logic 
always @*
begin
        if(state==1'b0) begin
                cnt_next      = cnt +1'b1  ;
                mean1_next    = mean1;
                sum1_next     = $signed(sum1) + $signed(in1) ;
                out1_next     = out1 ;
                mean2_next    = mean2;
                sum2_next     = $signed(sum2) + $signed(in2) ;
                out2_next     = out2 ;
        end
        else begin
                cnt_next      = {N{1'b0}};
                mean1_next    = $signed(sum1[R1+N-1:N]);
                sum1_next     = $signed( { {N{1'b0}}  , in1 } ) ;
                out1_next     = sum1 ;
                mean2_next    = $signed(sum2[R2+N-1:N]);
                sum2_next     = $signed( { {N{1'b0}}  , in2 } ) ;
                out2_next     = sum2 ;
        end
end


// output logic

assign tick = (cnt=={N{1'b0}}) ;


endmodule
