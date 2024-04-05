module top (
    output [7:0] led,
);

    localparam N = 8;
    integer i;
    
    reg [7:0] arr [0:N-1];
    reg [7:0] ps [0:N-1];

    initial begin
        for(i = 0; i < N; i=i+1)
            arr[i] = i;
    end

    always @* begin
        ps[0] = arr[0];

        for(i = 1; i < N; i=i+1)
            ps[i] = ps[i-1] + arr[i];
    end

    assign led = ps[N-1];

endmodule

