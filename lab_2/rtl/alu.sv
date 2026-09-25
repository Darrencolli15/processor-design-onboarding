module alu (
    input  logic [7:0] a,
    input  logic [7:0] b,
    input  logic [2:0] op,
    output logic [7:0] result
);

    // Your logic here
    always_comb begin
        case (op)
            3'd0: result = a + b;    // ADD
            3'd1: result = a - b;    // SUB
            3'd2: result = a & b;    // AND
            3'd3: result = a | b;    // OR
            3'd4: result = a ^ b;    // XOR
            default: result = 8'd0;
        endcase
    end 

endmodule

