#pragma once

#include "memcache_client.h"
#include "memcache_client.h"

namespace evmc {

class VbucketConfig;

class MemcacheClientPool {
public:
    MemcacheClientPool(const char* vbucket_conf, int concurrency, int timeout_ms) 
            : vbucket_conf_file_(vbucket_conf), loop_pool_(&loop_, concurrency)
            , timeout_ms_(timeout_ms), vbucket_config_(NULL) {
    }
    virtual ~MemcacheClientPool();

    bool Start();

    void Set(EventLoopPtr caller_loop, const std::string& key, const std::string& value, SetCallback callback);
    void Set(EventLoopPtr caller_loop, const char* key, const char* value, size_t val_len, uint32_t flags,
                  uint32_t expire, SetCallback callback);

    void Remove(EventLoopPtr caller_loop, const char* key, RemoveCallback callback);
    void Get(EventLoopPtr caller_loop, const char* key, GetCallback callback);
    void MultiGet(EventLoopPtr caller_loop, const std::vector<std::string>& keys, MultiGetCallback callback);
private:
    // noncopyable
    MemcacheClientPool(const MemcacheClientPool&);
    const MemcacheClientPool& operator=(const MemcacheClientPool&);

private:
    static void OnClientConnection(const evpp::TCPConnPtr& conn, MemcacheClientPtr memc_client);
    void LaunchCommand(CommandPtr command);

private:
    void DoLaunchCommand(CommandPtr command);

    thread_local static std::map<std::string, MemcacheClientPtr> memc_clients_;
    std::string vbucket_conf_file_;
    evpp::EventLoop loop_;
    evpp::EventLoopThreadPool loop_pool_;
    int timeout_ms_;
    VbucketConfig * vbucket_config_;
};

}

