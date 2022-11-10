module clocked_register(
    out, 
    in, 
    en, 
    res, 
    resval, 
    clk
);
    parameter size = 8;
    input [size-1:0] in;
    input [size-1:0] resval;
    input en, res, clk;
    output [size-1:0] out;
    reg [size-1:0] out;
    always @(posedge clk) begin
        if(en) begin
        out<=in;
        end
        else if(res) begin
        out<=resval;
        end
    end
endmodule
