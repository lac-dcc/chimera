module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 

    reg [255:0] q_next;
    reg [3:0] sum;

    always@(posedge clk) begin
        if(load)
            q <= data;
        else begin
            for(int i=0; i<256; i++) begin  //使用阻塞赋值，使sum得出后在该时钟周期内q立即变化，而不需要等到下个周期。
                if(i == 0)  //左上角
                    sum = q[1] + q[16] + q[17] + q[240] + q[241] + q[15] + q[31] + q[255];
                else if(i == 15)    //右上角
                    sum = q[14] + q[16] + q[0] + q[240] + q[254] + q[30] + q[31] + q[255];
                else if(i == 240)   //左下角
                    sum = q[0] + q[15] + q[239] + q[241] + q[1] + q[224] + q[225] + q[255];
                else if(i == 255)   //右下角
                    sum = q[0] + q[15] + q[14] + q[224] + q[238] + q[240] + q[239] + q[254];
                else if(0<i & i<15) //上边界
                    sum = q[i-1] + q[i+1] + q[i+15] + q[i+16] + q[i+17] + q[i+239] + q[i+240] + q[i+241];
                else if(i%16 == 0)  //左边界
                    sum = q[i-1] + q[i+1] + q[i+15] + q[i+16] + q[i+17] + q[i-16] + q[i-15] + q[i+31];
                else if(i%16 == 15) //右边界
                    sum = q[i-1] + q[i+1] + q[i+15] + q[i+16] + q[i-17] + q[i-16] + q[i-15] + q[i-31];
                else if(240<i & i<255)  //下边界
                    sum = q[i-1] + q[i+1] + q[i-17] + q[i-16] + q[i-15] + q[i-239] + q[i-240] + q[i-241];
                else //非边界
                    sum = q[i-1] + q[i+1] + q[i-17] + q[i-16] + q[i-15] + q[i+15] + q[i+16] + q[i+17];
          		
                case(sum) //根据邻居数量判断次态
                    2:q_next[i] = q[i];
                    3:q_next[i] = 1;
                    default:q_next[i] = 0;
                endcase
            end
            	q = q_next;
        end
    end
endmodule
