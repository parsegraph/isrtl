const assert = require("assert");
import isRTL from "../src/index";

describe("isRTL", function () {
  it("works", () => {
    assert.equal(isRTL("a"), false);
    assert.equal(isRTL(" "), false);
    assert.equal(isRTL("ערב טוב"), true);
  });
});
