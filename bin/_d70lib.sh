# _d70lib.sh — shared helpers. Source it, don't run it.
#
# THE PTPCAMERAD RACE
# -------------------
# macOS runs /usr/libexec/ptpcamerad as a LaunchAgent that claims any PTP camera
# the instant it enumerates. Two things I got wrong the first time:
#
#   * A single `killall` is not enough. launchd restarts it immediately, so
#     `killall ptpcamerad; sleep 1` is actively counterproductive — the sleep
#     hands the window straight back.
#   * You cannot unload the agent. `launchctl bootout gui/$(id -u)/com.apple.ptpcamerad`
#     fails with "Operation not permitted while System Integrity Protection is
#     engaged", and SIP is on by default.
#
# What works is winning the race: SIGKILL and claim the interface with no gap.
# In practice this succeeds on the first attempt. d70_gp retries anyway.

d70_free() { killall -9 ptpcamerad 2>/dev/null || true; }

# d70_gp <gphoto2 args…>
# Retries only when gphoto2 dies fast, which is what a lost claim looks like.
# A long-running command that fails after doing real work is returned as-is.
d70_gp() {
  local tries="${D70_RETRIES:-20}" i start elapsed rc
  for (( i = 1; i <= tries; i++ )); do
    killall -9 ptpcamerad 2>/dev/null
    start=$SECONDS
    gphoto2 "$@"
    rc=$?
    (( rc == 0 )) && return 0
    elapsed=$(( SECONDS - start ))
    # Ran for a while then failed → a real error, not a lost claim.
    (( elapsed > 3 )) && return $rc
  done
  return $rc
}

# Same, but silent — for probing.
d70_gp_q() { d70_gp "$@" >/dev/null 2>&1; }
