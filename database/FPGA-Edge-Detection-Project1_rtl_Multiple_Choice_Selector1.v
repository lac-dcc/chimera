module Multiple_Choice_Selector1(
    input               in_a,    //系统复位，低有效
    input               [15:0] in_a_data  ,    //50Mhz系统时钟
    input               in_b_data,    //系统复位，低有效

    output reg        [15:0]   out_data           //LED输出信号
    );
    
always@(*)
begin

    if(in_a==1)
            out_data<=in_a_data;
    else
            out_data<=~{16{in_b_data}};;
end
 
    
     
/*always @(*) begin
         out_clk<=in_a_clk;
         out_data<=in_a_data;
    if(in_a==1)
        begin
         out_clk<=in_a_clk;
         out_data<=in_a_data;
        end
    else if(in_b==1)
        begin
         out_clk<=in_b_clk;
         out_data<=~{16{in_b_data}};
        end */
    /*else 
        begin
         out_clk<=out_clk;
         out_data<=out_data;
         end  
        
end*/
/*always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
    begin
		out_clk<=in_b_clk;
        out_data<=in_b_data;
    end
	else if(in_a==1)
        begin
         out_clk<=in_b_clk;
         out_data<=in_b_data;
        end
	else
        begin
            out_a <= out_a;
            out_b <= out_b;
        end
end*/

endmodule