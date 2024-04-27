module fullAdder (
    input [31:0] A,  // 32-bit input A
    input [31:0] B,  // 32-bit input B
    input [31:0] C,  // 32-bit input C
    input Cin,       // Carry input
    output [31:0] Sum,  // 32-bit sum output
    output Cout       // Carry output
);

assign {Cout, Sum} = A + B + C + Cin;

endmodule


`timescale 1ns/1ps

module fullAdder_tb;

// Parameters
parameter WIDTH = 32;
parameter ITERATIONS = 10;

// Inputs
reg [WIDTH-1:0] A;
reg [WIDTH-1:0] B;
reg [WIDTH-1:0] C;
reg Cin;

// Outputs
wire [WIDTH-1:0] Sum;
wire Cout;

// Instantiate the module
fullAdder dut (
    .A(A),
    .B(B),
    .C(C),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);

// Clock
reg clk = 0;

// Toggle clock
always #5 clk = ~clk;

// Testbench
initial begin
    $monitor("Time=%0t, A=%b, B=%b, C=%b, Cin=%b, Sum=%b, Cout=%b", $time, A, B, C, Cin, Sum, Cout);
    
    // Randomize inputs and test
    repeat (ITERATIONS) begin
        A = 1;
        B = 3;
        C = 1;
        Cin = 0;
        
        #10; // Wait a bit
        
        // Display result
        $display("Result: Sum=%h, Cout=%b", Sum, Cout);
    end
    
    // End simulation
    $finish;
end

endmodule