//positive 8-bit ieee-754, adder.
module flotAdd(out,a,b,clk);
    input [7:0]a,b;
    input clk;
    output reg [7:0] out;
    reg [2:0]diff=3'b000;
    reg [4:0]m1,m2 = 5'b000000;
    reg [5:0]sum=6'b000000;
    reg [11:0] shftMant = 12'b000000000000;
    //addtion only for positive numbers
    always@(posedge clk)
        begin
       //check the exponent and assign 
       out[7] = 1'b0;
        if (a[6:4] > b[6:4])
            begin
            diff = a[6:4] - b[6:4];
            //assign the exponent 
            out[6:4] = a[6:4];
            //mantisa shift 
            case (diff) 
            //shftMant is 12 bit
              0:shftMant =(b[6:4] == 3'b000)? {1'b0,b[3:0],7'b0000000} :       {1'b1,b[3:0],7'b0000000};
              1:shftMant =(b[6:4] == 3'b000)? {1'b0,1'b0,b[3:0],6'b000000}:    {1'b0,1'b1,b[3:0],6'b000000};
              2:shftMant =(b[6:4] == 3'b000)? {2'b00,1'b0,b[3:0],5'b00000}:{2'b00,1'b1,b[3:0],5'b00000};
              3:shftMant =(b[6:4] == 3'b000)? {3'b000,1'b0,b[3:0],4'b0000}:{3'b000,1'b1,b[3:0],4'b0000};
              4:shftMant =(b[6:4] == 3'b000)? {4'b0000,1'b0,b[3:0],3'b000}:{4'b0000,1'b1,b[3:0],3'b000};
              5:shftMant =(b[6:4] == 3'b000)? {5'b00000,1'b0,b[3:0],2'b00}:{5'b00000,1'b1,b[3:0],2'b00};
              6:shftMant =(b[6:4] == 3'b000)? {6'b000000,1'b0,b[3:0],1'b0}:{6'b000000,1'b1,b[3:0],1'b0};
              7:shftMant =(b[6:4] == 3'b000)? {7'b0000000,1'b0,b[3:0]}:    {7'b0000000,1'b1,b[3:0]};
            endcase
            //add the mantisa
            m1 = (a[6:4] == 3'b000)?{1'b0,a[3:0]}:{1'b1,a[3:0]};
            m2 = shftMant[11:7]; //5bit
            sum = m1+ m2; //6bit
            //check for mormalisation
            if (sum[5] == 1)
                //we need to normalise, and tune the exponent
                begin
                    out[3:0] = sum[4:1];
                    out[6:4] = a[6:4] + 1; 
                end
            else
            out[3:0] = sum[3:0];
          end
        //b[6:4] > a[6:4]
        else 
            begin
            diff = b[6:4] - a[6:4];
            //assign the exponent
            out[6:4] = b[6:4];
            //mantisa shift 
            case (diff) 
            //shftMant is 12 bit
              0:shftMant =(a[6:4] == 3'b000)? {1'b0,a[3:0],7'b0000000} :       {1'b1,a[3:0],7'b0000000};
              1:shftMant =(a[6:4] == 3'b000)? {1'b0,1'b0,a[3:0],6'b000000}:    {1'b0,1'b1,a[3:0],6'b000000};
              2:shftMant =(a[6:4] == 3'b000)? {2'b00,1'b0,a[3:0],5'b00000}:{2'b00,1'b1,a[3:0],5'b00000};
              3:shftMant =(a[6:4] == 3'b000)? {3'b000,1'b0,a[3:0],4'b0000}:{3'b000,1'b1,a[3:0],4'b0000};
              4:shftMant =(a[6:4] == 3'b000)? {4'b0000,1'b0,a[3:0],3'b000}:{4'b0000,1'b1,a[3:0],3'b000};
              5:shftMant =(a[6:4] == 3'b000)? {5'b00000,1'b0,a[3:0],2'b00}:{5'b00000,1'b1,a[3:0],2'b00};
              6:shftMant =(a[6:4] == 3'b000)? {6'b000000,1'b0,a[3:0],1'b0}:{6'b000000,1'b1,a[3:0],1'b0};
              7:shftMant =(a[6:4] == 3'b000)? {7'b0000000,1'b0,a[3:0]}:    {7'b0000000,1'b1,a[3:0]};
            endcase
            //add the mantisa
            m1 = (b[6:4] == 3'b000)?{1'b0,b[3:0]}:{1'b1,b[3:0]};
            m2 = shftMant[11:7]; //5bit
            sum = m1+ m2; //6bit
            //check for mormalisation
            if (sum[5] == 1)
                //we need to normalise, and tune the exponent
                begin
                    out[3:0] = sum[4:1];
                    out[6:4] = b[6:4] + 1; 
                end
            else
            out[3:0] = sum[3:0];
            end
         end
        endmodule