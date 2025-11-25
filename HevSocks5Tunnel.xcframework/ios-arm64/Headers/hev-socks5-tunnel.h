#ifndef HEV_SOCKS5_TUNNEL_H
#define HEV_SOCKS5_TUNNEL_H

#include <stddef.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct _HevListNode HevListNode;

int hev_socks5_tunnel_main(const char *config_path, int tun_fd);
int hev_socks5_tunnel_main_from_file(const char *config_path, int tun_fd);
int hev_socks5_tunnel_main_from_str(const char *config, uint32_t config_len, int tun_fd);

int hev_socks5_tunnel_init(int tun_fd);
int hev_socks5_tunnel_run(void);
void hev_socks5_tunnel_stop(void);
void hev_socks5_tunnel_fini(void);

void hev_socks5_tunnel_stats(size_t *tx_packets, size_t *tx_bytes, size_t *rx_packets, size_t *rx_bytes);
void hev_socks5_tunnel_update_session(HevListNode *node);
void hev_socks5_tunnel_quit(void);

#ifdef __cplusplus
}
#endif

#endif /* HEV_SOCKS5_TUNNEL_H */
