// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module jkff(clk,j,k,q,q_bar);
input clk,reset,j,k;
output reg q,q_bar;

always @ (posedge clk)begin
    if(reset)
        q <= 0;
    else begin
        case({j,k})
            2'b00:
                begin
                    q <= q;
                    q_bar <=~q;
                end
            2'b01:
                begin
                    q <= 0;
                    q_bar <=~q;
                end
            2'b10:
                begin
                    q <= 1;
                    q_bar <=~q;
                end
            2'b11:
                begin
                    q <= ~q;
                    q_bar <=~q;
                end
            default:
                begin
                    q <= q;
                    q_bar <=q_bar;
                end
        endcase
    end
end
                
endmodule