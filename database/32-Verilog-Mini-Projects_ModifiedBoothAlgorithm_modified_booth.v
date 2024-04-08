module MBA_module(p,a,b,clock);
    output [15:0] p;
    input [7:0]  a, b;
    input clock;
    reg [15:0] p,ans;

    integer i, lookup_tbl;
    integer operate;

    initial
    begin
        p=16'b0;
        ans=16'b0;
    end

    always @(negedge clock)
    begin
        p=16'b0;
        for(i=1;i<=7;i=i+2)
        begin
            if(i==1)
                lookup_tbl = 0;
            else
                lookup_tbl = b[i-2];

            lookup_tbl = lookup_tbl + 4*b[i] + 2*b[i-1]; 

            if(lookup_tbl == 0 || lookup_tbl == 7)
                operate = 0;
            else if(lookup_tbl == 3 || lookup_tbl == 4)
                operate = 2;
            else
                operate = 1;
            if(b[i] == 1)
                operate = -1*operate;

            case(operate)
            1:
                begin
                    ans=a;
                    ans=ans<<(i-1);
                    p=p+ans;
                end
            2:
                begin
                    ans=a<<1;
                    ans=ans<<(i-1);
                    p=p+ans;
                end
            -1:
                begin
                    ans=~a+1;
                    ans=ans<<(i-1);
                    p=p+ans;
                end
            -2:
                begin
                    ans=a<<1;
                    ans=~ans+1;
                    ans=ans<<(i-1);
                    p=p+ans;
                end
            endcase
        end
    end
endmodule

