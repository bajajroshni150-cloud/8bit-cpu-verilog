// ALU - performs Add, Sub, AND, OR based on sel input
// sel = 00 -> Add, 01 -> Sub, 10 -> AND, 11 -> OR

module alu(
    input [7:0] a,
    input [7:0] b,
    input [1:0] sel,
    output reg [7:0] result,
    output reg cout
);

always @(*) begin
    case(sel)
        2'b00:  {cout, result} = a + b;  // addition, extra bit for carry
        2'b01: {cout, result} = a - b;   // subtraction (uses 2's complement internally)
        2'b10: begin
          result = a & b;
           cout = 0;  // no carry concept for AND
        end
        2'b11: begin
            result = a | b;
            cout = 0;   // no carry concept for OR
        end
    endcase
end

endmodule
