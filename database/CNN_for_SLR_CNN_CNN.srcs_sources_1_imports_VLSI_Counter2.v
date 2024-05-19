// This program was cloned from: https://github.com/ilaydayaman/CNN_for_SLR
// License: BSD 2-Clause "Simplified" License

module Counter2(
    input clk,
    input start,
    input reset,
    output reg [3:0] count1,
    output reg [3:0] count2,
    output reg done
    );
    
    parameter mod = 9;
    
    always @ ( posedge clk )
    begin
        if( reset || ~start )
        begin
            count1 <= 0;
            count2 <= 0;
            done <= 0;
        end else if ( start )
        begin
            if( count2 < mod-1 )
            begin
                if( count1 < mod-1 )
                begin
                    count1 <= count1 + 1;
                    done <= 0;
                end else
                begin
                    count1 <= 0;
                    count2 <= count2 + 1;
                    done <= 0;
                end
            end else if ( count2 == mod-1 )
            begin
                if( count1 < mod - 2 )
                    begin
                        count1 <= count1 + 1;
                        done <= 0;
                    end else if ( count1 == mod - 2 )
                    begin
                        count1 <= count1 + 1;
                        done <= 1;
                    end
                    else
                    begin
                        count1 <= 0;
                        count2 <= 0;
                        done <= 0;
                    end
            end
        end
    end
endmodule