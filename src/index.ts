import rtlDetect from "rtl-detect";

const ltrChars =
  "A-Za-z\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u02B8\u0300-\u0590\u0800-\u1FFF" +
  "\u2C00-\uFB1C\uFDFE-\uFE6F\uFEFD-\uFFFF";
const rtlChars = "\u0591-\u07FF\uFB1D-\uFDFD\uFE70-\uFEFC";
const rtlDirCheck = new RegExp("^[^" + ltrChars + "]*[" + rtlChars + "]");

export const isBrowserRTL = () => {
  const locale = require("browser-locale")();
  return rtlDetect.isRtlLang(locale);
};

export default function isRTL(s: string): boolean {
  return rtlDirCheck.test(s) || isBrowserRTL();
}
