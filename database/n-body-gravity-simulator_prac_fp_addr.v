// This program was cloned from: https://github.com/aniketuppin/n-body-gravity-simulator
// License: Apache License 2.0

module fp_addr (
                clk,
                rst,
                first,
                second,
                out
                );

   input wire [26:0] first;
   input wire [26:0] second;
   input wire        clk;
   input wire        rst;
   
   output reg [26:0] out;
   
   wire [7:0]        res_expt;
   wire [17:0]       res_mant;  
   wire [26:0]       greater;
   wire [26:0]       smaller;
   wire [7:0]        shift_fac;
   reg [51:0]        pip1;   //{shift_fac,greater,lesser,expt_net}
   reg [18:0]        addr_out;
   reg [18:0]        shifted_val;
   wire [7:0]        first_expt;
   wire [7:0]        second_expt;
   wire [17:0]       first_mant;
   wire [17:0]       second_mant;
   reg [7:0]         carry_shift_1;
   
   assign greater = (first[25:18] >= second[25:18]) ? first: second;
   assign smaller = (first[25:18] >= second[25:18]) ? second: first;
   assign {first_expt,first_mant} = first[25:0];
   assign {second_expt,second_mant} = second[25:0];
   always @(posedge clk or negedge rst)
     begin
        if (rst == 1'b0)
          begin
             pip1 <= 'b0;
          end
        else
          begin
             pip1 <= {greater[25:18] - smaller[25:18],greater[17:0],smaller[17:0],(greater[25:18])};
          end // else: !if(rst == 1'b0)
     end // always @ (posedge clk or negedge rst)
   
   always @(*)
     begin
        if (pip1[51:44] <= 5'd18)
          begin
             shifted_val <= {1'b1,pip1[25:8]}>>pip1[51:44];
          end
        else
          begin
             shifted_val <= 'b0;
          end
     end

   always @(*)
     begin
        addr_out <= ({1'b1,pip1[43:26]} + {shifted_val});
     end

   always @(*)
     begin
        carry_shift_1 <= pip1[7:0] + 'b1;
     end
   
   always @(*)
     begin
        if (addr_out[18] == 'b0)
          begin
             out <= {1'b0,pip1[7:0],addr_out[17:0]};
          end
        else
          begin
             out <= {1'b0,carry_shift_1,1'b0,addr_out[17:1]};
          end
     end
   assign {res_expt,res_mant} = out[25:0];
endmodule
