`timescale 1ns/10ps
`default_nettype wire

// Classic SAR algorithm + Offset calibration.

module sarlogic(
    input           clk,
    input           rstn,
    input           en,
    input           comp,
    input           cal,
    output          valid,
    output  [9:0]   result,
    output  		sample,
    output  [9:0]   ctlp,
    output  [9:0]   ctln,
    output  [4:0]   trim,
    output  [4:0]   trimb,
    output          clkc);

    reg             calibrate;
    reg     [2:0]   state;
    reg     [9:0]   mask;
    reg     [4:0]   trim_mask;
    reg     [9:0]   result;
    reg     [4:0]   trim_val;
    reg             sample;
    reg             co_clk;
    reg             en_co_clk;
    reg     [3:0]   cal_count;
    reg     [3:0]   cal_itt;

    parameter sInit=0, sWait=1, sSample=2, sConv=3, sDone=4, sCal=5;

    initial begin
        state <= sInit;
        mask <= 0;
        trim_mask <= 0;
        result <= 0;
        co_clk <= 0;
        en_co_clk <= 0;
        cal_itt <= 0;
        cal_count <= 7;
        trim_val <= 0;
        calibrate <= 0;
    end

    always @(clk) begin
        clkc <= (~clk & en_co_clk);
    end

    always @(posedge clk or negedge rstn) begin

        if (!rstn) begin
            state <= sInit;
            mask <= 0;
            trim_mask <= 0;
            result <= 0;
            co_clk <= 0;
            en_co_clk <= 0;
            cal_itt <= 0;
            cal_count <= 7;
            trim_val <= 0;
            calibrate <= 0;
        end
        else begin
            case (state)

                sInit : begin
                    trim_val <= 5'b10000;
                    state <= sWait;
                end

                sWait : begin
                    if(en) begin
                        result <= 0;
                        cal_itt <= 0;
                        cal_count <= 7;
                        state <= sSample;
                        calibrate <= cal;
		    		    mask <= 10'b1000000000;
                        en_co_clk <= 1;
                    end
                    else state <= sWait;
                end

		    	sSample : begin
                    if (calibrate) begin
                        state <= sCal;
                        trim_val <= 5'b00000;
		    		    trim_mask <= 5'b10000;
                    end
                    else begin
                        state <= sConv;
                    end
		    	end

                sConv : begin
                	if (comp) result  <= result | mask;
                    mask <= mask >> 1;                
                    if (mask[0]) begin
                        state <= sDone;
                        en_co_clk <=0;
                    end
                end

                sCal: begin
                    if(cal_itt == 7) begin
                        if (cal_count > 7) begin
                            trim_val <= trim_val | trim_mask;
                        end
                        trim_mask <= trim_mask >> 1;
                        if (trim_mask[0]) begin
                            state <= sDone;
                            en_co_clk <=0;
                            calibrate <= 0;
                        end else begin
                            cal_itt = 0;
                            state <= sCal;
                        end 
                        cal_count <= 7;
                    end else begin
                        if (comp) begin
                            cal_count <= cal_count - 1;
                        end else begin
		    				cal_count <= cal_count + 1;
                        end
                        cal_itt <= cal_itt + 1;
                    end 
                end

                sDone : begin
                    state <= sWait;
                end

            endcase
        end
    end

    assign trim   = (trim_val | trim_mask );
    assign trimb  = ~(trim_val | trim_mask);
    assign sample = (state==sSample) || (state==sCal);
    assign valid  = state==sDone;
	assign ctlp   = result | mask;
	assign ctln   = ~(result | mask);

endmodule
