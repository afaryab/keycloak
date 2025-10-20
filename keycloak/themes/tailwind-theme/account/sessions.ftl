<#import "template.ftl" as layout>
<@layout.mainLayout active='sessions' bodyClass='sessions'; section>
    <#if section = "content">
        <div class="bg-white shadow sm:rounded-lg">
            <div class="px-4 py-5 sm:p-6">
                <div class="flex items-center justify-between mb-6">
                    <div>
                        <h3 class="text-lg leading-6 font-medium text-gray-900">
                            ${msg("sessionsTitle")}
                        </h3>
                        <p class="mt-1 text-sm text-gray-600">
                            ${msg("sessionsDescription")}
                        </p>
                    </div>
                    <#if sessions?has_content && sessions?size gt 1>
                        <form action="${url.sessionsLogoutUrl}" method="post">
                            <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
                            <button type="submit" 
                                    class="inline-flex items-center px-4 py-2 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500">
                                ${msg("signOutAllButton")}
                            </button>
                        </form>
                    </#if>
                </div>

                <#if sessions?has_content>
                    <div class="mt-6 flow-root">
                        <ul role="list" class="-my-5 divide-y divide-gray-200">
                            <#list sessions as session>
                                <li class="py-4">
                                    <div class="flex items-center space-x-4">
                                        <div class="flex-shrink-0">
                                            <svg class="h-8 w-8 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
                                            </svg>
                                        </div>
                                        <div class="flex-1 min-w-0">
                                            <div class="flex items-center justify-between">
                                                <p class="text-sm font-medium text-gray-900 truncate">
                                                    ${session.browser!}
                                                    <#if session.current>
                                                        <span class="ml-2 inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-primary-100 text-primary-800">
                                                            ${msg("currentSession")}
                                                        </span>
                                                    </#if>
                                                </p>
                                            </div>
                                            <div class="mt-1 flex items-center text-sm text-gray-500">
                                                <svg class="flex-shrink-0 mr-1.5 h-4 w-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/>
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
                                                </svg>
                                                ${session.ipAddress!}
                                            </div>
                                            <div class="mt-1 flex items-center text-sm text-gray-500">
                                                <svg class="flex-shrink-0 mr-1.5 h-4 w-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                                </svg>
                                                ${msg("started")}: ${session.started}
                                                <#if session.lastAccess??>
                                                    <span class="ml-4">${msg("lastAccess")}: ${session.lastAccess}</span>
                                                </#if>
                                            </div>
                                            <#if session.clients?has_content>
                                                <div class="mt-2 flex flex-wrap gap-2">
                                                    <#list session.clients as client>
                                                        <span class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-gray-100 text-gray-800">
                                                            ${client}
                                                        </span>
                                                    </#list>
                                                </div>
                                            </#if>
                                        </div>
                                        <#if !session.current>
                                            <div>
                                                <form action="${url.sessionsUrl}" method="post">
                                                    <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
                                                    <input type="hidden" name="session" value="${session.id}">
                                                    <button type="submit" 
                                                            class="inline-flex items-center px-3 py-2 border border-gray-300 shadow-sm text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500">
                                                        ${msg("doSignOut")}
                                                    </button>
                                                </form>
                                            </div>
                                        </#if>
                                    </div>
                                </li>
                            </#list>
                        </ul>
                    </div>
                <#else>
                    <div class="text-center py-12">
                        <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
                        </svg>
                        <h3 class="mt-2 text-sm font-medium text-gray-900">${msg("sessionsTitle")}</h3>
                        <p class="mt-1 text-sm text-gray-500">${msg("sessionsDescription")}</p>
                    </div>
                </#if>
            </div>
        </div>
    </#if>
</@layout.mainLayout>
