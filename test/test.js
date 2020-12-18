var assert = require("assert");
import todo from "../dist/isrtl";

describe("Package", function () {
  it("works", ()=>{
    assert.equal(todo(), 42);
  });
});
