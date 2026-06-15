import { connect, writeContracts, readContracts, mountNetworkSelector, net } from "../../shared/app.js";
mountNetworkSelector("net");
const out = (m) => (document.getElementById("out").textContent = m);
const val = (id) => document.getElementById(id).value.trim();
let signer, wc;
document.getElementById("connect").onclick = async () => {
  try { ({ signer } = await connect()); wc = writeContracts(signer);
    document.getElementById("who").textContent = "Connected: " + (await signer.getAddress()) + " · " + net().label;
  } catch (e) { out(String(e.message || e)); }
};
document.getElementById("register").onclick = async () => {
  // TODO(member1): const tx = await wc.issuers.registerInstitution(val("issuerAddr")); await tx.wait(); out("registered");
  out("TODO(member1): implement registerInstitution call");
};
document.getElementById("revoke").onclick = async () => {
  // TODO(member1): call wc.issuers.deregisterInstitution(val("issuerAddr")) and await it
  out("TODO(member1): implement deregisterInstitution call");
};
document.getElementById("check").onclick = async () => {
  // TODO(member1): const ok = await readContracts().issuers.isInstitution(val("checkAddr")); out(ok ? "registered" : "not");
  out("TODO(member1): implement isInstitution read");
};
