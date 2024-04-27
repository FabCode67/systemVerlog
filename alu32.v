module alu32 (
    input [31:0] A,
    input [31:0] B,
    input [2:0] Opcode,
    output reg [31:0] Result
);

always @*
    case (Opcode)
        3'b000: Result = A + B; // Addition
        3'b001: Result = A - B; // Subtraction
        3'b010: Result = A & B; // Bitwise AND
        3'b011: Result = A | B; // Bitwise OR
        3'b100: Result = A ^ B; // Bitwise XOR
        3'b101: Result = A << B[4:0]; // Logical shift left by B[4:0] bits
        default: Result = 32'b0; // Default to 0 for unknown opcode
    endcase

endmodule

`timescale 1ns/1ps

module alu32_tb;

// Parameters
parameter WIDTH = 32;
parameter ITERATIONS = 10;

// Inputs
reg [WIDTH-1:0] A;
reg [WIDTH-1:0] B;
reg [2:0] Opcode;

// Output
wire [WIDTH-1:0] Result;

// Instantiate the module
alu32 dut (
    .A(A),
    .B(B),
    .Opcode(Opcode),
    .Result(Result)
);

// Clock
reg clk = 0;

// Toggle clock
always #5 clk = ~clk;

// Testbench
initial begin
    $monitor("Time=%0t, A=%h, B=%h, Opcode=%b, Result=%h", $time, A, B, Opcode, Result);
    
    // Randomize inputs and test
    repeat (ITERATIONS) begin
        A = $random;
        B = $random;
        Opcode = $urandom_range(0, 6); // Randomize opcode between 0 and 5
        
        #10; // Wait a bit
        
        // Display result
        $display("Result: %s", Result);
    end
    
    // End simulation
    $finish;
end

endmodule
