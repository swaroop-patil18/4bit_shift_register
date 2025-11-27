module shift_register_siso_sipo_tb;
    reg clk;
    reg reset;
    reg data_in;
    wire data_out;
    wire [3:0] parallel_out;

    shift_register_siso_sipo uut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .data_out(data_out),
        .parallel_out(parallel_out)
    );

    // Generate clock: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        reset = 1;
        data_in = 0;
        #10;
        reset = 0;

        // Send 1011 serial
        data_in = 1; #10;
        data_in = 0; #10;
        data_in = 1; #10;
        data_in = 1; #10;

        // Observe both outputs
        data_in = 1; #10;
        data_in = 0; #10;
        data_in = 1; #10;
        data_in = 0; #10;

        // Reset and check outputs
        reset = 1; #10; reset = 0; #10;

        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("time=%0t | reset=%b | data_in=%b | SISO_out=%b | SIPO_out=%b", $time, reset, data_in, data_out, parallel_out);
    end
endmodule
