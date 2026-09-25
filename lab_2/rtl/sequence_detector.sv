module sequence_detector (
    input  logic clk,
    input  logic reset,
    input  logic x,
    output logic detect
);

    // Your FSM here
    typedef enum logic [1:0] {
        S0,    // Nothing matched
        S1,    // Matched 1
        S2,    // Matched 10
        S3     // Matched 101
    } state_t;

    state_t state;

    always_ff @(posedge clk) begin
        if (reset) begin
            state  <= S0;
            detect <= 1'b0;
        end
        else begin
            detect <= 1'b0;  // Default: no detection this cycle

            case (state)
                S0: begin
                    if (x)
                        state <= S1;
                    else
                        state <= S0;
                end

                S1: begin
                    if (x)
                        state <= S1;
                    else
                        state <= S2;
                end

                S2: begin
                    if (x)
                        state <= S3;
                    else
                        state <= S0;
                end

                S3: begin
                    if (x) begin
                        detect <= 1'b1;  // Completed 1011
                        state  <= S1;   // Keep final 1 for overlap
                    end
                    else
                        state <= S2;    // 1010 ends in 10
                end

                default: state <= S0;
            endcase
        end
    end

endmodule

