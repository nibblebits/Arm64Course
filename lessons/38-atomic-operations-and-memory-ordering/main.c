#include <inttypes.h>
#include <pthread.h>
#include <stdatomic.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

enum {
    thread_count = 4,
    increments_per_thread = 100000
};

struct WorkerContext {
    _Atomic uint64_t *counter;
    uint64_t iterations;
};

extern void atomic_increment(_Atomic uint64_t *counter, uint64_t iterations);

static void *run_worker(void *argument)
{
    struct WorkerContext *context = argument;
    atomic_increment(context->counter, context->iterations);
    return NULL;
}

int main(void)
{
    _Alignas(8) _Atomic uint64_t counter = 0;
    pthread_t threads[thread_count];
    struct WorkerContext contexts[thread_count];

    for (size_t index = 0; index < thread_count; ++index) {
        contexts[index].counter = &counter;
        contexts[index].iterations = increments_per_thread;

        if (pthread_create(&threads[index], NULL, run_worker, &contexts[index]) != 0) {
            fputs("pthread_create failed\n", stderr);
            return EXIT_FAILURE;
        }
    }

    for (size_t index = 0; index < thread_count; ++index) {
        if (pthread_join(threads[index], NULL) != 0) {
            fputs("pthread_join failed\n", stderr);
            return EXIT_FAILURE;
        }
    }

    const uint64_t expected = (uint64_t)thread_count * increments_per_thread;
    const uint64_t actual = atomic_load_explicit(&counter, memory_order_relaxed);

    printf("Atomic counter: %" PRIu64 "\n", actual);
    printf("Expected:       %" PRIu64 "\n", expected);

    return actual == expected ? EXIT_SUCCESS : EXIT_FAILURE;
}

