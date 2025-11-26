#include "hev_socks5_tunnel_shim.h"
#include "hev-socks5-tunnel.h"   // from XCFramework headers

int hev_socks5_tunnel_main_shim(const char *path, int fd) {
    return hev_socks5_tunnel_main(path, fd);
}

int hev_socks5_tunnel_main_from_str_shim(const char *str, unsigned int len, int fd) {
    return hev_socks5_tunnel_main_from_str(str, len, fd);
}

void hev_socks5_tunnel_quit_shim(void) {
    hev_socks5_tunnel_quit();
}

void hev_socks5_tunnel_stats_shim(int *tp, int *tb, int *rp, int *rb) {
    hev_socks5_tunnel_stats(tp, tb, rp, rb);
}